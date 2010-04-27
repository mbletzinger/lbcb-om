#!/usr/bin/perl 

use IO::Socket::INET;


my ($host, $port) = ("cee-neesstit1.cee.illinois.edu","6342");
#my ($host, $port) = ("192.168.1.101","5057");

my $socket = new IO::Socket::INET(
		PeerAddr => $host,
		PeerPort => $port,
		Proto     => 'tcp',
	);

die "Connection to $host:$port failed because $!" unless defined $socket;

sendCommand("open-session dummySession");
receiveCommand();

sendCommand("set-parameter dummySetParam	nstep	0");
receiveCommand();


my $increment = "1.0";
for my $i (1..500) {
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime(time);
	$year += 1900;
	$month++;
	print "$mon/$mday/$year";
	sendCommand("propose\ttrans$year$month$mday$hour$min$sec.320\tMDL-00-01\tx\tdisplacement\t$increment");
	receiveCommand();
	sendCommand("execute\ttrans$year$month$mday$hour$min$sec.320");
	receiveCommand();
	sendCommand("get-control-point\tdummy\tMDL-00-01:LBCB1");
	receiveCommand();
	sendCommand("get-control-point\tdummy\tMDL-00-01:ExternalSensors");
	receiveCommand();
	$increment = $increment eq "1.0" ? "-1.0" : "1.0";
	sleep 3;
}

sendCommand("close-session	dummy");
receiveCommand();

close $socket;

sub sendCommand {
	my ($cmd) = @_;
	print "Sending [$cmd]";
	print $socket $cmd,  "\015\012";

}

sub receiveCommand {
	my $result = <$socket>;
	chomp $result;
	print "Received [$result]\n";
}

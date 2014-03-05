#!/usr/bin/perl 

use IO::Socket::INET;
use Getopt::Long;

my $option = 0;
my $lbcb = 1;
my $result = GetOptions("option=i"=>\$option,"lbcb=i"=>\$lbcb);
#my ($host, $port) = ("127.0.0.1","6347");
my ($host, $port) = ("128.174.15.156","6347");
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

print "Option=$option\n";

my $increment = "1.0";
for my $i (1..4) {
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime(time);
	$year += 1900;
	$month++;
#	print "$mon/$mday/$year";
	my $propose = "propose\ttrans$year$month$mday$hour$min$sec.320[$i 0 4]\tMDL-00-01:LBCB1\tx\tdisplacement\t$increment";
	$propose = $propose . "\tMDL-00-01:LBCB2\tx\tdisplacement\t$increment" if $lbcb > 1;
	sendCommand($propose);
	last if ($option == 1 && $i > 3);
	if(receiveCommand()) {
	  print "ABORTING PROPOSE COMMAND\n";
          next;
        }
	last if ($option == 2 && $i > 3);
	sendCommand("execute\ttrans$year$month$mday$hour$min$sec.320[$i 0 4]");
	last if ($option == 3 && $i > 3);
	if(receiveCommand()) {
	  print "ABORTING EXECUTE COMMAND\n";
          next;
        }
	last if ($option == 4 && $i > 3);
	sendCommand("get-control-point\tdummy\tMDL-00-01:LBCB1");
	last if ($option == 5 && $i > 3);
	receiveCommand();
	if ($lbcb > 1) {
	  sendCommand("get-control-point\tdummy\tMDL-00-01:LBCB2");
	  receiveCommand();
	}
	sendCommand("get-control-point\tdummy\tMDL-00-01:ExternalSensors");
	receiveCommand();
	last if ($option == 6 && $i > 3);
	$increment = $increment eq "1.0" ? "-1.0" : "1.0";
	sleep 3;
}

sendCommand("close-session	dummy");
sleep 2;
close $socket;

sub sendCommand {
  my ($cmd) = @_;
  print "Sending [$cmd]\n";
  print $socket $cmd,  "\015\012";
  sleep 2;
}

sub receiveCommand {
  my $result = <$socket>;
  chomp $result;
  print "Received [$result]\n";
  return $result =~ m!NOK!;
}

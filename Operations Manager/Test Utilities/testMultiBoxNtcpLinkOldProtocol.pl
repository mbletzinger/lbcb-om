#!/usr/bin/perl 

use IO::Socket::INET;
use File::Spec;
use Cwd;

#my ($host, $port) = ("cee-neessmom2.cee.illinois.edu","6342");
#my ($host, $port) = ("cee-neesstit1.cee.illinois.edu","6342");
my ($host, $port) = ("130.126.242.3","6342");
my $cwd =cwd();
my @dirs = File::Spec->splitdir($cwd);
my $dropped = pop @dirs;
my $pwd = File::Spec->catdir(@dirs);
$| = 1;
print "Connecting to $host:$port...";
my $socket = new IO::Socket::INET(
		PeerAddr => $host,
		PeerPort => $port,
		Proto     => 'tcp',
	);

die "Connection to $host:$port failed because $!" unless defined $socket;
print "...done\n";

sendCommand("open-session dummySession");
receiveCommand();

sendCommand("set-parameter dummySetParam	nstep	0");
receiveCommand();

my $increment = 0.0;
my $stepUp = 1;
for my $i (1..50) {
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst)=localtime(time);
	$year += 1900;
	$month++;
	print "$mon/$mday/$year";
	sendCommand("propose\ttrans$year$month$mday$hour$min$sec.320" . 
"\tMDL-00-01:LBCB1\tx\tdisplacement\t$increment\ty\tdisplacement\t0.0");
	receiveCommand();
	sendCommand("propose\ttrans$year$month$mday$hour$min$sec.320" . 
"\tMDL-00-01:LBCB2\tx\tdisplacement\t$increment\ty\tdisplacement\t0.0");
	receiveCommand();
	sendCommand("execute\ttrans$year$month$mday$hour$min$sec.320");
	receiveCommand();
	sendCommand("get-control-point\tdummy\tMDL-00-01:LBCB1");
	receiveCommand();
	sendCommand("get-control-point\tdummy\tMDL-00-01:LBCB2");
	receiveCommand();
	sendCommand("get-control-point\tdummy\tMDL-00-01:ExternalSensors");
	receiveCommand();
        if ($stepUp) {
          if ($increment >= 0.4) {
            $stepUp = 0;
          }
        } else {
          if ($increment <= -0.4) {
            $stepUp = 1;
          }
        }

        if ($stepUp) {
          $increment += 0.1;
        } else {
          $increment += -0.1;
        }
	sleep 3;
}

sendCommand("close-session	dummy");
receiveCommand();

close $socket;

sub sendCommand {
	my ($cmd) = @_;
	print "Sending [$cmd]";
	print $socket $cmd, "\015\012";
	#print $socket $cmd, "\n";

}

sub receiveCommand {
	my $result = <$socket>;
	chomp $result;
	print "Received [$result]\n";
}

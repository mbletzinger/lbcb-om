#!/usr/bin/perl 

use IO::Socket::INET;
use File::Spec;
use Cwd;

my ($host, $port) = ("cee-neessmom2.cee.illinois.edu","6342");
#my ($host, $port) = ("cee-neesit1.cee.illinois.edu","6342");
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

sendCommand("startXXX");

my $increment = 0.0;
my $stepUp = 1;
for my $i (1..50) {
	sendCommand("ABC$stepUp");
	sleep 3;
        $stepUp++;
}

sendCommand("endXXX");

close $socket;

sub sendCommand {
	my ($cmd) = @_;
	print "Sending [$cmd]\n";
	print $socket $cmd, "\015\012";
	#print $socket $cmd, "\n";

}

sub receiveCommand {
	my $result = <$socket>;
	chomp $result;
	print "Received [$result]\n";
}

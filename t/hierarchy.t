#!perl -T

use strict;
use warnings;

use Test::More tests => 6;
use GRNOC::Log;
use Data::Dumper;
use lib './t/';
use FindBin;

$ENV{PATH} =~ /(.*)/;
$ENV{PATH} = $1;
`/bin/rm /tmp/GRNOC-Log-Test.log`;

use Tester;

my $grnoc_logger = GRNOC::Log->new( config => $FindBin::Bin . "/../conf/config.conf" );
my $tester = Tester->new();

ok(defined($tester), "Tester was defined");

ok(defined($tester->{'logger'}), "Test Logger was defined");

ok($tester->{'logger'}->is_info(), "Test Logger is set to INFO");

ok(!$tester->{'logger'}->is_debug(), "Test Logger is not set to DEBUG");

$tester->test5();

$tester->test6();

sleep(10);

open( FILE, "<", "/tmp/GRNOC-Log-Test.log") or die $!;

while(my $line = <FILE>){

    if($line =~ /Test6/){
	ok(1 == 2, "Logged in DEBUG when we should have only logged in INFO");
    }elsif($line =~ /Test5/){
	#[2012/04/26 14:45:09] t//Tester.pm 24 Tester - Test5
	like($line, qr/\[\d\d\d\d\/\d\d\/\d\d \d\d\:\d\d\:\d\d\] t\/\/Tester.pm 24 Tester - Test5/,"Logged Test5 properly");
    }

}

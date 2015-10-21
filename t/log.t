#!perl -T

use strict;
use warnings;
use Test::More tests => 4;
use FindBin;
use GRNOC::Log;
use Data::Dumper;

my $busted_logger = GRNOC::Log->new();
ok(!defined($busted_logger),"Expected an error without a config!");

my $grnoc_logger = GRNOC::Log->new( config => $FindBin::Bin . "/../conf/config.conf");
ok(defined($grnoc_logger), "Was able to instantiate Logger");

my $logger = $grnoc_logger->get_logger();
ok(defined($logger), "Was able to get ahold of root Logger");

ok($logger->is_debug(), "Logger is in Debug mode");

#!perl -T

use Test::More tests => 1;

BEGIN {
        use_ok( 'GRNOC::Log' );
}
diag( "Testing GRNOC::Log $GRNOC::Log::VERSION, Perl $], $^X" );

#!perl -T

use strict;
use warnings;

use GRNOC::Log;
use Data::Dumper;
use FindBin;

package Tester;

sub new{
    my $that = shift;
    my $class = ref($that) || $that;
    my %args = (@_);
    my $self = \%args;
    bless($self,$class);
    $self->{'logger'} = GRNOC::Log->get_logger();
    return $self;
}

sub test5{
    my $self = shift;
    $self->{'logger'}->info("Test5");
}

sub test6{
    my $self = shift;
    $self->{'logger'}->debug("Test6");
}

1;

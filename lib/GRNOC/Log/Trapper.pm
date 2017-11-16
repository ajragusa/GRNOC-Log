package GRNOC::Log::Trapper;

use strict;
use warnings;

use Log::Log4perl;

=head1 GRNOC::Log::Trapper

Trapps messages to a filehandle and sends them to Log4perl
specifically this is used for STDERR and STDOUT!

=cut


=head2 TIEHANDLE

    hook us up to tie

=cut

sub TIEHANDLE {
    my $class = shift;
    bless [], $class;
}

=head2 PRINT

    obviously print it to log4perl

=cut

sub PRINT {
    my $self =shift;
    $Log::Log4perl::caller_depth++;
    Log::Log4perl->get_logger()->warn(@_);
    $Log::Log4perl::caller_depth--;
}

1;

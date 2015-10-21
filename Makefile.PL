use strict;
use warnings;
use ExtUtils::MakeMaker;

sub MY::postamble { <<'END'; }

rpm:    dist
	rpmbuild -ta GRNOC-Log-$(VERSION).tar.gz
END

WriteMakefile(
	      NAME                => 'GRNOC::Log',
	      AUTHOR              => 'GRNOC System Engineering <syseng@grnoc.iu.edu>',
	      VERSION_FROM        => 'lib/GRNOC/Log.pm',
	      ABSTRACT_FROM       => 'lib/GRNOC/Log.pm',
	      PL_FILES            => {},
	      PREREQ_PM => {
		  'Test::More' => 0,
		  'Test::Pod::Coverage' => 0,
		  'Log::Log4perl' => 0,
		  'Log::Dispatch::Syslog' => 0
	      },
	      dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
	      clean               => { FILES => 'GRNOC-Log-*' },
	      );

sub MY::test
{

q(

TEST_VERBOSE=1

test : pure_all
	$(FULLPERL) t/TEST $(TEST_VERBOSE)

test_jenkins : pure_all
	$(FULLPERL) t/TEST $(TEST_VERBOSE) --formatter=TAP::Formatter::Console

);

}

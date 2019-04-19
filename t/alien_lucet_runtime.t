use Test2::V0 -no_srand => 1;
use Test::Alien;
use Alien::lucet::runtime;

alien_ok 'Alien::lucet::runtime';

ffi_ok { symbols => ['lucet_error_name'] }, with_subtest {
  my($ffi) = @_;
  my $lucet_error_name = $ffi->function( lucet_error_name => ['unsigned int'] => 'string' );
  my $string = $lucet_error_name->call(0);
  is $string, 'lucet_error_ok';
};

xs_ok do { local $/; <DATA> }, with_subtest {
  my $string = Lucet::lucet_error_name(0);
  is $string, 'lucet_error_ok';
};

done_testing

__DATA__

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <lucet.h>

MODULE = Lucet PACKAGE = Lucet

const char *lucet_error_name(code)
    unsigned char code
  CODE:
    enum lucet_error e = (enum lucet_error) code;
    RETVAL = lucet_error_name(e);
  OUTPUT:
    RETVAL

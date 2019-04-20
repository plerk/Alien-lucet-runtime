use Test2::V0 -no_srand => 1;
use Test::Alien;
use Alien::lucet::runtime;

alien_ok 'Alien::lucet::runtime';

ffi_ok { symbols => ['lucet_error_name'] }, with_subtest {
  my($ffi) = @_;

  my $lucet_error_name = $ffi->function(
    lucet_error_name => ['unsigned int'] => 'string'
  );
  my $string = $lucet_error_name->call(0);
  is $string, 'lucet_error_ok';

  my $lucet_wasi_ctx_create = $ffi->function(
    lucet_wasi_ctx_create => [] => 'opaque'
  );
  my $lucet_wasi_ctx_destroy = $ffi->function(
    lucet_wasi_ctx_destroy => ['opaque'] => 'void',
  );

  my $ctx = $lucet_wasi_ctx_create->call;
  is $ctx, D();
  is $ctx, match qr/^[0-9]+$/;
  note "ctx = $ctx";
  $lucet_wasi_ctx_destroy->call($ctx);

};

xs_ok do { local $/; <DATA> }, with_subtest {

  my $string = Lucet::lucet_error_name(0);
  is $string, 'lucet_error_ok';

  my $ctx = Lucet::lucet_wasi_ctx_create();
  is $ctx, D();
  is $ctx, match qr/^[0-9]+$/;
  note "ctx = $ctx";
  Lucet::lucet_wasi_ctx_destroy($ctx);

};

done_testing

__DATA__

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <lucet.h>
#include <lucet_wasi.h>

MODULE = Lucet PACKAGE = Lucet

const char *lucet_error_name(code)
    unsigned char code
  CODE:
    enum lucet_error e = (enum lucet_error) code;
    RETVAL = lucet_error_name(e);
  OUTPUT:
    RETVAL

void *lucet_wasi_ctx_create()

void lucet_wasi_ctx_destroy(ctx)
    void *ctx

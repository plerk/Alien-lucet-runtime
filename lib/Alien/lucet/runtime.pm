package Alien::lucet::runtime;

use strict;
use warnings;
use 5.008001;
use base qw( Alien::Base );

# ABSTRACT: Find or build lucet runtime
# VERSION

=head1 SYNOPSIS

In your C<Makefile.PL>:

 use ExtUtils::MakeMaker;
 use Alien::Base::Wrapper qw( Alien::lucet::runtime );
 
 WriteMakefile(
   ...
   CONFIGURE_REQUIRES => {
     'ExtUtils::MakeMaker' => 6.52,
     'Alien::lucet::runtime',
   },
   Alien::Base::Wrapper->mm_args,
 );

With L<FFI::Platypus>:

 use FFI::Platypus;
 use Alien::lucet::runtime;
 
 my $ffi = FFI::Platypus->new;
 $ffi->lib(Alien::lucet::runtime->dynamic_libs);

=head1 DESCRIPTION

This L<Alien> provides the Lucet runtime (see
L<https://www.fastly.com/blog/announcing-lucet-fastly-native-webassembly-compiler-runtime>)
as a CPAN dependency.  It can be invoked using either XS or FFI.  For the
full interface for using this L<Alien>, see L<Alien::Base> and
L<Alien::Build::Manual::AlienUser>.

=cut

1;

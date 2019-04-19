# Alien::lucet::runtime [![Build Status](https://secure.travis-ci.org/plicease/Alien-lucet-runtime.png)](http://travis-ci.org/plicease/Alien-lucet-runtime)

Find or build lucet runtime

# SYNOPSIS

In your `Makefile.PL`:

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

With [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus):

    use FFI::Platypus;
    use Alien::lucet::runtime;
    
    my $ffi = FFI::Platypus->new;
    $ffi->lib(Alien::lucet::runtime->dynamic_libs);

# DESCRIPTION

This [Alien](https://metacpan.org/pod/Alien) provides the Lucet runtime (see
[https://www.fastly.com/blog/announcing-lucet-fastly-native-webassembly-compiler-runtime](https://www.fastly.com/blog/announcing-lucet-fastly-native-webassembly-compiler-runtime))
as a CPAN dependency.  It can be invoked using either XS or FFI.  For the
full interface for using this [Alien](https://metacpan.org/pod/Alien), see [Alien::Base](https://metacpan.org/pod/Alien::Base) and
[Alien::Build::Manual::AlienUser](https://metacpan.org/pod/Alien::Build::Manual::AlienUser).

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2019 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

package mymm;

use strict;
use warnings;
use 5.008001;
use File::Which qw( which );

unless($^O eq 'linux')
{
  print "Linux is required.\n";
  exit;
}

unless(which('cargo') && which('rustc'))
{
  print "Rust compiler and cargo is required.";
  exit;
}

1;

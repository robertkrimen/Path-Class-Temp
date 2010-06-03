#!/usr/bin/env perl

use strict;
use warnings;

use Test::Most 'no_plan';

use Path::Class::Temp::PathClass;

my $dir = dir( File::Spec->tmpdir );
my $t0 = $dir->tempfile( 'ab.XXXX' );

diag( $t0 );

ok( -e $t0 );


#!/usr/bin/env perl

use strict;
use warnings;

use Test::Most 'no_plan';

use Path::Class::Temp;

is( \&tempfile, \&Path::Class::Temp::tempfile );

my ( $t0 );

{
    my $t1 = tempfile;
    diag( "$t1" );
    ok( $t1 );
    ok( -e $t1 );
    $t0 = "$t1";
}

ok( ! -e $t0 );

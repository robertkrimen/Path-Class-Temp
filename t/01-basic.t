#!/usr/bin/env perl

use strict;
use warnings;

use Test::Most 'no_plan';

use Path::Class::Temp::File;

my ( $t0 );

{
    my $t1 = Path::Class::Temp::File->new;
    diag( "$t1" );
    ok( $t1 );
    ok( -e $t1 );
    $t0 = "$t1";
}

ok( ! -e $t0 );

$t0 = Path::Class::Temp::File->new( 'ab.XXXX', { tmpdir => 1 } );
like( $t0->basename, qr/^ab\..{4}$/ );
is( $t0->parent, File::Spec->tmpdir );

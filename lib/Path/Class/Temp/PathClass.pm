package Path::Class::Temp::PathClass;

use strict;
use warnings;

use Package::Pkg;
use Path::Class();
use Path::Class::Temp::File;

pkg->export(qw/ file <Path::Class::file dir <Path::Class::dir /);

package # Hide from the PAUSE
    Path::Class::Dir;

sub tempfile {
    my $self = shift;
    my @arguments;
    push @arguments, shift if ref $_[0] eq 'HASH';
    push @arguments, "$self";
    push @arguments, @_;
    return Path::Class::Temp::File->new( @arguments );
}

1;

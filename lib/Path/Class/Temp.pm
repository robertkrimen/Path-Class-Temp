package Path::Class::Temp;
# ABSTRACT: Create a temporary file that is a Path::Class::File

use strict;
use warnings;

use Package::Pkg;
use Path::Class::Temp::File;

pkg->export(qw/ tempfile /);

sub tempfile { return Path::Class::Temp::File->new( @_ ) };

1;

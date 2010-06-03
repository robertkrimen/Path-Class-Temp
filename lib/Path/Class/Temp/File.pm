package Path::Class::Temp::File;

use strict;
use warnings;

use Path::Class::File();
use File::Temp();
use File::Spec();

use base qw/ Path::Class::File /;

sub new {
    my $class = shift; 
    my $arguments = {};
    if      ( ref $_[0] eq 'HASH' )     { $arguments = shift }
    elsif   ( ref $_[-1] eq 'HASH' )    { $arguments = pop }

    my $template = pop;
    my $dir; 
    $dir = File::Spec->canonpath( join '/', @_ ) if @_;

    my @arguments;
    push @arguments, dir => "$dir" if $dir;

    my $tmp = File::Temp->new( template => $template, @arguments, %$arguments );
    my $filename = $tmp->filename;

    my $self = $class->SUPER::new( $filename );
    $self->{__PathClassTemp_tmp__} = $tmp;

    return $self;
}

sub tmp { $_[0]->{__PathClassTemp_tmp__} }

sub handle { $_[0]->tmp }

1;

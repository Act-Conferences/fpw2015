#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;

sub replace
{
    my $in = shift;
    my $out = shift;
    my ($t, $a, $u) = @_;
    open my $fo, '>', $out or die "cannot open $out: $!";
    open my $fi, '<', $in or die "cannot open $in: $!";

    local $_;
    while ( <$fi> ) {
        chomp;
        s/_t_i_t_r_e_/$t/;
        s/_a_u_t_e_u_r_/$a/;
        s/_u_r_l_/$u/;
        print $fo $_;
    }

    close $fo;
    close $fi;

}

$\ = $/;                             # option -l
while (<>) {                         # option -n
    chomp $_;                        # options -l et -n
    next unless length;
    my ($t, $a, $u) = split / -- /;            # options -a et -F
    $u =~ y/\[\]//d;

    my $tt = $t;
    $tt =~ y/ :,.;'()\//_________/;
    $tt =~ s/_+/_/g;
    $tt .= '.svg';
    replace('Template.svg', $tt, $t, $a, $u);
    say $tt;

}



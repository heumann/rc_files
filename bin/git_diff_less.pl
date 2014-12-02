#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

my $files = scalar @ARGV == 0
    ? ''
    : join(' ', @ARGV);

system( "git diff $files | ~/bin/diff_painter.pl | less -RI" );

#!/usr/bin/perl

  use strict;
  use warnings;

  my $data = 'Becky Alcorn,25,female,Melbourne';

  my @values = split(',', $data);
  
  foreach my $val (@values) {
    print "$val\n";
  }

  exit 0;

#!/usr/bin/perl

my $input_found = 0;
while (<>) {
  if ($_ =~ /INPUT\(/) {
    $input_found = 1;
    next;
  }
  if ($_ =~ /\)/) {
    exit;
  }

  if ($input_found == 1){
    chomp($_);
    print $_;
  }
}
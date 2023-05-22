#!/usr/bin/perl
use strict;
use warnings;
use Text::CSV;
use File::Copy;

if (@ARGV != 2) {
    die "Usage: perl $0 items_file lua_file\n";
}

my ($items_file, $lua_file) = @ARGV;
my $directory = $lua_file =~ m!(.+)/! ? $1 : '.';
my $backup_directory = "$directory/sets_backup";

mkdir $backup_directory unless -d $backup_directory;

my $csv = Text::CSV->new;

open(my $fh, "<", $items_file) or die "Failed to open file: $!\n";
my @items_to_add;
while (my $row = $csv->getline($fh)) {
    push @items_to_add, "\"$row->[0]\"";
}
close $fh;

copy($lua_file, $backup_directory) or die "File cannot be copied: $!\n";

open(my $in, "<", $lua_file) or die "Cannot open $lua_file: $!";
my @lines = <$in>;
close $in;

open(my $out, ">", $lua_file) or die "Cannot open $lua_file: $!";
foreach my $line (@lines) {
    if ($line =~ /items\s*=\s*\{\s*(.*?)\s*\}\s*,/) {
        my @items = split /,\s*/, $1; # split on comma with spaces on either side
        @items_to_add = grep { my $item = $_; !grep($_ eq $item, @items) } @items_to_add;
        push @items, @items_to_add;
        my $items_string = join(", ", @items);
        $items_string =~ s/,\s*(?=")/, /g; # ensure space after comma
        $line =~ s/items\s*=\s*\{\s*(.*?)\s*\}\s*,/items = { ${items_string} },/;
    }
    print $out $line;
}
close $out;
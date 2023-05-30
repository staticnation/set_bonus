#!/usr/bin/perl

# This script accepts a CSV file of items and a Lua file as arguments. It reads the CSV file and extracts
# items to add to the Lua file. Before modifying the Lua file, it creates a backup in a specified backup 
# directory. The script then reads the Lua file, finds lines where item sets are defined, and app

# Importing necessary Perl modules.
use strict;
use warnings;
use Text::CSV;
use File::Copy;

# The script takes exactly two arguments, the first being the CSV file containing items to add
# and the second being the Lua file to modify.
if (@ARGV != 2) {
    die "Usage: perl $0 items_file lua_file\n";
}

# Extracting the arguments into variables.
my ($items_file, $lua_file) = @ARGV;

# Extracts the directory of the Lua file from its path, or uses the current directory if none is specified.
my $directory = $lua_file =~ m!(.+)/! ? $1 : '.';

# Defines a backup directory for the Lua file within the Lua file's directory.
my $backup_directory = "$directory/sets_backup";

# Creates the backup directory if it doesn't already exist.
mkdir $backup_directory unless -d $backup_directory;

# Initializes a new CSV parser.
my $csv = Text::CSV->new;

# Open the CSV file for reading.
open(my $fh, "<", $items_file) or die "Failed to open file: $!\n";

# Reads each line from the CSV file, adding each item to an array for later use.
my @items_to_add;
while (my $row = $csv->getline($fh)) {
    push @items_to_add, "\"$row->[0]\"";
}
close $fh;

# Creates a backup copy of the Lua file in the backup directory.
copy($lua_file, $backup_directory) or die "File cannot be copied: $!\n";

# Opens the Lua file for reading.
open(my $in, "<", $lua_file) or die "Cannot open $lua_file: $!";
my @lines = <$in>;
close $in;

# Opens the Lua file for writing.
open(my $out, ">", $lua_file) or die "Cannot open $lua_file: $!";

# Processes each line of the Lua file.
foreach my $line (@lines) {
    # Checks if the line is defining the items of a set.
    if ($line =~ /items\s*=\s*\{\s*(.*?)\s*\}\s*,/) {
        # Splits the list of items into an array.
        my @items = split /,\s*/, $1;
        
        # Filters out items that are already in the set.
        @items_to_add = grep { my $item = $_; !grep($_ eq $item, @items) } @items_to_add;

        # Adds the new items to the set.
        push @items, @items_to_add;

        # Converts the array of items back into a string.
        my $items_string = join(", ", @items);
        
        # Ensures that there is a space after each comma.
        $items_string =~ s/,\s*(?=")/, /g;
        
        # Replaces the old items list with the new one.
        $line =~ s/items\s*=\s*\{\s*(.*?)\s*\}\s*,/items = { ${items_string} },/;
    }
    
    # Writes the modified line back to the Lua file.
    print $out $line;
}
close $out;
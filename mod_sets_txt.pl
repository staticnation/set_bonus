#!/usr/bin/perl

# This Perl script reads an items_file and a lua_file. The items_file contains items to be added to the lua_file.
# Before any modification is made to the lua_file, a backup is created in a defined backup directory. The script
# then reads and modifies the lua_file, adding the new items where appropriate.

# Enabling strict and warnings helps catch common mistakes.
use strict;
use warnings;

# File::Copy is used to make a backup of the lua_file.
use File::Copy;

# The script expects exactly two arguments: items_file and lua_file.
if (@ARGV != 2) {
    die "Usage: perl $0 items_file lua_file\n";
}

# Assigning command-line arguments to respective variables.
my ($items_file, $lua_file) = @ARGV;

# Extracting the directory of the Lua file. If there's no directory in the file path, uses the current directory ('.').
my $directory = $lua_file =~ m!(.+)/! ? $1 : '.';

# Defining a backup directory in the same directory as the Lua file.
my $backup_directory = "$directory/sets_backup";

# If the backup directory does not exist, it gets created.
mkdir $backup_directory unless -d $backup_directory;

# Opens the items_file for reading. If there's an issue, the script dies with an error message.
open(my $fh, "<", $items_file) or die "Failed to open file: $!\n";

# Reads the first line from items_file and removes the trailing newline character if present.
my $line = <$fh>;
chomp $line;

# Splits the line into an array based on comma followed by optional spaces and assigns the array to items_to_add.
my @items_to_add = split /,\s*/, $line;

# Closes the file handle for items_file.
close $fh;

# Makes a backup of the Lua file in the backup directory. If there's an issue, the script dies with an error message.
copy($lua_file, $backup_directory) or die "File cannot be copied: $!\n";

# Opens the Lua file for reading. If there's an issue, the script dies with an error message.
open(my $in, "<", $lua_file) or die "Cannot open $lua_file: $!";
my @lines = <$in>;
close $in;

# Opens the Lua file for writing. If there's an issue, the script dies with an error message.
open(my $out, ">", $lua_file) or die "Cannot open $lua_file: $!";

# Goes through each line in the Lua file.
foreach my $line (@lines) {
    # If the line matches a specific pattern (defining items), it modifies the line.
    if ($line =~ /items\s*=\s*\{\s*(.*?)\s*\}\s*,/) {
        # Splits the list of items into an array.
        my @items = split /,\s*/, $1; 
        
        # Removes any items from items_to_add that are already in items.
        @items_to_add = grep { my $item = $_; !grep($_ eq $item, @items) } @items_to_add;
        
        # Adds the remaining items_to_add to items.
        push @items, @items_to_add;

        # Joins the items into a string, with items separated by a comma and a space.
        my $items_string = join(", ", @items);

        # Ensures there's a space after each comma in the string.
        $items_string =~ s/,\s*(?=")/, /g;
        
        # Replaces the old item list in the line with the new item list.
        $line =~ s/items\s*=\s*\{\s*(.*?)\s*\}\s*,/items = { ${items_string} },/;
    }
    # Writes the (potentially modified) line to the Lua file.
    print $out $line;
}

# Closes the file handle for the Lua file.
close $out;
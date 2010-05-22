#!/usr/bin/env perl
# Sandbox for testing SQLite3 access in Perl.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

# Installation instructions:
# 
# sudo perl -MCPAN -e shell
# cpan> install DBI
# cpan> install DBD::SQLite

use strict;
# use warnings; # Commented out because it generates useless warnings about uninitalized values from DBI -- which don't affect anything (and I'm not sure how to fix)

use Data::Dumper;
use DBI;

use constant DATABASE_PATH => 'output.sqlite3';

sub initialize {
  # print "hello!\n";
  # print "\n";

  our $database = DBI->connect(
    "dbi:SQLite:dbname=" . DATABASE_PATH,
    "",
    "",
    {
      RaiseError => 1,
      AutoCommit => 0,
    }
  ) or die "Couldn't connect to database: " . DBI->errstr;
}

sub tear_down {
  our $database->disconnect;

  # print "goodbye!\n";
}

#--
# My needs are pretty simple for this program.
sub select_from { my ($table_name, $column_names) = @_;
  our $database;

  my $result = $database->prepare('SELECT ' . (join ', ', $column_names) . ' FROM ' . $table_name)
    or die "Couldn't prepare query: " . $database->errstr;

  $result->execute
    or die "Couldn't execute query: " . $result->errstr;

  my @table_contents = ();

  # while (my @row = $result->fetchrow_array) {
  #   push @table_contents, @row;
  # } 

  while (my $row = $result->fetchrow_hashref) {
    push @table_contents, $row;
  }

  $result->finish;

  return @table_contents;
}

if ($0 == __FILE__) {
  initialize;

  my @table_names = ('table_a', 'table_b');

  foreach my $table_name (@table_names) {
    my @table_contents = select_from($table_name, '*');

    # my @table_contents = select_from('table_a', '*');
    # my @table_contents = select_from('table_b', 'assigned_id');
    
    # Print CSV header
    print join ',', keys %{$table_contents[0]};
    print "\n";
    
    # Print CSV rows
    foreach my $row (@table_contents) {
      my $csv = join(',', values %$row);
      print "$csv\n";
    }

    print "\n";
  }
  
  tear_down;
}


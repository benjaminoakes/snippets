# SQLite3 to CSV in Perl.
# 
# If that's all you want, you can also use:
# 
#     .mode csv
# 
# when using SQLite3.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>
use Data::Dumper;
use DBI;

my $database_path = 'output.sqlite3';

$database = DBI->connect(
  "dbi:SQLite:dbname=$database_path",
  "",
  "",
  {
    RaiseError => 1,
    AutoCommit => 0,
  }
) or die "Couldn't connect to database: " . DBI->errstr;

my $result = $database->prepare('select * from my_view;')
    or die "Couldn't prepare query: " . $database->errstr;

$result->execute
    or die "Couldn't execute query: " . $result->errstr;

my $fields = join(',', @{ $result->{NAME_lc} });
print "$fields\n";

while (my $row = $result->fetchrow_arrayref) {
    my $csv = join(',', @$row); # NOTE Please use a real CSV solution in a production app.
    print "$csv\n";
}

$result->finish;

$database->disconnect;


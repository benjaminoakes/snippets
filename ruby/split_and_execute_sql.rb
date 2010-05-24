# I found out that I could only execute one SQL statement at a time through ActiveRecord::Base.connection.execute().  (At least for SQLite3, it failed silently after only executing the first statement.)  SQL comments can really mess it up too.
# 
# I couldn't find a "real solution" to that problem, so I made this method to split multiple statements up (by ';') and then execute each one in turn.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'test/unit'

class String
  def sql_statements
    statements = []

    self.split(';').each do |statement|
      statement.strip!
  
      unless statement.empty?
        statement += ';'
        statements << statement
      end
    end

    return statements
  end
end

class StringExtensionTest < Test::Unit::TestCase
  def test_sql_statement
    sql = <<EOF
-- hello
select
  *
from table_name
;

insert
  something
into something_else
;

update
  foo = 'baz'
where bar = 1
;
EOF
    
    assert_equal(
      [
        "-- hello\nselect\n  *\nfrom table_name;",
        "insert\n  something\ninto something_else;",
        "update\n  foo = 'baz'\nwhere bar = 1;",
      ],
      sql.sql_statements
    )
  end
end


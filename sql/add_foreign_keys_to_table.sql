-- SQLite doesn't let you define foreign keys in-place (e.g., with alter).  This is a workaround.
-- 
-- The strategy is:
-- 
--   * Create a temporary table that's a duplicate of the one to which you want to add foreign keys
--   * Insert all the rows from the original table into that table
--   * Drop the original
--   * Recreate with foreign keys
--   * Copy all the rows back from the temporary table
-- 
-- This seems like something SQLite could do itself, honestly, but... meh.
-- 
-- Author: Benjamin Oakes <hello@benjaminoakes.com>

create table my_table_tmp (
  id,
  foreign_key_id,
  column_a,
  column_b
);

insert into my_table_tmp
  select
    id,
    foreign_key_id,
    column_a,
    column_b
  from my_table
;

drop table my_table;

create table my_table (
  id INTEGER primary key autoincrement not null,
  foreign_key_id integer null,
  column_a integer null,
  column_b integer null,
  foreign key (foreign_key_id) references foreign_table(id)
);

insert into my_table (
    id,
    foreign_key_id,
    column_a,
    column_b
  )
  select
    id,
    foreign_key_id,
    column_a,
    column_b
  from my_table_tmp
;

drop table my_table_tmp;


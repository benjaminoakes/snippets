.mode column

create table people (name, age);
insert into people values ('Bill', '18');
insert into people values ('Linus', '20');
insert into people values ('Steve', '12');
insert into people values ('Woz', '16');
insert into people values ('Unknown', null);

-- select *, case when cast(age as integer) < 18 then '<18' else 'FOO' end as code from people;

select
  *,
  case
  when cast(age as integer) < 18 then
    '<18'
  else
    'FOO'
  end as code
from people
;


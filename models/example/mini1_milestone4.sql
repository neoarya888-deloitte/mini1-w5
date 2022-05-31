select Name, count(*) as total from badges group by Name order by total desc limit 10

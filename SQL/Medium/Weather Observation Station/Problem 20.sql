select round(s.lat_n,4) 
from station s 
where (select ceil(count(s.lat_n)/2) 
       from station)= (select count(s.lat_n) 
                       from station s1 
                       where s1.lat_n>=s.lat_n)

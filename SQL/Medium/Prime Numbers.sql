#select all the numbers till 1000 in the tblnums
with recursive tblnums
as (
    select 2 as nums
    union all
    select nums+1 
    from tblnums
    where nums<1000)
    
select group_concat(tt.nums order by tt.nums separator '&')  as nums
from tblnums tt
where not exists 
    #the num should not be divisible by any number less than it
    ( select 1 from tblnums t2 
    where t2.nums <= tt.nums/2 and mod(tt.nums,t2.nums)=0) 

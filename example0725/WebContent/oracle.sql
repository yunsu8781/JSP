select mem.custno, mem.custname, mem.grade, sum(mon.price)
from MEMBER_TBL_02 mem , MONEY_TBL_02 mon
where mem.custno = mon.custno
group by mem.custno, mem.custname, mem.grade
order by sum(mon.price) desc;

select * from MONEY_TBL_02;

select custno, custname, phone, address, joindate, grade, city from member_tbl_02 where custno = 10002;
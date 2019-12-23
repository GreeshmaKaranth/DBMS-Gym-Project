select m_name,pack_id, start_date from members where start_date between '2019-01-01' and current_date order by start_date DESC;

select time_slot, no_attending from exercises where time_slot >= current_time;

select Salary, Experience_in_Years from Trainers;

select Type,Color,No_sold from Merchandise ORDER BY No_sold DESC;

select Ex_Name from Exercises,Trainers where T_Name = 'Rajesh Khanna' and T_ID = Trainer_ID;

update Phone set Phone_no = '9876543210' where Trainer_ID = 'T003';
select * from Phone;

insert into Equipments values('EQ06',15,'1999','Bouncy Ball');
select * from Equipments;

delete from trainers where t_id='T003';
select * from trainers;

update Merchandise set No_In_Stock = No_In_Stock + 20 where No_In_Stock<10;
select * from Merchandise;

select Sub_id,Price from Subscriptions where Price<10000 ORDER BY Price ASC;

select * from equipments where quantity*cost=(select max(quantity*cost) from equipments);

CREATE TABLE premium_members(
	Mem_ID char(15) PRIMARY KEY,
	M_Name varchar(20) NOT NULL
);
INSERT INTO premium_members (SELECT Mem_ID, M_Name FROM Members WHERE Mem_id IN (SELECT Mem_id FROM Members, Subscriptions
                      WHERE Pack_ID=Sub_ID and Price > 15000));
select * from premium_members;

UPDATE Members SET Pack_ID = 'SP01' WHERE Pack_ID IN (SELECT Pack_ID FROM Members WHERE Pack_ID = 'SP04');
select * from Members;

select pack_id from members where mem_id = (select member_id from use where equipment_id = (select eq_id from equipments where eq_name = 'Squat Rack'));

update trainers set salary = salary + salary*0.05 where t_id = (select trainer_id from members where pack_id = 'SP04');
select * from trainers;

select ex_name, type, time_slot from exercises e, consist c where c.exercise_id = e.e_id and c.pack_id = 'SP01';

update subscriptions set price = price - price*0.1 where sub_id = (select pack_id from consist, exercises where exercise_id = e_id and no_attending > 50);
select * from subscriptions;

select m.m_name, m.sex, mer.type, mer.color, mer.price from merchandise as mer, buy as b, members as m where mer.merch_id = b.mer_id and b.member_id = m.mem_id;

insert into buy (select mem_id, merch_id from members, merchandise where m_name like 'R%' and type='Headband' and no_in_stock = (select max(no_in_stock) from merchandise));
select * from buy;

select e.ex_name from exercises e, conduct c, trainers t where t.experience_in_years > 8 and t.t_id = c.trainer_id and c.exercise_id = e.e_id;


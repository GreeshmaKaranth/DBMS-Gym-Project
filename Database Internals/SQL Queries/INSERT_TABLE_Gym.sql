delete from Trainers; 
delete from Phone; 
delete from Subscriptions; 
delete from Members; 
delete from Merchandise; 
delete from Exercises;
delete from Equipments; 
delete from Consist; 
delete from Buy; 
delete from Conduct; 
delete from Use;
delete from Takeup;

INSERT into Trainers values('T001', 'Rajesh Khanna', 'rajesh@kiransgym.com','M','12-08-2008',12,60000);  
INSERT into Trainers values('T002', 'Ram Krishna', 'ram@kiransgym.com','M','21-10-2009',5,50000);  
INSERT into Trainers values('T003', 'Sanjana Kumar', 'sanjana@kiransgym.com','F','2-01-2007',9,55000);
INSERT into Trainers values('T004','Nikhil Shetty','nikhil@kiransgym.com','M','3-03-2008',7,65000);
INSERT into Trainers values('T005','Ananya Kapoor','ananya@kiransgym.com','F','10-11-2010',6,45000);

INSERT into Phone values('9901231175', 'T001');
INSERT into Phone values('8193556722', 'T002');
INSERT into Phone values('9743566721', 'T003');
INSERT into Phone values('9900886745', 'T004');
INSERT into Phone values('7689455889', 'T005');

INSERT into Subscriptions values('SP02', 16000, 6, 71);
INSERT into Subscriptions values('SP01', 9000, 3, 87);
INSERT into Subscriptions values('SP05', 30000, 12, 42);
INSERT into Subscriptions values('SP04', 10100, 8, 53);
INSERT into Subscriptions values('SP03', 8900, 7, 35);

INSERT into Members values('M0012', '9987760552', 'Mythali Saxena', '3-06-2012', 'F', 63, 156, '15-05-1982', 'mythalisaxena15@gmail.com', 'SP03', '02-06-2013', 'T002');
INSERT into Members values('M0035', '9784567732', 'Navneet Singhania', '17-11-2015', 'M', 80.0, 170, '09-11-1988', 'navneet_singhania@gmail.com', 'SP01', '16-05-2016', 'T003');
INSERT into Members values('M0189', '8655745233', 'Rashmi Anand', '24-12-2018', 'F', 63, 159, '4-3-1991', 'rashmi43@gmail.com', 'SP02', '23-03-2019', 'T001');
INSERT into Members values('M0112', '9088781572', 'Robert Thapar', '3-03-2019', 'M', 86, 186, '15-05-1989', 'robertthapar@gmail.com', 'SP04','2-11-2020' , 'T002');
INSERT into Members values('M0352', '9824564532', 'Josh Khanna', '17-02-2019', 'M', 85.0, 176, '09-11-1987', 'joshkhanna@gmail.com', 'SP02','16-05-2019', 'T001');
INSERT into Members values('M0089', '8155766633', 'Seetha Ram', '24-01-2019', 'F', 69, 158, '4-3-1992', 'ramseetha@gmail.com', 'SP01', '23-07-2019','T003');

INSERT into Merchandise values('01RED', 'Red', 200, 'Headband', 50, 5);
INSERT into Merchandise values('01BLU', 'Blue', 200, 'Headband', 60, 45);
INSERT into Merchandise values('01GRE', 'Green', 200, 'Headband', 42, 63);
INSERT into Merchandise values('02RED', 'Red', 800, 'Tee', 98, 52);
INSERT into Merchandise values('02BLU', 'Blue', 800, 'Tee', 109, 4);
INSERT into Merchandise values('03GRE', 'Green', 900, 'Shorts', 46, 34);

INSERT into Exercises values('EX01', 'Aerobics', 'Endurance', '1:00:00', 58);
INSERT into Exercises values('EX02', 'S&C', 'Strength', '15:00:00', 36);
INSERT into Exercises values('EX03', 'HRX', 'High Intensity', '18:00:00', 44);
INSERT into Exercises values('EX04', 'Balance Training', 'Balance', '14:00:00', 34);
INSERT into Exercises values('EX05', 'Stretches', 'Flexibilty', '07:00:00', 36);

INSERT into Equipments values('EQ01', 10, 3250, 'Treadmill');
INSERT into Equipments values('EQ02', 8, 1050, 'Medicine Ball');
INSERT into Equipments values('EQ03', 16, 1700, 'Weights');
INSERT into Equipments values('EQ04', 19, 1350, 'Dumb Bells');
INSERT into Equipments values('EQ05', 7, 9000, 'Squat Rack');

INSERT into Consist values('SP01', 'EX01');
INSERT into Consist values('SP01', 'EX02');
INSERT into Consist values('SP02', 'EX01');
INSERT into Consist values('SP02', 'EX02');
INSERT into Consist values('SP02', 'EX04');
INSERT into Consist values('SP03', 'EX02');
INSERT into Consist values('SP05', 'EX04');
INSERT into Consist values('SP05', 'EX03');
INSERT into Consist values('SP05', 'EX02');
INSERT into Consist values('SP05', 'EX01');
INSERT into Consist values('SP04', 'EX05');
INSERT into Consist values('SP04', 'EX03');

INSERT into Buy values('M0012', '01BLU');
INSERT into Buy values('M0035', '02BLU');
INSERT into Buy values('M0189', '01RED');
INSERT into Buy values('M0352', '03GRE');
INSERT into Buy values('M0089', '02RED');

INSERT into Conduct values('EX01', 'T001');
INSERT into Conduct values('EX02', 'T003');
INSERT into Conduct values('EX03', 'T002');
INSERT into Conduct values('EX04', 'T005');
INSERT into Conduct values('EX05', 'T004');

INSERT into Use values('M0012', 'EQ02');
INSERT into Use values('M0189', 'EQ03');
INSERT into Use values('M0035', 'EQ01');
INSERT into Use values('M0352', 'EQ04');
INSERT into Use values('M0089', 'EQ05');

INSERT into Takeup values('M0012', 'EX02');
INSERT into Takeup values('M0189', 'EX03');
INSERT into Takeup values('M0035', 'EX01');
INSERT into Takeup values('M0352', 'EX05');
INSERT into Takeup values('M0089', 'EX04');

select * from Trainers;
select * from Subscriptions;
select * from members;
select * from Phone;
select * from Merchandise;
select * from Exercises;
select * from Equipments;
select * from Consist;
select * from conduct;
select * from Use;
select * from Buy;
select * from Takeup;
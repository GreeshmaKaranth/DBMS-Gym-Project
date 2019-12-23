	\c postgres
DROP DATABASE newgym;
CREATE DATABASE newgym;
\c newgym

CREATE TABLE Trainers(
	T_ID char(15) PRIMARY KEY,
	T_Name varchar(20) NOT NULL,
	Email_ID varchar NOT NULL UNIQUE,
	Sex CHAR,
	Join_Date date NOT NULL,
	Experience_in_Years int,
	Salary decimal(7,2)
);

CREATE TABLE Phone(
	Phone_no varchar(10) NOT NULL,
	Trainer_ID char(15) NOT NULL,
	PRIMARY KEY (Phone_no, Trainer_ID),
	FOREIGN KEY (Trainer_ID) REFERENCES Trainers(T_ID) on delete cascade
);

CREATE TABLE Subscriptions(
	Sub_ID char(15) PRIMARY KEY,
	Price int NOT NULL,
	Duration_in_Months int NOT NULL,
	No_Subscribed int
);

CREATE TABLE Members(
	Mem_ID char(15) PRIMARY KEY,
	Phone varchar(10) NOT NULL,
	M_Name varchar(20) NOT NULL,
	Start_Date date NOT NULL,
	Sex char,
	Weight_in_kg decimal(3,1),
	Height_in_cm decimal(4,1),
	Date_Of_Birth date NOT NULL,
	Email_ID varchar NOT NULL UNIQUE,
	Pack_ID char(15),
	End_Date date NOT NULL,
	Trainer_ID char(15),
	FOREIGN KEY (Pack_ID) REFERENCES Subscriptions (Sub_ID) on delete no action,
	FOREIGN KEY (Trainer_ID) REFERENCES Trainers(T_ID) on delete set null
);


CREATE TABLE Merchandise(
	Merch_ID char(15) PRIMARY KEY,
	Color varchar(10) NOT NULL,
	Price int NOT NULL,
	Type varchar(10),
	No_Sold int,
	No_In_Stock int
);

CREATE TABLE Exercises(
	E_ID char(15) PRIMARY KEY,
	Ex_Name varchar(20) NOT NULL,
	Type varchar(15),
	Time_Slot time,
	No_Attending int
);

CREATE TABLE Equipments(
	Eq_ID char(15) PRIMARY KEY,
	Quantity int,
	Cost int,
	Eq_Name varchar(15) NOT NULL
);

CREATE TABLE Consist(
	Pack_ID char(15),
	Exercise_ID char(15),
	PRIMARY KEY (Pack_ID, Exercise_ID),
	FOREIGN KEY (Pack_ID) REFERENCES Subscriptions(Sub_ID) on delete cascade,
	FOREIGN KEY (Exercise_ID) REFERENCES Exercises (E_ID) on delete cascade
);

CREATE TABLE Buy(
	Member_ID char(15),
	Mer_ID char(15),
	PRIMARY KEY(Member_ID, Mer_ID),
	FOREIGN KEY (Member_ID) REFERENCES Members(Mem_ID) on delete cascade,
	FOREIGN KEY (Mer_ID) REFERENCES Merchandise(Merch_ID) on delete cascade
);

CREATE TABLE Conduct(
	Exercise_ID char(15),
	Trainer_ID char(15),	
	PRIMARY KEY(Exercise_ID, Trainer_ID),
	FOREIGN KEY (Exercise_ID) REFERENCES Exercises(E_ID) on delete cascade,
	FOREIGN KEY (Trainer_ID) REFERENCES Trainers(T_ID) on delete cascade
); 

CREATE TABLE Use(
	Member_ID char(15),
	Equipment_ID char(15),
	PRIMARY KEY(Member_ID, Equipment_ID),
	FOREIGN KEY (Member_ID) REFERENCES Members (Mem_ID) on delete cascade,
	FOREIGN KEY (Equipment_ID) REFERENCES Equipments (Eq_ID) on delete cascade
);	


CREATE TABLE Takeup(
	Member_ID char(15),
	Exercise_ID char(15),
	PRIMARY KEY(Member_ID, Exercise_ID),
	FOREIGN KEY (Member_ID) REFERENCES Members (Mem_ID) on delete cascade,
	FOREIGN KEY (Exercise_ID) REFERENCES Exercises(E_ID) on delete cascade
);

ALTER TABLE MEMBERS add check(phone between '6000000000' and '9999999999');
	
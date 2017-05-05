-- Create Statements --

Create Table Address (
    ZipCode			text,
	City			text,
    State			text,
  Primary key(ZipCode)
);

Create Table Venues (
    VID					text,
    VenueName			text,
	Capacity			int,
    Location			text,
  Primary key(VID)
);

Create Table People (
    PID			char(4) not null,
    FirstName	text,
    LastName	text,
    DateOfBirth	date,
    ZipCode		text,
  Primary key(PID),
  Foreign key(ZipCode) references Address(ZipCode)
);

Create Table Games(
    GID				char(4),
    VID				char(4) references Venues(VID),
    HomeTeam		text,
    AwayTeam		text,
  Primary key(GID)
);

Create Table Teams (
    TID				char(4),
	Nationality		text, 
    Primary key(TID)
);

Create Table Coaches (
    PID					char(4) not null references people(pid),
	TID					char(4), 
    YearsExperience		int,
  Primary key(PID),
  Foreign Key(TID) references Teams(TID)
); 

Create Table Players (
    PID					char(4) not null references people(pid),
	TID					char(4),
    PlayerPosition		text,
  Primary key(PID),
  foreign key(TID) references Teams(Tid)
); 

Create Table PlaysIn (
    GID				char(4) references Games(GID),
    TID				char(4) references Teams(TID),
  Primary key(GID,TID)
);

Create Table Fans (
    PID					char(4),
	TeamSupports		text,
  Primary key(PID),
  foreign key(PID) references people(pid)
);

Create Table Referees (
    PID					char(4),
	Nationality			text,
    YearsExperience		integer,
    YearlySalaryUSD		integer,
  Primary key(PID),
  foreign key(PID) references people(pid)
); 

Create Table EventStaff(
    PID					char(4),
	HourlyWageUSD		integer,
    Job					text,				
  Primary key(PID),
  foreign key(PID) references people(pid)
); 

Create Table WorksIn (
    GID				char(4) references Games(GID),
    PID				char(4) references EventStaff(PID),
  Primary key(GID,PID)
);

Create Table RefsIn (
    GID				char(4) references Games(GID),
    PID				char(4) references Referees(PID),
  Primary key(GID,PID)
);

-- Insert Statements --

INSERT INTO Address( ZipCode, City, State)
Values	('11566', 'Marchalls', 'Oklahoma'),
		('15044', 'Beckville', 'Georgia'),
		('54494', 'Borley Heights', 'Illinois'),
        ('50701', 'Craig', 'Rhode Island'),
        ('12020', 'Marshalls', 'Oklahoma'),
        ('30126', 'Boulder Junction', 'Connecticut')
;

Insert into Venues( VID, VenueName, Capacity, Location)
Values	('V001', 'Luzhniki Stadium', 81000, 'Moscow'),
		('V002', 'Otkrytie Arena', 45360, 'Moscow'),
        ('V003', 'Fisht Olympic Stadium', 47659, 'Sochi'),
        ('V004', 'Kazan Arena', 45105, 'Kazan'),
        ('V005', 'Krasnodar Stadium', 36260, 'Krasnodar')
;

INSERT INTO People( PID, FirstName, LastName, DateOfBirth, ZipCode)
Values	('P001', 'David', 'DeGea', '2004-08-24', '11566'),
		('P002', 'Cesar', 'Azpilicueta', '2003-11-30', '15044'),
        ('P003', 'Gerard', 'Pique', '1987-10-11', '54494'),
        ('P004', 'Sergio', 'Ramos', '2006-07-29', '50701'),
        ('P005', 'Jordi', 'Alba', '1996-12-14', '12020'),
        ('P006', 'Andreas', 'Iniesta', '2009-04-14', '30126'),
        ('P007', 'Ander', 'Herrera', '1998-08-14', '11566'),
        ('P008', 'David', 'Silva', '1988-05-27', '15044'),
        ('P009', 'Diego', 'Costa', '2007-08-09', '54494'),
        ('P010', 'Iago', 'Aspas', '1986-01-13', '50701'),
        ('P011', 'Alvaro', 'Morata', '1991-06-19', '12020'),
        ('P012', 'Hulen', 'Lopetegui', '1987-05-02', '30126'),
        ('P013', 'Marc', 'Wilmots', '1987-07-24', '11566'),
        ('P014', 'Didier', 'Deschamps', '1999-05-08', '15044'),
        ('P015', 'Hector', 'Cuper', '1991-07-16', '54494'),
        ('P016', 'Danny', 'Blind', '2003-11-27', '50701'),
        ('P017', 'Cory', 'Lang', '1984-03-16', '12020'),
        ('P018', 'Dan', 'Smith', '1995-08-30', '30126'),
        ('P019', 'Robby', 'Moon', '2009-01-25', '11566'),
        ('P020', 'David', 'Hernandez', '1990-10-30', '15044'),
        ('P021', 'Alan', 'Labouseur', '1985-04-06', '54494'),
        ('P022', 'Kate', 'Boylan', '1983-09-24', '50701'),
        ('P023', 'Mark', 'Wahlberg', '1987-06-22', '12020'),
        ('P024', 'Tom', 'Brady', '2007-05-18', '30126'),
        ('P025', 'Mike', 'Anderson', '2007-10-15', '11566'),
        ('P026', 'Ryan', 'Fitz', '2008-05-09', '15044'),
        ('P027', 'Martin', 'Atkinson', '1983-03-21', '54494'),
        ('P028', 'Jonathan', 'Moss', '1974-12-04', '50701'),
        ('P029', 'Mike', 'Jones', '1974-03-14', '12020'),
        ('P030', 'Mike', 'Dean', '1970-05-18', '30126'),
        ('P031', 'Lee', 'Mason', '1973-12-15', '11566'),
        ('P032', 'Lee', 'Brazier', '1973-12-15', '15044'),
        ('P033', 'Miles', 'Bolenbaugh', '1982-05-19', '54494'),
        ('P034', 'Antone', 'Meis', '1980-02-22', '50701'),
        ('P035', 'Hosea', 'Hunger', '1981-09-23', '12020'),
        ('P036', 'Ward', 'Sylvia', '1990-12-09', '30126'),
        ('P037', 'Joseph', 'Tibbits', '1983-12-24', '11566'),
        ('P038', 'Joan', 'Glatz', '1990-09-12', '15044'),
        ('P039', 'Samuel', 'Angles', '1987-01-01', '54494'),
        ('P040', 'Wes', 'Tuma', '2000-02-12', '50701'),
        ('P041', 'Whitney', 'Bartsch', '1987-05-18', '12020'),
        ('P042', 'Ahmad', 'Trussell', '1990-01-06', '30126'),
        ('P043', 'Morgan', 'Rodrick', '1990-05-19', '11566')
;

Insert Into games(GID, VID, HomeTeam, AwayTeam)
Values	('G001', 'V001', 'Spain', 'Egypt'),
		('G002', 'V002', 'France', 'Holland'),
        ('G003', 'V003', 'Egypt', 'Belgium'),
        ('G004', 'V004', 'France', 'Spain'),
        ('G005', 'V005', 'Belgium', 'Egypt'),
        ('G006', 'V001', 'Spain', 'France'),
        ('G007', 'V002', 'Holland', 'Egypt'),
        ('G008', 'V003', 'France', 'Spain'),
        ('G009', 'V004', 'Egypt', 'Spain'),
        ('G010', 'V005', 'Holland', 'France')
;

Insert Into Teams(TID, Nationality)
Values	('T001', 'Spain'),
		('T002', 'France'),
        ('T003', 'Egypt'),
        ('T004', 'Belgium'),
        ('T005', 'Holland')
;

Insert Into Coaches(PID, TID, Yearsexperience)
Values	('P012', 'T001', 13),
		('P013', 'T002', 5),
        ('P014', 'T003', 25),
        ('P015', 'T004', 9),
        ('P016', 'T005', 18)
;

Insert Into Players(PID, TID, PlayerPosition)
Values 	('P001', 'T001', 'Goalie'),
		('P002', 'T001', 'Defender'),
        ('P003', 'T001', 'Defender'),
        ('P004', 'T001', 'Defender'),
        ('P005', 'T001', 'Defender'),
        ('P006', 'T001', 'Midfield'),
        ('P007', 'T001', 'Midfield'),
        ('P008', 'T001', 'Midfield'),
        ('P009', 'T001', 'Forward'),
        ('P010', 'T001', 'Forward'),
        ('P011', 'T001', 'Forward')
;

Insert Into PlaysIn(GID, TID)
Values	('G001','T001'),
		('G001','T003'),
        ('G002','T002'),
        ('G002','T005'),
        ('G003','T003'),
        ('G003','T004'),
        ('G004','T002'),
        ('G004','T001'),
        ('G005','T004'),
        ('G005','T003'),
        ('G006','T001'),
        ('G006','T002'),
        ('G007','T005'),
        ('G007','T003'),
        ('G008','T001'),
        ('G008','T002'),
        ('G009','T003'),
        ('G009','T001'),
        ('G010','T005'),
        ('G010','T002')
;

Insert Into Fans(PID, TeamSupports)
Values	('P032', 'France'),
		('P033', 'Egypt'),
        ('P034', 'France'),
        ('P035', 'Holland'),
        ('P036', 'Belgium'),
        ('P037', 'Belgium'),
        ('P038', 'France'),
        ('P039', 'Spain'),
        ('P040', 'Spain'),
        ('P041', 'Egypt'),
        ('P042', 'Spin'),
        ('P043', 'France')
;

Insert Into Referees(PID, Nationality, YearsExperience, YearlySalaryUSD)
Values	('P027','Spain', '16', 85000),
		('P028','France', '18', 100000),
        ('P029','Belgium', '9', 55000),
        ('P030','Holland', '25', 83000),
        ('P031','Egypt', '30', 90000)
;

Insert Into EventStaff(PID, HourlyWageUSD, Job)
Values	('P017', 8, 'Guard'),
		('P018', 9.5, 'Guard'),
        ('P019', 20, 'Guard'),
        ('P020', 18, 'Guard'),
        ('P021', 11, 'Guard'),
        ('P022', 12, 'Guard'),
        ('P023', 15, 'Guard'),
        ('P024', 19, 'Guard'),
        ('P025', 20, 'Guard'),
        ('P026', 9, 'Guard')
;

Insert Into WorksIn(GID, PID)
Values	('G001','P017'),
		('G002','P018'),
        ('G003','P019'),
        ('G004','P020'),
        ('G005','P021'),
        ('G006','P022'),
        ('G007','P023'),
        ('G008','P024'),
        ('G009','P025'),
        ('G010', 'P026')
;

Insert Into RefsIn(GID, PID)
Values	('G001','P027'),
		('G002','P028'),
        ('G003','P029'),
        ('G004','P030'),
        ('G005','P031'),
        ('G006','P027'),
        ('G007','P028'),
        ('G008','P029'),
        ('G009','P030'),
        ('G010','P031')
;

-- VIEW 1-- View list of players and their teams they play for        

create view PlayersTeams AS
	select FirstName, LastName, Nationality as Team
    from people
    inner join players on people.pid = players.pid
    inner join teams on players.tid = teams.tid
    order by LastName
    ;
select * from PlayersTeams;

-- VIEW 2 -- View list of players and their teams they coach

create view CoachesTeams AS
	select FirstName, LastName, Nationality as CoachFor
    from people
    inner join coaches on people.pid = coaches.pid
    inner join teams on coaches.tid = teams.tid
    order by LastName
    ;
select * from CoachesTeams;

-- VIEW 3 -- View where the teams are playing in which game
create view TeamsPlay AS
	select Nationality as Team, VenueName, games.GID as GameNumber
    from teams
    inner join PlaysIn on teams.tid = playsin.tid
    inner join Games on games.gid = playsin.gid
    inner join Venues on venues.vid = games.vid
    order by Nationality
    ;
select * from TeamsPlay;

-- Report 1 -- workers making more than $11 per hour
select FirstName, LastName
from people inner join eventstaff on people.pid = eventstaff.pid
where hourlywageUSD > 11;

-- Report 2 -- coaches with more than 13 years experience
select FirstName, LastName
from people inner join coaches on people.pid = coaches.pid
where yearsexperience > 13;

-- Report 3 -- Teams who play in Moscow
select distinct nationality 
from teams inner join playsin on teams.tid = playsin.tid
inner join games on games.gid = playsin.gid
inner join venues on venues.vid = games.vid
where location = 'Moscow';

-- Stored Procedure --

create or replace function get_team_by_player(char(4), REFCURSOR) returns refcursor as
$$
declare
	playerId char(4)				:=$1;
    resultset Refcursor				:=$2;
begin
	open resultset for
    	select p.pid, t.nationality
        from players p, teams t
        where p.tid = t.tid
        and p.pid = playerId;
        return resultset;
end;
$$
language plpgsql;

select get_team_by_player('P001', 'results');
fetch all from results;

-- security --
create role databaseadmin;
grant select, insert, update on all tables in schema public to DatabaseAdmin;

create role coordinator;
grant select on all tables in schema public to coordinator;





CREATE TABLE People (
    pid				char(4) not null,
    FirstName		text,
    LastName		text,
    Birthdate		date,
    HairColor		text,
    EyeColor		text,
    Weightlbs		integer,
    Heightinches	integer,
    SpouceFname		text,
    SpouceLname		text,
    FavoriteColor	text,
    primary key(pid)
    );
    
CREATE TABLE Actors (
    PID 				char(4) not null references people(Pid),
    SAGAnniversaryDate	date,
    primary key(pid)
    );
    
CREATE TABLE Directors (
    PID 				char(4) not null references people(pid),
    FilmSchoolAttended	text,
    DGAnniversaryDate	date,
    FavoriteLensMaker	text,
    primary key(pid)
    );  
    
CREATE TABLE Movies (
    MID 				char(4),
    YearReleased		date,
    MPAANumber			integer,
    DomesticBOSales		numeric(12,2),
    ForeignBOSales		numeric(12,2),
    DVDBluRaySales		numeric(12,2),
    primary key(Mid)
    );     
    
CREATE TABLE Casts(
    MID 	char(4) not null references Movies(Mid),
    PID		char(4) not null references People(Pid),
    PIDRole	text,
    unique(Pid,Mid),
    primary key(Pid,Mid)
    );  
    
Insert into People( pid, FirstName, LastName, Birthdate, HairColor, EyeColor, Weightlbs, Heightinches, SpouceFname, SpouceLname, FavoriteColor)
	VALUES('p001', 'Mike', 'Smith', '12/12/1990', 'Black', 'Blue', 175, 72, 'Karen', 'Smith', 'Blue');
    
Insert into People( pid, FirstName, LastName, Birthdate, HairColor, EyeColor, Weightlbs, Heightinches, SpouceFname, SpouceLname, FavoriteColor)
	VALUES('p002', 'Jared', 'Rose', '11/19/1993', 'White', 'Green', 176, 71, 'Casey', 'Rose', 'Blue');
    
Insert into People( pid, FirstName, LastName, Birthdate, HairColor, EyeColor, Weightlbs, Heightinches, SpouceFname, SpouceLname, FavoriteColor)
	VALUES('p003', 'Anthony', 'Lake', '8/7/1990', 'Brown', 'Blue', 169, 76, 'Kathy', 'Lake', 'Red');
    
Insert into People( pid, FirstName, LastName, Birthdate, HairColor, EyeColor, Weightlbs, Heightinches, SpouceFname, SpouceLname, FavoriteColor)
	VALUES('p004', 'Lucas', 'Aaron', '1/12/1991', 'Black', 'Green', 173, 70, 'Rachel', 'Aaron', 'Green');
    
Insert into People( pid, FirstName, LastName, Birthdate, HairColor, EyeColor, Weightlbs, Heightinches, SpouceFname, SpouceLname, FavoriteColor)
	VALUES('p005', 'Dom', 'June', '12/2/1995', 'Brown', 'Black', 180, 78, 'Meg', 'June', 'Yellow');
    
Insert into People( pid, FirstName, LastName, Birthdate, HairColor, EyeColor, Weightlbs, Heightinches, SpouceFname, SpouceLname, FavoriteColor)
	VALUES('p006', 'Sean', 'Connery', '12/2/1995', 'Brown', 'Black', 180, 78, 'Meg', 'June', 'Yellow');
    
Insert into Actors( pid, SAGAnniversaryDate)
	VALUES('p001', '4/6/1998');
    
Insert into Actors( pid, SAGAnniversaryDate)
	VALUES('p003', '6/6/1998');
    
Insert into Actors( pid, SAGAnniversaryDate)
	VALUES('p004', '4/6/1998');
    
Insert into Actors( pid, SAGAnniversaryDate)
	VALUES('p006', '8/2/1999');
   
Insert into Directors( pid, FilmSchoolAttended, DGAnniversaryDate, FavoriteLensMaker)
	VALUES('p002', 'Ithaca', '11/13/1997', 'Sony');
    
Insert into Directors( pid, FilmSchoolAttended, DGAnniversaryDate, FavoriteLensMaker)
	VALUES('p004', 'Ithaca', '5/12/1998', 'Sony');
    
Insert into Directors( pid, FilmSchoolAttended, DGAnniversaryDate, FavoriteLensMaker)
	VALUES('p005', 'Ithaca', '6/23/1997', 'Kodak');
    
Insert into Directors( pid, FilmSchoolAttended, DGAnniversaryDate, FavoriteLensMaker)
	VALUES('p006', 'Ithaca', '6/23/1998', 'Kodak');
    
Insert into Movies( mid, YearReleased, MPAANumber, DomesticBOSales, ForeignBOSales, DVDBluRaySales)
	VALUES('m001', '12/23/2000', '10829', '1404204', '563409', '93856');
    
Insert into Movies( mid, YearReleased, MPAANumber, DomesticBOSales, ForeignBOSales, DVDBluRaySales)
	VALUES('m002', '12/27/2000', '10726', '1982637', '924726', '92736');
    
Insert into Movies( mid, YearReleased, MPAANumber, DomesticBOSales, ForeignBOSales, DVDBluRaySales)
	VALUES('m003', '12/19/2000', '10982', '1987609', '274567', '76498');
    
Insert into Movies( mid, YearReleased, MPAANumber, DomesticBOSales, ForeignBOSales, DVDBluRaySales)
	VALUES('m004', '12/4/2000', '13782', '1825305', '123654', '92637');
    
Insert into Movies( mid, YearReleased, MPAANumber, DomesticBOSales, ForeignBOSales, DVDBluRaySales)
	VALUES('m005', '12/8/2000', '19273', '102394', '980635', '54738');
    
Insert into Casts( mid, pid, PidRole)
	VALUES('m001', 'p001', 'Actor');
    
Insert into Casts( mid, pid, PidRole)
	VALUES('m001', 'p002', 'Director');
    
Insert into Casts( mid, pid, PidRole)
	VALUES('m001', 'p006', 'Actor');
    
Insert into Casts( mid, pid, PidRole)
	VALUES('m002', 'p003', 'Actor');
    
Insert into Casts( mid, pid, PidRole)
	VALUES('m002', 'p006', 'Actor');
    
Insert into Casts( mid, pid, PidRole)
	VALUES('m002', 'p005', 'Director');
    
Insert into Casts( mid, pid, PidRole)
	VALUES('m003', 'p004', 'Actor');
    
Insert into Casts( mid, pid, PidRole)
	VALUES('m003', 'p005', 'Director');
    
Insert into Casts( mid, pid, PidRole)
	VALUES('m004', 'p003', 'Actor');
    
Insert into Casts( mid, pid, PidRole)
	VALUES('m004', 'p002', 'Director');
    
Insert into Casts( mid, pid, PidRole)
	VALUES('m005', 'p006', 'Actor');
    
Insert into Casts( mid, pid, PidRole)
	VALUES('m005', 'p005', 'Director');

select FirstName, LastName
from people
where pid in(
            select pid
            from casts
            where mid in	(
                            select mid
                            from casts
                            where pid = 'p006')    		
);

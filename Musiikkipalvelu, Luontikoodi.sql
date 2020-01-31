CREATE DATABASE AudioStreamingPlatform;

USE AudioStreamingPlatform;

CREATE TABLE Program (
	VersionID INTEGER NOT NULL PRIMARY KEY,
	ProgramVersion VARCHAR(10) NOT NULL,
	Changes VARCHAR(100)
);

CREATE TABLE Employee (
	EmployeeID INTEGER NOT NULL PRIMARY KEY,
	FirstName VARCHAR(25) NOT NULL,
	SecondName VARCHAR(25) NOT NULL,
	Country VARCHAR(25),
	City VARCHAR(25),
	RegistrationDate DATE NOT NULL,
	LeaveDate DATE,
	PrimaryTask VARCHAR(30) NOT NULL,
	SecondaryTask VARCHAR(30),
	Salary INTEGER NOT NULL
);

CREATE TABLE Revenue (
	RevenueKey INTEGER NOT NULL PRIMARY KEY,
	Amount INTEGER NOT NULL,
	Country VARCHAR(30),
	Region VARCHAR(30),
	Source VARCHAR(50),
	RevenueDate DATE
);

CREATE TABLE Customer (
	CustomerID INTEGER NOT NULL PRIMARY KEY,
	FirstName VARCHAR(25) NOT NULL,
	SecondName VARCHAR(25) NOT NULL,
	Country VARCHAR(25),
	City VARCHAR(25),
	RegistrationDate DATE NOT NULL,
	AccountStatus INTEGER -- 1 on Premium- tileille, 2 on Standart- (ei maksetuille) tileille
);

CREATE TABLE Artist (
	ArtistID INTEGER NOT NULL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL
);

CREATE TABLE Album (
	AlbumID INTEGER NOT NULL PRIMARY KEY,
	ArtistID INTEGER NOT NULL,
	Name VARCHAR(50) NOT NULL,
	ReleaseYear YEAR -- Ei ole NOT NULL, koska julkaisupäivä ei ole aina tiedossa
);

CREATE TABLE Song (
	SongID INTEGER NOT NULL PRIMARY KEY,
	AlbumID INTEGER NOT NULL,
	Name VARCHAR(50) NOT NULL,
	SongLength INTEGER,
	Copyright VARCHAR(50) NOT NULL
);

ALTER TABLE Album 
ADD CONSTRAINT FK_Album_Artist
	FOREIGN KEY(ArtistID) REFERENCES Artist(ArtistID);
	
ALTER TABLE Song 
ADD CONSTRAINT FK_Song_Album
	FOREIGN KEY(AlbumID) REFERENCES Album(AlbumID);

INSERT INTO Program VALUES(1, 0.1, 'Bugs to be fixed.');
INSERT INTO Program VALUES(2, 0.5, 'More artists to be added.');
INSERT INTO Program VALUES(3, 1.0, 'Bugs have been fixed; few artists have been added.');

INSERT INTO Employee VALUES(1, 'Jack', 'Green', 'United States', 'Austin', '2002-11-09', NULL, 'Program Tester', 'Bug Fixer', 3200);
INSERT INTO Employee VALUES(15, 'Sagong', 'Jung-Hoon', 'South Korea', 'Seoul', '2003-01-15', '2005-06-25', 'Android Engineer', NULL, 3100);
INSERT INTO Employee VALUES(87, 'Eva', 'Green', 'France', 'Paris', '2008-07-28', '2016-06-19', 'Bug Fixer', NULL, 2600);
INSERT INTO Employee VALUES(99, 'Isabella', 'Di Scenza', 'Italy', 'Firenze', '2009-05-01', '2012-04-30', 'Client Solutions Partner', 'Account Director', 3800);
INSERT INTO Employee VALUES(132, 'Jane', 'Doe', 'United States', 'Phoenix', '2018-12-02', NULL, 'Customer Service', NULL, 2000);
INSERT INTO Employee VALUES(135, 'Avantas', 'Ghosal', 'India', 'Delhi', '2018-12-10', NULL, 'Data Engineer', NULL, 2900);
INSERT INTO Employee VALUES(140, 'Hedda', 'Rodberg', 'Norway', 'Gjøvik', '2019-01-09', '2019-03-09', 'Design Manager', 'Art Director', 3000);

INSERT INTO Revenue VALUES(1, 2000, 'German', NULL, 'Advertisement', '2017-03-15');
INSERT INTO Revenue VALUES(2, '-5200', 'USA', NULL, 'Salary', '2018-05-25');
INSERT INTO Revenue VALUES(3, '-3800', 'Italy', NULL, 'Salary', '2018-05-25');
INSERT INTO Revenue VALUES(4, '-2600', 'Paris', NULL, 'Salary', '2018-05-25');
INSERT INTO Revenue VALUES(5, 4500, 'Japan', 'Okinawa', 'Cooperation', '2018-11-01');
INSERT INTO Revenue VALUES(6, 150, 'Finland', NULL, 'Premium Account', '2018-12-21');
INSERT INTO Revenue VALUES(7, 100, 'Argentina', NULL, 'Premium Account', '2018-12-21');
INSERT INTO Revenue VALUES(8, 90, 'Pakistan', NULL, 'Premium Account', '2018-12-21');
INSERT INTO Revenue VALUES(9, 50, 'Spain', 'Principality of Asturias', 'Premium Account', '2018-12-21');
INSERT INTO Revenue VALUES(10, 760, 'Jamaica', NULL, 'Premium Account', '2018-12-21');

INSERT INTO Customer VALUES(76, 'Valeria', 'Vasylchenko', 'Finland', 'Joensuu', '2002-08-15', 2);
INSERT INTO Customer VALUES(105, 'Carrie', 'Wood', 'United States', 'Cansas', '2003-08-08', 1);
INSERT INTO Customer VALUES(203, 'Rodrigo', 'Berganza', 'Spain', 'Cuenca', '2005-09-28', 2);
INSERT INTO Customer VALUES(214, 'Michael', 'Auclair', 'France', 'Marseille', '2009-04-21', 1);
INSERT INTO Customer VALUES(287, 'Orosz', 'Mátyás', 'Hungary', 'Miskolc', '2009-11-20', 1);
INSERT INTO Customer VALUES(305, 'Shaafia', 'Bhatia', 'Pakistan', 'Karachi', '2010-03-14', 2);
INSERT INTO Customer VALUES(341, 'Jorgelina', 'Pisani', 'Argentina', 'Córdoba', '2011-10-01', 1);
INSERT INTO Customer VALUES(411, 'Prasong', 'Chearavanont', 'Taiwan', 'Taipei', '2013-01-01', 2);
INSERT INTO Customer VALUES(429, 'Kazymyr', 'Hryshko', 'Ukraine', 'Zaporižžja', '2013-05-16', 1);
INSERT INTO Customer VALUES(500, 'Talicia', 'Sirigle', 'Jamaica', 'Ocho Rios', '2018-08-19', 2);

INSERT INTO Artist VALUES(99, 'God Is An Astronaut');
INSERT INTO Artist VALUES(201, 'Dark Tranquillity');
INSERT INTO Artist VALUES(865, 'BANKS');

INSERT INTO Album VALUES(188, 99, 'Epitaph', 2018);
INSERT INTO Album VALUES(345, 201, 'Atoma', 2016);
INSERT INTO Album VALUES(1065, 865, 'Underdog', 2017);

-- Albumi Epitah artistilta God Is An Astronaut
INSERT INTO Song VALUES(68, 188, 'Epitaph', 474, 'Napalm Records Handels GmbH');
INSERT INTO Song VALUES(69, 188, 'Mortal Coil', 333, 'Napalm Records Handels GmbH');
INSERT INTO Song VALUES(70, 188, 'Winter Dusk/awakening', 402, 'Napalm Records Handels GmbH');
INSERT INTO Song VALUES(71, 188, 'Seance Room', 461, 'Napalm Records Handels GmbH');
INSERT INTO Song VALUES(72, 188, 'Komorebi', 331, 'Napalm Records Handels GmbH');
INSERT INTO Song VALUES(73, 188, 'Medea', 418, 'Napalm Records Handels GmbH');
INSERT INTO Song VALUES(74, 188, 'Oisín', 259, 'Napalm Records Handels GmbH');

-- Albumi Atoma artistilta Dark Tranquillity
INSERT INTO Song VALUES(229, 345, 'Encircled', 212, 'Century Media Records Ltd.');
INSERT INTO Song VALUES(230, 345, 'Atoma', 260, 'Century Media Records Ltd.');
INSERT INTO Song VALUES(231, 345, 'Forward Momentum', 221, 'Century Media Records Ltd.');
INSERT INTO Song VALUES(232, 345, 'Neutrality', 257, 'Century Media Records Ltd.');
INSERT INTO Song VALUES(233, 345, 'Force of Hand', 272, 'Century Media Records Ltd.');
INSERT INTO Song VALUES(234, 345, 'Faithless by Default', 272, 'Century Media Records Ltd.');
INSERT INTO Song VALUES(235, 345, 'The Pitiless', 248, 'Century Media Records Ltd.');
INSERT INTO Song VALUES(236, 345, 'Our Proof of Life', 263, 'Century Media Records Ltd.');
INSERT INTO Song VALUES(237, 345, 'Clearing Skies', 213, 'Century Media Records Ltd.');
INSERT INTO Song VALUES(238, 345, 'When the World Screams', 237, 'Century Media Records Ltd.');
INSERT INTO Song VALUES(239, 345, 'Merciless Fate', 263, 'Century Media Records Ltd.');
INSERT INTO Song VALUES(240, 345, 'Caves and Embers', 271, 'Century Media Records Ltd.');

-- Albumi Underdog artistilta BANKS
INSERT INTO Song VALUES(766, 1065, 'Underdog', 279, 'UMG Recordings, Inc.');
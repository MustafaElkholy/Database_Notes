use PMDB

-- This is the way how i insert values into a table
insert into PM.Companies (CRNNO , CompanyName) values (101,N'Company A');
insert into PM.Companies (CompanyName ,CRNNO ) values (N'Company B',102);
insert into PM.Companies values (103,N'Company C');

insert into PM.Companies values (104,N'Company D'),
(105,N'Company E'),
(106,N'Company F'),
(107,N'Company G');
Go


INSERT INTO PM.Managers (Id ,Email) VALUES (201, 'peter@fake.com');
INSERT INTO PM.Managers (Id ,Email) VALUES (202, 'mike@fake.com');
INSERT INTO PM.Managers (Id ,Email) VALUES (203, 'reem@fake.com');
INSERT INTO PM.Managers (Id ,Email) VALUES (204, 'salah@fake.com'); 

GO
INSERT INTO PM.Technologies(Id , Name) VALUES (301, 'SQL SERVER');
INSERT INTO PM.Technologies(Id , Name) VALUES (302, 'ASP NET CORE');
INSERT INTO PM.Technologies(Id , Name) VALUES (303, 'ANGULAR');
INSERT INTO PM.Technologies(Id , Name) VALUES (304, 'REACT');
INSERT INTO PM.Technologies(Id , Name) VALUES (305, 'WPF');
INSERT INTO PM.Technologies(Id , Name) VALUES (306, 'ANDROID');
INSERT INTO PM.Technologies(Id , Name) VALUES (307, 'ORACLE');
INSERT INTO PM.Technologies(Id , Name) VALUES (308, 'PHP'); 

GO

INSERT INTO PM.Projects ( PRJNO, Title, ManagerId, StartDate, InitialCost, Parked, CRNNO)
     VALUES ( 401, 'CMS', 201, '2022-01-01', 15000000, 0, 101),
            ( 402, 'ERP', 202, '2022-02-01', 20000000, 0, 102),
            ( 403, 'CMS', 203, '2022-03-01', 15000000, 0, 105),
            ( 404, 'Authenticator', 204, '2022-04-01', 150000, 0, 101),
            ( 405, 'CRM-DESKTOP', 203, '2022-05-01', 20000000, 0, 104),
            ( 406, 'ERP', 204, '2022-06-01', 20000000, 0, 105),
            ( 407, 'HUB', 204, '2022-06-01', 20000000, 1, 104);

GO

INSERT INTO PM.ProjectTechnologies (PRJNO, TechnologyId) VALUES 
        ( 401, 301), 
        ( 401, 302),
		( 401, 303),
		( 402, 301), 
        ( 402, 302),
		( 402, 304),
		( 403, 301), 
        ( 403, 302),
		( 403, 308),
		( 404, 306),
		( 405, 307),
		( 405, 305),
		( 406, 307),
		( 406, 308);
GO
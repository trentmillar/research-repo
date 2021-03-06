USE BLPDB
GO

-- POPULATE BUSINESS TABLES
INSERT INTO [agency]._SORTIE (SORTIE_ID, SORTIE_NAME, SORTIE_POPULATION, COMPARTMENT_ID, CLASSIFICATION_ID) VALUES (1, 'Tim Buk Tu', 239000, 1, 1);
INSERT INTO [agency]._SORTIE (SORTIE_ID, SORTIE_NAME, SORTIE_POPULATION, COMPARTMENT_ID, CLASSIFICATION_ID) VALUES (2, 'Shangri La', 430000, 1, 3);
INSERT INTO [agency]._SORTIE (SORTIE_ID, SORTIE_NAME, SORTIE_POPULATION, COMPARTMENT_ID, CLASSIFICATION_ID) VALUES (3, 'Atlantis', 1980000, 3, 1);
INSERT INTO [agency]._SORTIE (SORTIE_ID, SORTIE_NAME, SORTIE_POPULATION, COMPARTMENT_ID, CLASSIFICATION_ID) VALUES (4, 'El Dorado', 3210, 2, 4);
INSERT INTO [agency]._SORTIE (SORTIE_ID, SORTIE_NAME, SORTIE_POPULATION, COMPARTMENT_ID, CLASSIFICATION_ID) VALUES (5, 'Xanadu', 282000, 2, 1);

INSERT INTO [agency]._INFORMANT (INFORMANT_ID, INFORMANT_FIRSTNAME, INFORMANT_LASTNAME, INFORMANT_GENDER, INFORMANT_BIRTHDATE, CLASSIFICATION_ID) 
	VALUES (1, 'Tom', 'Cruise', 'M', 'Jan 1, 1966', 4);
INSERT INTO [agency]._INFORMANT (INFORMANT_ID, INFORMANT_FIRSTNAME, INFORMANT_LASTNAME, INFORMANT_GENDER, INFORMANT_BIRTHDATE, CLASSIFICATION_ID) 
	VALUES (2, 'Amy', 'Adams', 'F', 'Mar 12, 1976', 2);
INSERT INTO [agency]._INFORMANT (INFORMANT_ID, INFORMANT_FIRSTNAME, INFORMANT_LASTNAME, INFORMANT_GENDER, INFORMANT_BIRTHDATE, CLASSIFICATION_ID) 
	VALUES (3, 'Jennifer', 'Lopez', 'F', 'Dec 10, 1970', 3);
INSERT INTO [agency]._INFORMANT (INFORMANT_ID, INFORMANT_FIRSTNAME, INFORMANT_LASTNAME, INFORMANT_GENDER, INFORMANT_BIRTHDATE, CLASSIFICATION_ID) 
	VALUES (4, 'Jude', 'Lay', 'M', 'Aug 22, 1966', 2);
INSERT INTO [agency]._INFORMANT (INFORMANT_ID, INFORMANT_FIRSTNAME, INFORMANT_LASTNAME, INFORMANT_GENDER, INFORMANT_BIRTHDATE, CLASSIFICATION_ID) 
	VALUES (5, 'Bob', 'Unimportant', 'M', 'Feb 22, 1983', 1);

INSERT INTO [agency]._SECRET (INFORMANT_ID, SORTIE_ID, CLASSIFICATION_ID, SECRET_TITLE, SECRET_DESCRIPTION, SECRET_DATETIME)
	VALUES (1, 3, 3, 'High value target sighting', 'While filming Aquaman 2, I saw the leader of the resistance, "Salad Fingers" in town square.', 'Apr, 10, 2013 18:30:00');
INSERT INTO [agency]._SECRET (INFORMANT_ID, SORTIE_ID, CLASSIFICATION_ID, SECRET_TITLE, SECRET_DESCRIPTION, SECRET_DATETIME)
	VALUES (4, 3, 4, 'Eureka!', 'Salad Fingers'' address is 1002 Poseidon Street.', 'Apr, 13, 2013 13:00:00');
INSERT INTO [agency]._SECRET (INFORMANT_ID, SORTIE_ID, CLASSIFICATION_ID, SECRET_TITLE, SECRET_DESCRIPTION, SECRET_DATETIME)
	VALUES (3, 1, 2, 'SAM site spotted', 'On the fourth tower there is a sam site that looks active', 'Jun, 30, 2012 11:20:00');
INSERT INTO [agency]._SECRET (INFORMANT_ID, SORTIE_ID, CLASSIFICATION_ID, SECRET_TITLE, SECRET_DESCRIPTION, SECRET_DATETIME)
	VALUES (5, 3, 1, 'Rude servers at IHOP', 'Don''t send anybody to this place, they are really bad', 'Apr, 30, 2013 08:00:00');
	

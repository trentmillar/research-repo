USE BLPDB
GO
	
-- Add business tables
CREATE TABLE [agency]._SORTIE (
  SORTIE_ID INT NOT NULL,
  SORTIE_NAME VARCHAR(30) NOT NULL,
  SORTIE_POPULATION INT CHECK (SORTIE_POPULATION >= 0),
  COMPARTMENT_ID INT NOT NULL DEFAULT(1),
  CLASSIFICATION_ID INT NOT NULL DEFAULT(1),
 PRIMARY KEY CLUSTERED (SORTIE_ID ASC),
 FOREIGN KEY (COMPARTMENT_ID) REFERENCES [agency].[COMPARTMENT]([COMPARTMENT_ID]),
 FOREIGN KEY ([CLASSIFICATION_ID]) REFERENCES [agency].[CLASSIFICATION]([CLASSIFICATION_ID])
);

CREATE TABLE [agency]._INFORMANT (
  INFORMANT_ID INT NOT NULL,
  INFORMANT_FIRSTNAME VARCHAR(30),
  INFORMANT_LASTNAME VARCHAR(30),
  INFORMANT_GENDER CHAR(1) CHECK (INFORMANT_GENDER IN ('M', 'F')),
  INFORMANT_BIRTHDATE DATE,
  COMPARTMENT_ID INT NOT NULL DEFAULT(1),
  CLASSIFICATION_ID INT NOT NULL DEFAULT(1),
 PRIMARY KEY CLUSTERED (INFORMANT_ID ASC),
 FOREIGN KEY (COMPARTMENT_ID) REFERENCES [agency].[COMPARTMENT]([COMPARTMENT_ID]),
 FOREIGN KEY ([CLASSIFICATION_ID]) REFERENCES [agency].[CLASSIFICATION]([CLASSIFICATION_ID])
);

CREATE TABLE [agency]._SECRET (
  SECRET_ID INT IDENTITY(1,1) NOT NULL,
  INFORMANT_ID INT,
  SORTIE_ID INT NOT NULL,
  SECRET_TITLE VARCHAR(100) NOT NULL,
  SECRET_DESCRIPTION VARCHAR(500) NOT NULL,
  SECRET_DATETIME DATETIME,
  COMPARTMENT_ID INT NOT NULL DEFAULT(1),
  CLASSIFICATION_ID INT NOT NULL DEFAULT(1),
  PRIMARY KEY CLUSTERED (SECRET_ID ASC),
  FOREIGN KEY (INFORMANT_ID) REFERENCES [agency]._INFORMANT(INFORMANT_ID),
  FOREIGN KEY (SORTIE_ID) REFERENCES [agency]._SORTIE(SORTIE_ID),
  FOREIGN KEY (COMPARTMENT_ID) REFERENCES [agency].[COMPARTMENT]([COMPARTMENT_ID]),
  FOREIGN KEY ([CLASSIFICATION_ID]) REFERENCES [agency].[CLASSIFICATION]([CLASSIFICATION_ID])
);
GO

DENY SELECT ON [agency].[_SECRET] TO [BLRole];
GO
DENY SELECT ON [agency].[_INFORMANT] TO [BLRole];
GO
DENY SELECT ON [agency].[_SORTIE] TO [BLRole];
GO
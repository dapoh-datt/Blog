/* RDS ORACLE INSTANCE -- TARGET
RUN AS SYSDBA */




--CREATE REQUIRED SOURCE TABLESPACE ON TARGET
CREATE TABLESPACE ANONGDB
    DATAFILE SIZE 100M AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED;
	
	
	
--CREATE DMS USER

CREATE USER AWS_DMS_USER IDENTIFIED BY SuperSecretPW01
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

ALTER USER AWS_DMS_USER QUOTA UNLIMITED ON USERS;


-- GRANT PRIVILEGES TO THE DMS USER SCHEMA
GRANT CREATE ANY DIRECTORY TO AWS_DMS_USER ;
GRANT CREATE SESSION TO AWS_DMS_USER ;
GRANT SELECT ANY TRANSACTION TO AWS_DMS_USER;
GRANT SELECT on V$NLS_PARAMETERS TO AWS_DMS_USER;
GRANT SELECT on V$TIMEZONE_NAMES TO AWS_DMS_USER;
GRANT SELECT on GRANT INDEXES TO AWS_DMS_USER;
GRANT SELECT on GRANT OBJECTS TO AWS_DMS_USER;
GRANT SELECT on DBA_OBJECTS TO AWS_DMS_USER;
GRANT SELECT on GRANT TABLES TO AWS_DMS_USER;
GRANT SELECT on GRANT USERS TO AWS_DMS_USER;
GRANT SELECT on GRANT CATALOG TO AWS_DMS_USER;
GRANT SELECT on GRANT CONSTRAINTS TO AWS_DMS_USER;
GRANT SELECT on GRANT CONS_COLUMNS TO AWS_DMS_USER;
GRANT SELECT on GRANT TAB_COLS TO AWS_DMS_USER;
GRANT SELECT on GRANT IND_COLUMNS TO AWS_DMS_USER;
GRANT DROP ANY TABLE TO AWS_DMS_USER;
GRANT SELECT ANY TABLE TO AWS_DMS_USER;
GRANT INSERT ANY TABLE TO AWS_DMS_USER;
GRANT UPDATE ANY TABLE TO AWS_DMS_USER;
GRANT CREATE ANY VIEW TO AWS_DMS_USER;
GRANT DROP ANY VIEW TO AWS_DMS_USER;
GRANT CREATE ANY PROCEDURE TO AWS_DMS_USER;
GRANT ALTER ANY PROCEDURE TO AWS_DMS_USER;
GRANT DROP ANY PROCEDURE TO AWS_DMS_USER;
GRANT CREATE ANY SEQUENCE TO AWS_DMS_USER;
GRANT ALTER ANY SEQUENCE TO AWS_DMS_USER;
GRANT DROP ANY SEQUENCE TO AWS_DMS_USER;
GRANT SELECT on DBA_USERS TO AWS_DMS_USER;
GRANT SELECT on DBA_TAB_PRIVS TO AWS_DMS_USER;
GRANT SELECT on DBA_OBJECTS TO AWS_DMS_USER;
GRANT SELECT on DBA_SYNONYMS TO AWS_DMS_USER;
GRANT SELECT on DBA_SEQUENCES TO AWS_DMS_USER;
GRANT SELECT on DBA_TYPES TO AWS_DMS_USER;
GRANT SELECT on DBA_INDEXES TO AWS_DMS_USER;
GRANT SELECT on DBA_TABLES TO AWS_DMS_USER;
GRANT SELECT on DBA_TRIGGERS TO AWS_DMS_USER;





--CREATE SOURCE SCHEMA (SCHEMA TO BE REPLICATED WITH NO DATA):

-- USER SQL
CREATE USER DRWHO IDENTIFIED BY SuperAwesome#FemaleDoc
DEFAULT TABLESPACE ANONGDB
TEMPORARY TABLESPACE TEMP;

ALTER USER DRWHO QUOTA UNLIMITED ON ANONGDB;

-- GRANT THE PRIVILEGES THAT EXIST ON THE SOURCE
GRANT CREATE TABLE TO DRWHO ;
GRANT CREATE PUBLIC SYNONYM TO DRWHO ;

GRANT "DBA" TO DRWHO ;
GRANT "CONNECT" TO DRWHO;

GRANT ALTER ANY TABLE TO DRWHO;
GRANT CREATE SESSION TO DRWHO;
GRANT UNLIMITED TABLESPACE TO DRWHO;
GRANT CREATE TRIGGER TO DRWHO;
ALTER USER DRWHO DEFAULT ROLE "DBA","CONNECT";

--CREATE ROLES FROM SOURCE:
-- ROLE SQL
CREATE ROLE WOMENINTECH;
GRANT CREATE SESSION TO WOMENINTECH;





/* CREATE DMS CONTROL SCHEMA FOR LOGGING DMS TASK */
CREATE USER DMS_CTRL01 IDENTIFIED BY SuperSecretPW02 
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;


ALTER USER DMS_CTRL01 QUOTA UNLIMITED ON USERS;


-- GRANT PRIVILEGES TO THE CONTROL SCHEMA
GRANT UNLIMITED TABLESPACE TO DMS_CTRL01 ;
GRANT LOCK ANY TABLE TO DMS_CTRL01;
GRANT CREATE ANY TABLE TO DMS_CTRL01;
GRANT CREATE ANY INDEX  TO DMS_CTRL01;
GRANT CREATE SESSION TO DMS_CTRL01;


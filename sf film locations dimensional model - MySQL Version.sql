roo-- sf slim locations
-- 2022-03-27
-- r sherman

CREATE TABLE dim_FilmTitles (
	FilmTitleSK int NOT NULL AUTO_INCREMENT,
	title varchar(80) NOT NULL,
	release_year int NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (FilmTitleSK)
);

CREATE TABLE dim_FilmTitles_2021 (
	FilmTitleSK int NOT NULL AUTO_INCREMENT,
	title varchar(80) NOT NULL,
	release_year int NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (FilmTitleSK)
);

CREATE TABLE dim_Locations (
	LocationSK int NOT NULL AUTO_INCREMENT,
	locations varchar(255) NOT NULL,
	city varchar(80) DEFAULT ('San Francisco') NOT NULL,
	state varchar(80) DEFAULT ('CA') NOT NULL,
	country varchar(80) DEFAULT ('USA') NOT NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (LocationSK)
);

CREATE TABLE dim_FunFacts (
	FunFactsSK int NOT NULL AUTO_INCREMENT,
	fun_facts varchar(1024) NOT NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (FunFactsSK)
);

CREATE TABLE dim_Actors (
	ActorSK int NOT NULL AUTO_INCREMENT,
	actor varchar(80) NOT NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (ActorSK)
);

CREATE TABLE dim_Writer (
	WriterSK  int NOT NULL AUTO_INCREMENT,
	writer varchar(128) NOT NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (WriterSK)
);

CREATE TABLE dim_Director (
	DirectorSK  int NOT NULL AUTO_INCREMENT,
	director varchar(128) NOT NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (DirectorSK)
);

CREATE TABLE dim_Distributor (
	DistributorSK  int NOT NULL AUTO_INCREMENT,
	distributor varchar(128) NOT NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (DistributorSK)
);

CREATE TABLE dim_ProductionCompany (
	ProductionCompanySK  int NOT NULL AUTO_INCREMENT,
	Production_Company varchar(128) NOT NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (ProductionCompanySK)
);

-- ----------------------------------------------------------------------------------------------------------------------

CREATE TABLE fct_FilmLocations (
	FilmTitleSK int NOT NULL,
	LocationSK int NOT NULL default -99,
	FunFactsSK int NOT NULL default -99,

	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (FilmTitleSK,LocationSK,FunFactsSK)
);

-- ----------  bridge dimensions-------------------------------------

CREATE TABLE bdg_FilmActors (
	FilmTitleSK int NOT NULL,
	ActorSK int NOT NULL default -99,

	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (FilmTitleSK, ActorSK)
);

CREATE TABLE bdg_FilmDirector (
	FilmTitleSK int NOT NULL,
	DirectorSK int NOT NULL default -99,

	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (FilmTitleSK, DirectorSK)
);

CREATE TABLE bdg_FilmDistributor (
	FilmTitleSK int NOT NULL,
	DistributorSK int NOT NULL default -99,

	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (FilmTitleSK, DistributorSK)
);

CREATE TABLE bdg_FilmWriter (
	FilmTitleSK int NOT NULL,
	WriterSK  int NOT NULL default -99,

	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (FilmTitleSK, WriterSK)
);

CREATE TABLE bdg_FilmProductionCompany (
	FilmTitleSK int NOT NULL,
	ProductionCompanySK  int NOT NULL default -99,

	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (FilmTitleSK, ProductionCompanySK)
);

-- ------------------------------- STG ------------------------------------------------------------------------

-- stg_sf_Film_Locations_tsv 
CREATE TABLE stg_sf_Film_Locations_tsv (
	sf_film_locations_sk int NOT NULL AUTO_INCREMENT,
	title varchar(80) NOT NULL,
	release_year int NULL,
	locations varchar(255) NULL,
	fun_facts varchar(1024) NULL,
	production_company varchar(128) NULL,
	distributor varchar(128) NULL,
	director varchar(128) NULL,
	writer varchar(128) NULL,
	actor_1 varchar(80) NULL,
	actor_2 varchar(80) NULL,
	actor_3 varchar(80) NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (sf_film_locations_sk)
);


-- stg_sf_film_locations 
CREATE TABLE stg_sf_film_locations (
	sf_film_locations_sk int NOT NULL AUTO_INCREMENT,
	title varchar(80) NOT NULL,
	release_year int NULL,
	locations varchar(255) NULL,
	fun_facts varchar(1024) NULL,
	production_company varchar(128) NULL,
	distributor varchar(128) NULL,
	director varchar(128) NULL,
	writer varchar(128) NULL,
	actor_1 varchar(80) NULL,
	actor_2 varchar(80) NULL,
	actor_3 varchar(80) NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (sf_film_locations_sk)
);

-- stg_sf_Film_Locations_tsv 
CREATE TABLE stg_sf_Film_Locations_2021 (
	sf_film_locations_sk int NOT NULL AUTO_INCREMENT,
	title varchar(80) NOT NULL,
	release_year int NULL,
	locations varchar(255) NULL,
	fun_facts varchar(1024) NULL,
	production_company varchar(128) NULL,
	distributor varchar(128) NULL,
	director varchar(128) NULL,
	writer varchar(128) NULL,
	actor_1 varchar(80) NULL,
	actor_2 varchar(80) NULL,
	actor_3 varchar(80) NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (sf_film_locations_sk)
);

-- stg_sf_Film_Locations_tsv 
CREATE TABLE stg_sf_Film_Locations_BigQuery (
	sf_film_locations_sk int NOT NULL AUTO_INCREMENT,
	title varchar(80) NOT NULL,
	release_year int NULL,
	locations varchar(255) NULL,
	fun_facts varchar(1024) NULL,
	production_company varchar(128) NULL,
	distributor varchar(128) NULL,
	director varchar(128) NULL,
	writer varchar(128) NULL,
	actor_1 varchar(80) NULL,
	actor_2 varchar(80) NULL,
	actor_3 varchar(80) NULL,
	DI_JobID varchar(20) NULL,
	DI_CreateDate datetime(3) DEFAULT (now(3)) NOT NULL,
	PRIMARY KEY (sf_film_locations_sk)
);

///////////////////////////////////////// Creation

CREATE SEQUENCE electeur
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE filier
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

create table electeurs(
    idelec integer primary key,
    nom varchar(30),
    pnom varchar(30),
    ddn date,
    nvot integer,
    nchoix integer,
    cand integer,
    idfil integer foreign key references filiere
);

create table filiere(
    idfil integer primary key,
    nomfil varchar(30)
);



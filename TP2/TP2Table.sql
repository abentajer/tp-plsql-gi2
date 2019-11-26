DROP TABLE electeur;
DROP TABLE filiere;
DROP SEQUENCE filiere_seq;
DROP SEQUENCE electeur_seq;

CREATE SEQUENCE filiere_seq
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE electeur_seq
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

create table filiere(idfil int, nomfil varchar(30), PRIMARY KEY(idfil));

create table electeur(idelec int, 
nom varchar(30), 
pnom varchar(30), 
ddn date, nvot int, 
nvoix int, 
cand int, 
idfil int, 
PRIMARY KEY(idelec), 
FOREIGN KEY(idfil) REFERENCES filiere(idfil));

-----------------------

insert into filiere values (filiere_seq.NEXTVAL, 'GI');
insert into filiere values (filiere_seq.NEXTVAL, 'GM');
------------------------
insert into electeur values(electeur_seq.NEXTVAL, 'nom1', 'prenom1', '19/5/1997',1,0,0,1);

insert into electeur values(electeur_seq.NEXTVAL, 'nom2', 'prenom2', '19/5/1997',2,3,1,1);

insert into electeur values(electeur_seq.NEXTVAL, 'nom3', 'prenom3', '19/5/1997',1,12,1,2);

insert into electeur values(electeur_seq.NEXTVAL, 'nom4', 'prenom4', '19/5/1997',1,11,1,2);

insert into electeur values(electeur_seq.NEXTVAL, 'nom5', 'prenom5', '19/5/1997',1,0,0,2);

insert into electeur values(electeur_seq.NEXTVAL, 'nom6', 'prenom6', '19/5/1997',3,0,1,1);

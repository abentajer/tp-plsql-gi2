/********* Creation des tables *************/

CREATE TABLE Filiere(
idfil NUMBER(5) PRIMARY KEY,
nomfil VARCHAR(40) NOT NULL
);

CREATE TABLE ELECTEURS(
idelec NUMBER(5) PRIMARY KEY, 
nom VARCHAR(10),
pnom VARCHAR(10),
ddn DATE,
nvot NUMBER(5),
nvoix NUMBER(5),
cand NUMBER(2),
idfl NUMBER(5),
CONSTRAINT idfl
	FOREIGN KEY (idfl)
	REFERENCES Filiere(idfil)
);







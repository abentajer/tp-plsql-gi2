CREATE TABLE filiere(
idfil NUMBER(5) PRIMARY KEY,
nomfil VARCHAR2(50) NOT NULL
);


CREATE TABLE electeurs(
idelec NUMBER(5) PRIMARY KEY,
nom VARCHAR2(20) NOT NULL,
pnom VARCHAR2(20),
ddn DATE ,
nvote NUMBER(5),
nvoix NUMBER(5),
cand NUMBER(5),
idfl NUMBER(5),
CONSTRAINT idfl
    FOREIGN KEY (idfl)
    REFERENCES filiere(idfil)
);
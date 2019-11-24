/********* Creation des tables *************/

CREATE TABLE tab_filiere(
        idfil NUMBER(5) PRIMARY KEY,
        nomfil VARCHAR2(38) NOT NULL
);

CREATE TABLE tab_electeur(
        idelec NUMBER(5) PRIMARY KEY, 
        nom VARCHAR(10),
        pnom VARCHAR(10),
        ddn DATE,
        nvot NUMBER(5),
        nvoix NUMBER(5),
        cand VARCHAR2(5),
        idfl NUMBER(5), 
        CONSTRAINT idfl
            FOREIGN KEY (idfl)
            REFERENCES tab_filiere(idfil)
);
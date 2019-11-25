--------------La création des tables
CREATE TABLE Filiere (
    idfil NUMBER(3) PRIMARY key,
    nomfil VARCHAR2(20));
CREATE TABLE Electeurs (
    idelec NUMBER(5) PRIMARY key,
    nom VARCHAR2(20),
    prenom VARCHAR2(20),
    ddn DATE,
    nvot NUMBER(5),
    nvoix NUMBER(5),
    cand NUMBER(1),
    idfl NUMBER(3),
    FOREIGN KEY (idfl) REFERENCES Filiere(idfil));

----------1. Créer deux séquences pour les filières et pour les électeurs. 
CREATE SEQUENCE filiere_seq
  MINVALUE 1
  MAXVALUE 10
  START WITH 1
  INCREMENT BY 1;
 

CREATE SEQUENCE electeur_seq
  MINVALUE 1
  MAXVALUE 3000
  START WITH 1
  INCREMENT BY 1;

-- 2. Créer un curseur qui affiche la liste des candidats au BDE; 
set serveroutput on
DECLARE
c_id Electeurs.idelec%type;
c_name Electeurs.nom%type;
c_prenom Electeurs.prenom%type;
CURSOR liste_bde IS
 SELECT idelec , nom , prenom FROM Electeurs WHERE cand=1;

BEGIN
OPEN liste_bde;
 dbms_output.put_line('La liste des condidats au BDE:');
    LOOP 
    FETCH liste_bde into c_id, c_name, c_prenom;
    EXIT WHEN liste_bde%notfound;
     dbms_output.put_line(c_id || ' '|| c_name ||' ' ||c_prenom);
    END LOOP;
    CLOSE liste_bde;
    END;

--3. Créer un curseur puis afficher juste la liste des électeurs ;
 DECLARE
c_id Electeurs.idelec%type;
c_name Electeurs.nom%type;
c_prenom Electeurs.prenom%type;
CURSOR liste_elec IS
 SELECT idelec , nom , prenom FROM Electeurs WHERE cand=0;

BEGIN
OPEN liste_elec;
 dbms_output.put_line('La liste des électeurs:');
    LOOP 
    FETCH liste_elec into c_id, c_name, c_prenom;
    EXIT WHEN liste_elec%notfound;
     dbms_output.put_line(c_id || ' '|| c_name ||' ' ||c_prenom);
    END LOOP;
    CLOSE liste_elec;
    END;

--4. Créer un curseur puis afficher les filières ; 
DECLARE
c_id Filiere.idfil%type;
c_name Filiere.nomfil%type;

CURSOR liste_fil IS
 SELECT idfil , nomfil  FROM Filiere;

BEGIN
OPEN liste_fil;
 dbms_output.put_line('La liste des filières:');
    LOOP 
    FETCH liste_fil into c_id, c_name;
    EXIT WHEN liste_fil%notfound;
     dbms_output.put_line(c_id || ' '|| c_name);
    END LOOP;
    CLOSE liste_fil;
    END;

--5. Créer un curseur puis afficher tous les électeurs (candidats et électeurs) 
DECLARE
c_id Electeurs.idelec%type;
c_name Electeurs.nom%type;
c_prenom Electeurs.prenom%type;
CURSOR liste_elec_cond IS
 SELECT idelec , nom , prenom FROM Electeurs;

BEGIN
OPEN liste_elec_cond;
 dbms_output.put_line('La liste de tous les élécteurs:');
    LOOP 
    FETCH liste_elec_cond into c_id, c_name, c_prenom;
    EXIT WHEN liste_elec_cond%notfound;
     dbms_output.put_line(c_id || ' '|| c_name ||' ' ||c_prenom);
    END LOOP;
    CLOSE liste_elec_cond;
    END;


--6. Créer un curseur permettant d’afficher le nombre de vote par filière, puis stocker le résultat dans une index-by table
DECLARE 
CURSOR liste_nbrvote_fil IS
 SELECT Filiere.idfil ,SUM(Electeurs.nvot) as somme FROM Filiere, electeurs
WHERE Filiere.idfil=Electeurs.idfl group by idfil;
 

 TYPE liste_vot IS TABLE of Electeurs.nvot%type INDEX BY binary_integer;
 nbrvot liste_vot;
 index_fil Filiere.idfil%type;

BEGIN

 dbms_output.put_line('La liste des nombres de vote par filière:');
   FOR n IN liste_nbrvote_fil LOOP
      index_fil :=n.idfil;
      nbrvot(index_fil) := n.somme;
      dbms_output.put_line('FILIERE('||index_fil||'):'||nbrvot(index_fil));
    END LOOP;
    END;
/
-----7. Créer un curseur paramétré permettant d’afficher la liste des candidats d’une filière 
accept x char prompt 'Entrer le id du filière  :';
-----
DECLARE
a Filiere.idfil%type;
c_id Filiere.idfil%type;
c_nom Electeurs.nom%type;
c_prenom Electeurs.prenom%type;


CURSOR liste_cand_fil (param filiere.idfil%type) IS
 SELECT nom , prenom  FROM electeurs WHERE idfl=param and cand=1;

BEGIN
a:='&x';
OPEN liste_cand_fil(a);
 dbms_output.put_line('Les candidats de cette filière sont:');
    LOOP 
    FETCH liste_cand_fil into c_nom, c_prenom;
    EXIT WHEN liste_cand_fil%notfound;
     dbms_output.put_line(c_nom || ' '|| c_prenom);
    END LOOP;
    CLOSE liste_cand_fil;
    END;

--------------8. Créer un curseur paramétré permettant d’afficher la liste des candidats ayant nvoix > 10 puis ajouter leurs noms dans une nested-table 
DECLARE
c_id Electeurs.idelec%type;
c_name Electeurs.nom%type;
c_prenom Electeurs.prenom%type;
c_nvoix Electeurs.nvoix%type;
TYPE TABLE_cand IS TABLE of Electeurs.nom%type;
counter integer :=0;
table1 TABLE_cand := TABLE_cand();
CURSOR liste_cand_nvoix(param Electeurs.nvoix%TYPE) IS
 SELECT idelec , nom , prenom , nvoix FROM Electeurs WHERE cand=1 and nvoix>=param;

BEGIN
OPEN liste_cand_nvoix(10);
    LOOP 
    FETCH liste_cand_nvoix into c_id, c_name, c_prenom, c_nvoix;
    EXIT WHEN liste_cand_nvoix%notfound;
     dbms_output.put_line(c_id || ' '|| c_name ||' ' ||c_prenom ||' N° DE VOIX '|| c_nvoix );
    END LOOP;
CLOSE liste_cand_nvoix;
    FOR n IN liste_cand_nvoix(10) loop
     counter:= counter+1;
     table1.extend;
     table1(counter):=n.nom;
   END loop;
    END;

-----------------9. Créer un curseur paramétré permettant d’afficher la liste des candidats ayant voté plus qu’une fois (nvot > 1) 
DECLARE
c_id Electeurs.idelec%type;
c_name Electeurs.nom%type;
c_prenom Electeurs.prenom%type;
c_nvot Electeurs.nvot%type;

CURSOR liste_cand_nvot(param Electeurs.nvot%TYPE) IS
 SELECT idelec , nom , prenom , nvot FROM Electeurs WHERE cand=1 and nvot>param;

BEGIN
OPEN liste_cand_nvot(1);
    LOOP 
    FETCH liste_cand_nvot into c_id, c_name, c_prenom, c_nvot;
    EXIT WHEN liste_cand_nvot%notfound;
     dbms_output.put_line(c_id || ' '|| c_name ||' ' ||c_prenom || ' N° DE VOTE '|| c_nvot);
    END LOOP;
CLOSE liste_cand_nvot;
 END;

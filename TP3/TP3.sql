create type T_bureau as object ( 
    numero number , 
    centre varchar2(30), 
    batiment varchar2(30), 
    etage number  
    );

create or replace type T_personne as object ( 
    nom varchar2(30), 
    prenom varchar2(30), 
    member function display return varchar2
    )NOT FINAL; 

create or replace type body T_personne is 
    member function display return varchar2 is  
        begin  
            return 'nom :'||nom||' prenom:'||prenom; 
        end display; 
end;


create or replace type T_professeur under T_personne ( 
    personne T_personne,
    bureau T_bureau,
    overriding member function display return varchar2
    )NOT FINAL; 

create or replace type body T_professeur is 
    overriding member function display return varchar2 is  
        begin  
           return (self as T_personne).display||'numero :'||bureau.numero||'centre :'||bureau.centre|| 'batiment :'||bureau.batiment||'etage :'||bureau.etage;
        end display; 
end;

create or replace type T_cours as object ( 
    libelle varchar2(30), 
    code varchar2(30), 
    type varchar2(30), 
    semestre number
    ); 

declare 
a T_personne;
b T_bureau;
c T_professeur;
d T_cours;
begin 
a:=T_personne('aj','benbr');
b:=T_bureau(1,'a','b',3);
c:=T_professeur(a,b);
DBMS_OUTPUT.put_line(c.display());
d:=T_cours('test','rfjh555','c',525);
end;



create type cour_varray as varray(10)of T_cours;
create table cour_list(professeur T_professeur,tableau_cour cour_varray);

Insert into  cour_list values (

cour_array(T_cours(




SELECT d.libelle||' <'||e.nom||'>'
 FROM cour_list w, TABLE(w.T_professeur) e,TABLE(w.cour_varray) d;

SELECT d.semestre||'->  <'||d.libelle'>'||'->  <'||e.nom||'>'
 FROM cour_list w, TABLE(w.T_professeur) e,TABLE(w.cour_varray) d GROUP BY d.semestre;
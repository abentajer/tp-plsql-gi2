--Creating the tables
create table filiere (
    idfil int PRIMARY KEY,
    nomfil varchar(40) not null);

create table electeurs(
    idelec int primary key,
    nom VARCHAR(20) not null,
    prenom varchar(20) not null,
    ddn date not null,
    nvote int not null,
    nvoix int not null,
    cand int not null,
    idfil int not null,
    constraint idfil foreign key (idfil) references filiere(idfil)
);

--Inserting some values 
insert into filiere values (1,'Genie Informatique');
insert into filiere values (2,'Reseaux et Telecom');
insert into filiere values (3,'Genie Civil');
insert into filiere values (4,'Supply Chain Managment');

insert into electeurs values (1,'Abderrahim','HADDADI','20-sep-1997', 1, 0, 0, 1);
insert into electeurs values (2,'Nom1','Prenom1','01-jan-1996', 2, 60, 1, 1);
insert into electeurs values (3,'Nom2','Prenom2','02-feb-1997', 2, 0, 0, 1);
insert into electeurs values (4,'Nom3','Prenom3','03-mar-1996', 0, 0, 0, 2);
insert into electeurs values (5,'Nom4','Prenom4','04-apr-1997', 2, 45, 1, 2);
insert into electeurs values (6,'Nom5','Prenom5','05-may-1999', 0, 0, 0, 3);
insert into electeurs values (7,'Nom6','Prenom6','06-jun-1996', 1, 10, 1, 3);
insert into electeurs values (8,'Nom7','Prenom7','07-jul-1997', 2, 0, 0, 4);
insert into electeurs values (9,'Nom8','Prenom8','08-aug-1998', 1, 57, 1, 4);

--checking the inserted values  : uncomment to see the results
--select * from filiere;
--select * from electeurs;

--Creating the sequences

create sequence fil;
create sequence elec;


--Curseur qui affiche la liste des candidats au BDE 
set SERVEROUTPUT ON size 10000;
DECLARE
    v_nom       electeurs.nom%type;
    v_prenom    electeurs.prenom%type;
    d_ddn       electeurs.ddn%type;
    v_filiere   filiere.nomfil%type;
    cursor c_candidat is 
        select nom, prenom, ddn, nomfil
        from electeurs join filiere 
        on electeurs.idfil=filiere.idfil
        where electeurs.cand = '1';
BEGIN
    open c_candidat;
    dbms_output.put_line('La liste des candidats :');
    dbms_output.put_line('Nom' ||'        '|| 'prenom' ||'        '|| 'Date de naissance' ||'        '|| 'Filiere'); 

    loop
        fetch c_candidat into v_nom, v_prenom, d_ddn, v_filiere;
        exit when c_candidat%notfound;
        dbms_output.put_line(v_nom ||'        '|| v_prenom ||'        '|| d_ddn ||'        '|| v_filiere); 
    end loop;
    close c_candidat;
END;

    
--Curseur qui affiche la liste des electeurs
set serveroutput on size 1000000;
DECLARE
    v_nom       electeurs.nom%type;
    v_prenom    electeurs.prenom%type;
    d_ddn       electeurs.ddn%type;
    v_filiere   filiere.nomfil%type;
    cursor c_candidat is 
        select nom, prenom, ddn, nomfil
        from electeurs join filiere 
        on electeurs.idfil=filiere.idfil
        where electeurs.cand = '0';
BEGIN
    open c_candidat;
    dbms_output.put_line('La liste des electeurs :');
    dbms_output.put_line('Nom' || '     ' || 'prenom' || '     ' || 'Date de naissance' || '     ' || 'Filiere'); 

    loop
        fetch c_candidat into v_nom, v_prenom, d_ddn, v_filiere;
        exit when c_candidat%notfound;
        dbms_output.put_line(v_nom || '    ' || v_prenom || '       ' || d_ddn || '        ' || v_filiere); 
    end loop;
    close c_candidat;
END;


--Curseur qui affiche les filieres
set serveroutput on size 10000;
DECLARE 
    r_filiere     filiere%rowtype;
    cursor c_filiere is
    select * from filiere;
    
BEGIN 
    open c_filiere;
    dbms_output.put_line('La liste des filieres :');
    loop
        fetch c_filiere into r_filiere;
        exit when c_filiere%notfound;
        dbms_output.put_line(r_filiere.idfil || '     ' || r_filiere.nomfil);
    end loop;
    
    close c_filiere;
    
END;


--Curseur qui affiche tous les electeurs(candidates et electeurs)
set SERVEROUTPUT ON size 10000;
DECLARE
    v_nom       electeurs.nom%type;
    v_prenom    electeurs.prenom%type;
    d_ddn       electeurs.ddn%type;
    v_filiere   filiere.nomfil%type;
    cursor c_tous_electeurs is 
        select nom, prenom, ddn, nomfil
        from electeurs join filiere 
        on electeurs.idfil=filiere.idfil;
BEGIN
    open c_tous_electeurs;
    dbms_output.put_line('La liste de tous les etudiants (candidats et electeurs )');
    dbms_output.put_line('Nom' ||'        '|| 'prenom' ||'        '|| 'Date de naissance' ||'        '|| 'Filiere'); 

    loop
        fetch c_tous_electeurs into v_nom, v_prenom, d_ddn, v_filiere;
        exit when c_tous_electeurs%notfound;
        dbms_output.put_line(v_nom ||'        '|| v_prenom ||'        '|| d_ddn ||'        '|| v_filiere); 
    end loop;
    close c_tous_electeurs;
END;


--Curseur parametre qui affiche le nombre de vote par filiere
set SERVEROUTPUT ON size 10000;
DECLARE
    n_nbvote    int;
    v_nomfiliere   filiere.nomfil%type;
    cursor c_nbvote_parfil is 
        select sum(nvote), filiere.nomfil 
        from electeurs join filiere 
        on electeurs.idfil=filiere.idfil
        group by filiere.nomfil;
BEGIN
    open c_nbvote_parfil;
    dbms_output.put_line('Le no;bre de vote pour chaque filiere :');
    dbms_output.put_line('Nombre de vote ' ||'            '|| 'Filiere'); 

    loop
        fetch c_nbvote_parfil into n_nbvote, v_nomfiliere;
        exit when c_nbvote_parfil%notfound;
        dbms_output.put_line(n_nbvote ||'            '|| v_nomfiliere); 
    end loop;
    close c_nbvote_parfil;
END;

--Curseur parametre qui affiche la liste des candidats des filieres
set SERVEROUTPUT ON size 10000;
DECLARE
    v_nom       electeurs.nom%type;
    v_prenom    electeurs.prenom%type;
    d_ddn       electeurs.ddn%type;
    v_filiere   filiere.nomfil%type;
    cursor c_candidat_filiere (nomfil varchar) is 
        select nom, prenom, ddn, nomfil
        from electeurs join filiere 
        on electeurs.idfil=filiere.idfil
        where electeurs.cand = '1'  and filiere.nomfil like '%formatique' ;
BEGIN
    open c_candidat_filiere('formatique');
    dbms_output.put_line('La liste des candidats de la filiere Informatique :');
    dbms_output.put_line('Nom' ||'        '|| 'prenom' ||'        '|| 'Date de naissance' ||'        '|| 'Filiere'); 

    loop
        fetch c_candidat_filiere into v_nom, v_prenom, d_ddn, v_filiere;
        exit when c_candidat_filiere%notfound;
        dbms_output.put_line(v_nom ||'        '|| v_prenom ||'        '|| d_ddn ||'        '|| v_filiere); 
    end loop;
    close c_candidat_filiere;
END;



-- Curseur qui affiche la liste des candidats ayant plus de 10 voix
set serveroutput on size 1000000;
DECLARE
    v_nom       electeurs.nom%type;
    v_prenom    electeurs.prenom%type;
    d_ddn       electeurs.ddn%type;
    n_nbvoix    electeurs.nvoix%type;
    v_nomfil    filiere.nomfil%type;
    type cand_plus10_voix is table of varchar(20);
    t_nom10voix  cand_plus10_voix := cand_plus10_voix(); 
    n_counter int := 0;
    cursor c_cand_plus_10voix (par_nvoix int)  is 
        select nom, prenom, ddn, nomfil,  nvoix
        from electeurs join filiere
        on electeurs.idfil = filiere.idfil
        where cand = 1 and  nvoix > par_nvoix ;
BEGIN
    open c_cand_plus_10voix(10);   
    dbms_output.put_line('Liste des candidats ayant plus de 10 voix : ');
    dbms_output.put_line('Nom' ||'        '|| 'Prenom' ||'        '|| 'date naiss' ||'        '|| 'Nb_voix');
    loop
        n_counter := n_counter +1;
        fetch c_cand_plus_10voix into v_nom, v_prenom, d_ddn, v_nomfil, n_nbvoix;
        t_nom10voix.extend();
        t_nom10voix(n_counter) := v_nom;
        exit when c_cand_plus_10voix%notfound;
        dbms_output.put_line(v_nom ||'        '|| v_prenom ||'        '|| d_ddn ||'        '|| v_nomfil ||'        '|| n_nbvoix);
    end loop;
    close c_cand_plus_10voix;

END;




--Curseur parametre  qui affiche la liste des candidats ayant vote plus d'une fois 

set SERVEROUTPUT ON size 10000;
DECLARE
    v_nom       electeurs.nom%type;
    v_prenom    electeurs.prenom%type;
    d_ddn       electeurs.ddn%type;
    n_vote      electeurs.nvote%type;
    v_filiere   filiere.nomfil%type;
    cursor c_cand_plus1vote(nbvote INT) is 
        select nom, prenom, ddn, nomfil, nvote
        from electeurs join filiere 
        on electeurs.idfil=filiere.idfil
        where cand=1 and  electeurs.nvote > nbvote;
BEGIN
    open c_cand_plus1vote(1);
    dbms_output.put_line('La liste des candidats ayant vote plus d une fois  :');
    dbms_output.put_line('Nom' ||'        '|| 'prenom' ||'        '|| 'Date de naissance' ||'        '|| 'Filiere'||'        '|| n_vote); 

    loop
        fetch c_cand_plus1vote into v_nom, v_prenom, d_ddn, v_filiere, n_vote;
        exit when c_cand_plus1vote%notfound;
        dbms_output.put_line(v_nom ||'        '|| v_prenom ||'        '|| d_ddn ||'        '|| v_filiere||'        '|| n_vote); 
    end loop;
    close c_cand_plus1vote;
END;




-- #####Procedure #####
--Procedure pour ajouter les filieres
    CREATE OR REPLACE 
        procedure ajouter_fil(in_nomfil IN filiere.nomfil%type) IS
    BEGIN
        insert into filiere values(fil.nextval, in_nomfil);
    END;
-- Execution de la procedure : 
EXEC ajouter_fil('Genie Industriel');
select * from filiere;


--Procedure Pour inscrire les electeurs 

CREATE OR REPLACE 
    procedure ajouter_electeurs(
        in_nom      IN electeurs.nom%type,
        in_prenom   IN electeurs.prenom%type,
        in_ddn      IN electeurs.ddn%type,
        in_vote     IN electeurs.nvote%type,
        in_nvoix    IN electeurs.nvoix%type,
        in_cand     IN electeurs.cand%type,
        in_nomfil    IN electeurs.nomfil%type
        ) IS  
        
BEGIN
    insert into electeurs values(elec.nextval, in_nom, in_prenom, in_ddn, in_vote, in_nvoix, in_cand, select filiere.idfil from filiere where nomfil like %in_nomfil%);

END;




--Procedure pour permettre a des electeurs de devenir des candidats : 

CREATE OR REPLACE 
    procedure devenir_candidat(
        in_idelec IN electeurs.idelec%type
        ) IS    
BEGIN
    update electeurs set cand = 1 where idelec = in_idelec;
END;
--resultat avant modification : 
select * from electeurs where idelec=4;
--Execution de la procedure : 
EXEC devenir_candidat(4)
--Resultat apres la modification : 
select * from electeurs where idelec=4;



--Procedure pour voter :

CREATE OR REPLACE 
    procedure voter (in_idelect IN electeurs.idelec%type, in_idcand IN electeurs.idelec%type) IS
BEGIN 
    update electeurs set nvote = nvote +1 where idelec = in_idelect;
    update electeurs set nvoix = nvoix +1 where idelec  = in_idcand;

END;

--resultat avant modification : 
select * from electeurs where idelec=4;
--Execution de la procedure : (Notice : la procedure a deja ete execute  !!!!!!!!)
EXEC voter(4,4)
--Resultat apres la modification : 
select * from electeurs where idelec=4;



--Procedure qui affiche les 3 premiers gagnants 
set serveroutput on size 1000000000000;
CREATE OR REPLACE 
    procedure trois_gagnant  is  
    v_nom           electeurs.nom%type;
    v_prenom        electeurs.prenom%type;
    d_ddn           electeurs.ddn%type;
    v_nomfil        filiere.nomfil%type;
    n_nbvoix        electeurs.nvoix%type;
    cursor c_gagnants is select nom,prenom, ddn, nomfil, nvoix from electeurs join filiere on electeurs.idfil = filiere.idfil order by electeurs.nvoix DESC fetch first 3 rows only;
BEGIN
        open c_gagnants;
        dbms_output.put_line('Liste des gagnants de lelection ');
        dbms_output.put_line('Nom : ' ||'        '|| 'Prenom' ||'        '|| 'Date de Naissance' ||'        '|| 'Filiere' ||'           '|| 'Nb de voix');

        loop
            fetch c_gagnants into  v_nom, v_prenom, d_ddn, v_nomfil, n_nbvoix;
            exit when c_gagnants%notfound;
            dbms_output.put_line(v_nom ||'          '|| v_prenom ||'            '|| d_ddn ||'          '|| v_nomfil ||'           '|| n_nbvoix);

        end loop;
END;
exec trois_gagnant



--Procdeure qui affiche le President du BDE 
set serveroutput on;
CREATE OR REPLACE 
    procedure president is  
    v_nom           electeurs.nom%type;
    v_prenom        electeurs.prenom%type;
    d_ddn           electeurs.ddn%type;
    v_nomfil        filiere.nomfil%type;
    n_nbvoix        electeurs.nvoix%type;
    
BEGIN
    select nom,prenom, ddn, nomfil, nvoix into v_nom, v_prenom, d_ddn, v_nomfil, n_nbvoix from electeurs join filiere on electeurs.idfil = filiere.idfil order by electeurs.nvoix DESC fetch first 1 rows only;
    dbms_output.put_line('Le president du BDE : ');
    dbms_output.put_line('Nom : ' || v_nom);
    dbms_output.put_line('Prenom :'|| v_prenom);
    dbms_output.put_line('Date de naissance  :  ' || d_ddn);
    dbms_output.put_line('Filiere :' || v_nomfil);
    dbms_output.put_line('Nombre de voix :' || n_nbvoix);

END;

EXEC president


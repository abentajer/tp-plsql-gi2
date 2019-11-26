--Creating tables 


create table categorie(
	ctg_code int primary key,
	nom varchar (50) not null
);

create table famille(
	fam_code int primary key,
	nom varchar (50) not null
);

create table item(
	item_ref int primary key,
	nom varchar (150) not null,
	ctg_code int not null,
	fam_code int not null,
	prix_unitaireHT float not null,
	TVA int not null,
	
	constraint ctg_code foreign key (ctg_code) references categorie(ctg_code),
	constraint fam_code foreign key (fam_code) references famille(fam_code)
);

create table region(
	reg_code int primary key,
	nom varchar (120) not null
);

create table client(
	client_code int primary key,
	nom varchar(50) not null,
	adresse varchar(220) not null,
	reg_code int not null,
	contact_date date not null,
	email varchar (60) not null,
	observation varchar (220),
	constraint reg_code foreign key (reg_code) references region(reg_code)

);

create table commande(
	cmd_code int primary key,
	date_cmd date not null,
	etat int not null,
	montantHT float not null, 
	montantTTC float not null,
	client_code int not null,
	constraint client_code foreign key (client_code) references client(client_code)

);

create table cmd_line(
	item_ref int not null,
	qte int not null,
	cmd_code int not null,
	constraint cmd_code foreign key (cmd_code) references commande(cmd_code),
	constraint item_ref foreign key (item_ref) references item(item_ref)
);

create sequence seq_client;
create sequence seq_region;
create sequence seq_categorie;
create sequence seq_famille;
create sequence seq_commande;
create sequence seq_item;

--Inserting values : 
    insert into categorie values (seq_categorie.nextval, 'RAM');
	insert into categorie values (seq_categorie.nextval, 'Disque dur externe');
	insert into categorie values (seq_categorie.nextval, 'Disque dur interne');
	insert into categorie values (seq_categorie.nextval, 'Carte son');
	insert into categorie values (seq_categorie.nextval, 'Carte Graphique');
--select * from categorie;



    insert into famille values (seq_famille.nextval, 'Memoire');
	insert into famille values (seq_famille.nextval, 'Carte');
	insert into famille values (seq_famille.nextval, 'Disque');
--select * from famille;




    insert into region values (seq_region.nextval, 'Tanger-Tetouan-Al Hoceima');
	insert into region values (seq_region.nextval, 'Region de l oriental');
	insert into region values (seq_region.nextval, 'Region de Fes-Meknes');
	insert into region values (seq_region.nextval, 'Region de Rabat-Sale-Kenitra');
	insert into region values (seq_region.nextval, 'Region de Benni Mellal-Khenifra');
	insert into region values (seq_region.nextval, 'Region de Casablanca-Settat');
	insert into region values (seq_region.nextval, 'Region de Marrakech-Safi');
--select * from region;



	insert into item values (seq_item.nextval, 'Barrette Memoire 2Go', 1, 1, 150, 12);
	insert into item values (seq_item.nextval, 'Barrette Memoire 4Go', 1, 1, 240, 12);
	insert into item values (seq_item.nextval, 'Carte Graphique AMD Radean RX 570 4Go', 5, 2, 2349, 20);
	insert into item values (seq_item.nextval, 'Carte son Asus Xonar DG', 4, 2, 750, 12);
	insert into item values (seq_item.nextval, 'Disque Externe Toshiba usb 3.0 1000Go', 2, 3, 546, 33);
--select * from item;



	insert into client values (seq_client.nextval, 'Bentajer', 'Mhannech II, Tetouan', 1, '02-nov-2019', 'ahmed@gmail.com', 'A passe une grosse commande en Janvier; depuis plus rien. Penser a reprendre contact');
	insert into client values (seq_client.nextval, 'Esseghiri', 'Res Naoufal app 8, Maarif, Casablanca', 2, '27-oct-2018', 'youssef@gmail.com', 'Client contactee grace a M. Houty de Casablanca. Remise de 10% sur la derniere commande');
	insert into client values (seq_client.nextval, 'Houty', 'Settat', 2, '20-nov-2018', 'karim@gmail.com', 'Client fidele qui passe des commandes regulierement (une par mois)');
--select * from client;



insert into commande values (seq_commande.nextval, '01-feb-2019', 1, 4329.00, 5036.40, 2);
select * from commande;



	insert into cmd_line values (1, 10, 1);
	insert into cmd_line values (2, 2, 1);
	insert into cmd_line values (3, 1, 1);
select * from cmd_line;


-- Curseurs 
-- Curseur parametre qui affiche les information d'un produit 


set SERVEROUTPUT ON size 100000000000;
DECLARE
	n_item_ref      item.item_ref%type;
	v_nom   	    item.nom%type;
	v_categorie     categorie.nom%type;
	v_famille 	    famille.nom%type;
	n_pu		    item.prix_unitaireHT%type;
	n_tva		    item.TVA%type;

    cursor c_info_prod(reference int ) is 
        select item.nom, categorie.nom, famille.nom,  prix_unitaireHT, TVA
        from item 
	join categorie on item.ctg_code=categorie.ctg_code
	join famille on item.fam_code = famille.fam_code
        where item_ref = reference;
BEGIN
    open c_info_prod(1);
    dbms_output.put_line('Libelle' ||'                         '|| 'Categorie' ||'        '|| 'Famille' ||'        '|| 'PU' ||'        '|| 'TVA');
    fetch c_info_prod into v_nom, v_categorie, v_famille, n_pu, n_tva;
    dbms_output.put_line(v_nom ||'                         '|| v_categorie ||'        '|| v_famille ||'        '|| n_pu ||'        '|| n_tva); 

    close c_info_prod;
END;


--Curseur parametre qui indique la situation d'un produit


DECLARE
	v_nom	    item.nom%type;
	n_ref	    item.item_ref%type;
	n_nbvente   int;
	d_debut     commande.date_cmd%type := to_date('01-jan-2019', 'dd-mon-yyyy');
	d_fin       commande.date_cmd%type := to_date('01-mar-2019', 'dd-mon-yyyy');
	n_qte       cmd_line.qte%type;
    
	cursor c_situation_prod(ref int, debut date, fin date) is
		select item.nom, count(*), sum(cmd_line.qte)
        from cmd_line  
		join item on cmd_line.item_ref = item.item_ref
		join commande on cmd_line.cmd_code = commande.cmd_code 
		where cmd_line.item_ref = ref and commande.date_cmd < d_fin and commande.date_cmd > d_debut
        group by item.nom;
BEGIN
	open c_situation_prod(1, d_debut, d_fin);
	fetch  c_situation_prod into v_nom, n_nbvente, n_qte;
	dbms_output.put_line(v_nom ||' '|| '(Ref : 1) a ete vendu '  || n_nbvente || 'fois entre ' || d_debut || ' et ' || d_fin || ' d une quantite de ' || n_qte || ' pieces vendues');
	close c_situation_prod;
END;


--Procedures 
--Procedure qui affiche les produits trie par PU 
	CREATE OR REPLACE 
		procedure proc_trier_produit 
		is 
        rec_produit item%rowtype;
		cursor c_trier_produit is select * from item order by item.prix_unitaireHT DESC; 
	BEGIN
		open c_trier_produit;
        dbms_output.put_line('Categorie' ||'      '|| 'Famille' ||'    '|| 'PU' ||'      '|| 'TVA' ||'      '|| 'Libelle');
		loop
			fetch c_trier_produit into rec_produit;
            dbms_output.put_line(rec_produit.ctg_code ||'                 '|| rec_produit.fam_code ||'      '|| rec_produit.prix_unitaireHT ||'      '|| rec_produit.TVA ||'      '|| rec_produit.nom);
			exit when  c_trier_produit%notfound;
		end loop;
	END;
      
exec proc_trier_produit;
 



--Procedure qui lance une commande 
create or replace type t_liste_produit as table of number (2); 

	create OR REPLACE 
		procedure proc_lancer_cmd(in_date IN date, in_client_code IN int, liste_prod IN t_liste_produit)
		is 
		n_cmd_code int := seq_commande.nextval; 
		n_montHT float :=0;
		n_montHT_tmp float :=0;
		n_monTTC float :=0;
		n_TVA_tmp float :=0;		
	BEGIN

        insert into commande values (n_cmd_code, '01-jan-2000', 0 ,0,0,1);
		for i in 1..liste_prod.count
		loop
			if mod(i,2) != 0 then
  				insert into cmd_line values (liste_prod(i), liste_prod(i+1), n_cmd_code);
				select item.prix_unitaireHT into n_montHT_tmp from item where item.item_ref = liste_prod(i);
				n_montHT := n_montHT + n_montHT_tmp;
				select item.TVA into n_TVA_tmp from item where item.item_ref = liste_prod(i);
				n_monTTC := n_monTTC + n_TVA_tmp * liste_prod(i+1); 

			else null;
			end if;
		end loop;
		update commande set date_cmd=in_date, etat=0, montantHT=n_montHT, montantTTC=n_monTTC, client_code=in_client_code where cmd_code = n_cmd_code;
	END;

-- notre tableau contiendera les references des items suivis de leurs quantite : [item1, qt_item1, item2, qt_item2...]
exec proc_lancer_cmd('15-oct-2019', 2,  t_liste_produit(3, 3, 4, 1, 4, 2))
select * from commande;
select * from cmd_line;
--Procedure qui cree une commande avec remise 


create or replace type t_liste_produit as table of number; -- 

	CREATE OR REPLACE 
		procedure proc_lancer_cmd(in_date IN date, in_client_code IN int,liste_prod IN t_liste_produit, n_remise IN int)
		is  
		n_cmd_code int := seq_commande.nextval; 
		n_montHT float :=0;
		n_montHT_tmp float :=0;
		n_monTTC float :=0;
		n_TVA_tmp float :=0;		
	BEGIN

        insert into commande values (n_cmd_code, '01-jan-2000', 0 ,0,0,1);
		for i in 1..liste_prod.count
		loop
			if mod(i,2) != 0 then
  				insert into cmd_line values (liste_prod(i), liste_prod(i+1), n_cmd_code);
				select item.prix_unitaireHT into n_montHT_tmp from item where item.item_ref = liste_prod(i);
				n_montHT := n_montHT + n_montHT_tmp;
				select item.TVA into n_TVA_tmp from item where item.item_ref = liste_prod(i);
				n_monTTC := n_monTTC + n_TVA_tmp * liste_prod(i+1); 

			else null;
			end if;
		end loop;

   		n_monTTC := n_monTTC - n_monTTC*n_remise/100;
		update commande set date_cmd=in_date, etat=0, montantHT=n_montHT, montantTTC=n_monTTC, client_code=in_client_code where cmd_code = n_cmd_code;
	END;


exec proc_lancer_cmd('15-apr-2019', 1,  t_liste_produit(2, 10, 3, 1), 20)


--Fonctions 


--Fonction qui affiche la somme des commandes passees par un client 
CREATE OR REPLACE 
	function somme_cmd( n_client_code IN int) return float 
	is n_somme float := 0;
BEGIN 
	select sum(montantTTC) into n_somme from commande where commande.client_code = n_client_code;

	return n_somme;
END;

--Execution de la fonction 
Declare 
	n_somme int;
BEGIN
	n_somme := somme_cmd(2);
	dbms_output.put_line('La somme des commandes de ce client :  ' || n_somme); 
END;




--Fonction maxclient  et minclient


--Fonction qui convertit du MAD en Euro ou Dollar

CREATE OR REPLACE 
	function convertir( n_montant IN float, dol_eur IN int) return float 
	is monConvertit float ;
BEGIN 
	if (dol_eur = 1) then monConvertit := n_montant*0.094; end if;
	if (dol_eur = 0) then monConvertit := n_montant*0.1; end if;
	 			
	return monConvertit;
END;


--Execution  : Remarque pour convertir en euro tapez 1, pour convertir en dollar tapez 0
Declare 
    n_monConvertit float :=0.0;
BEGIN
	dbms_output.put_line('La somme en MAD   : 1500 '); 
	n_monConvertit := convertir(1500.00, 1);
	dbms_output.put_line('La somme en euro   :  ' || n_monConvertit); 
	n_monConvertit := convertir(1500.00, 0);
	dbms_output.put_line('La somme en dollar   :  ' || n_monConvertit); 
END;



-- Fonction qui retourne le nombre d'article d'une categorie 
CREATE OR REPLACE 
	function fun_nb_article_catg( ctg_code IN int) return int 
	is nbarticle int := 0;
BEGIN 
	select count(*) into nbarticle from item where item.ctg_code = ctg_code;
	 			
	return nbarticle;
END;
--select count(*) from item where item.ctg_code = 1;

--Exemple d'execution 
Declare 
	nbarticle int := 0;
BEGIN
	nbarticle := fun_nb_article_catg(1);
	dbms_output.put_line('Le nombre d article de la categorie 1   :  ' || nbarticle); 
END;



--Fonction qui retourne le nombre de commande qu'a effectue un client 

CREATE OR REPLACE 
	function fun_nb_cmd_client ( n_client_code IN int) return int 
	is nbcmd int := 0;
BEGIN 
	select count(*) into nbcmd from commande  where commande.client_code = n_client_code;
	 			
	return nbcmd;
END;

-- Exemple d'execution 
Declare 
	nb_de_cmd int := 0;
BEGIN
	nb_de_cmd := fun_nb_cmd_client(1);
	dbms_output.put_line('Le nombre de commande effectue par le client 1 :  ' || nb_de_cmd); 
END;



--Fonction qui calcule le CA d'un produit donne

CREATE OR REPLACE 
	function CAprod ( n_item_ref IN int) return float 
	is 	qte_total int := 0;
		n_PU float :=0;
		n_tva int :=0;
		nbCA float := 0;
BEGIN 
	select sum(cmd_line.qte) into qte_total from cmd_line  where cmd_line.item_ref = n_item_ref;
	select prix_unitaireHT, TVA into n_PU, n_tva from item where item_ref=n_item_ref;
	nbCA :=  (n_PU + n_PU*n_tva/100) * qte_total;
	return nbCA;
END;


-- Exemple d'execution 
Declare 
	nbCA float := 0;
BEGIN
	nbCA := CAprod(1);
	dbms_output.put_line('Le chiffre d affaire du produit de ref :  1 :  ' || nbCA); 
END;


--Triggers 

ALTER table commande
ADD date_livraison date;

CREATE table historique_commande (
	hist_cmd_code int primary key,
	hist_date_cmd date not null,
	hist_etat int not null,
	hist_montantHT float not null, 
	hist_montantTTC float not null,
	hist_client_code int not null,
	hist_date_livraison date,
	constraint client_code foreign key (client_code) references client(client_code)
);


CREATE OR REPLACE trigger controle_trigger 
before insert or update on commande 
for each row
when new.date_livraison < commande.date
BEGIN 
	dbms_output.put_line('La date de livraison que vous avez saisie est impossible : Verifier si elle n est pas inferieur a la date de commande 	');
END;


CREATE OR REPLACE trigger insert_hist_cmd_passe
after insert on commande
for each row 
BEGIN

	insert into historique_commande values(new.cmd_code, new.date_cmd, new.etat, new.montantHT, new.montantTTC, new.client_code);
        dbms_output.put_line('La commande est aussi ajoute dans la table historiques');


END



CREATE OR REPLACE trigger insert_hist_date_livraison
after update of on commande date_livraison
BEGIN
	update historique_commande set hist_date_livraison = new.cmd_code;
        dbms_output.put_line('La date de livraison a ete inserer dans la table  historiques');

end;



-----------Curseurs
----- 1. A l’aide d’un curseur afficher les informations concernant un produit 
accept x char prompt 'Entrer le id du produit';--EXECUTER AVANT LE PROGRAMME
DECLARE
a produit.produit_pk%type;
lib produit.libelle%type;
p produit.pu%type;
tv produit.tva%type;
cat produit.id_categ%type;
fam produit.id_famille%type;
CURSOR info_produit (param produit.produit_pk%type) IS
 SELECT libelle, pu, tva, id_categ, id_famille FROM produit WHERE produit_pk=param;
BEGIN
a:='&x';
OPEN info_produit(a);
 dbms_output.put_line('Les informations de ce produit');
    LOOP 
    FETCH info_produit into lib, p, tv, cat , fam;
    EXIT WHEN info_produit%notfound;
     dbms_output.put_line(lib|| ' '|| p ||' ' ||tv||' ' ||cat ||' ' ||fam);
    END LOOP;
    CLOSE info_produit;
    END;

  ------------------------
  -----------------------------Procédures
  ------------- 1. Ecrire une procédure qui donne la liste des produit trie par PU. 
  CREATE OR REPLACE PROCEDURE liste_pu (v_id OUT produit.produit_pk%type,  v_nom OUT produit.libelle%type,  v_pu OUT produit.pu%type) IS 
  BEGIN 
  SELECT produit_pk, libelle, pu 
  INTO v_id ,v_nom , v_pu
  FROM produit ORDER by pu; 
  END;
  -------------2. Ecrire une procédure permettant de lancer une commande. 
  CREATE OR REPLACE PROCEDURE lancer_cmd (id in commande.commande_pk%type,  jour in commande.date_jour%type, et in commande.etat%type,emp in commande.id_emp%type , client in commande.id_client%type ,qte in concerne.qte%type , prd in concerne.id_prd%type) IS 
  BEGIN 
  INSERT into commande VALUES (id , jour , et ,emp ,client);
  INSERT into concerne VALUES (qte , id , prd);
  END;
  -------------3. Ecrire une procédure permettant de créer une commande avec une remise qui sera comme paramètre d’entrée (remise sur le prix total) 
  CREATE OR REPLACE PROCEDURE lancer_cmd (id in commande.commande_pk%type,  jour in commande.date_jour%type, et in commande.etat%type,emp in commande.id_emp%type , client in commande.id_client%type ,qte in concerne.qte%type , prd in concerne.id_prd%type, taux_remise in NUMBER , prix out produit.pu%type) IS 
  BEGIN 
  INSERT into commande VALUES (id , jour , et ,emp ,client);
  INSERT into concerne VALUES (qte , id , prd);
  select pu into prix from produit where produit_pk=prd;
  prix:=qte*prix*(1-taux_remise);
  END;
---------------4. Ecrire une procédure permettant d’appliquer différentes remises sur les différents produits d’une commande.
  -------------pour pouvoir enregistrer une commande avec plusieurs produit on va utiliser
  -------------deux procédures : une procédure commande permet d'enregistrer la commande et une autre concerne permet d'ajouter
  --------------des produits dans la commande
  CREATE OR REPLACE PROCEDURE commande_la (id in commande.commande_pk%type,  jour in commande.date_jour%type, et in commande.etat%type,emp in commande.id_emp%type, client in commande.id_client%type) IS 
  BEGIN 
  INSERT into commande VALUES (id , jour , et ,emp ,client);
  END;
  CREATE OR REPLACE PROCEDURE cocerne (id in commande.commande_pk%type,qte in concerne.qte%type , prd in concerne.id_prd%type, taux_remise in NUMBER , prix out produit.pu%type) IS 
  BEGIN 
  INSERT into concerne VALUES (qte , id , prd);
  select pu into prix from produit where produit_pk=prd;
  prix:=qte*prix*(1-taux_remise);
  END;
-----------------------------Fonctions 
----------------1. Ecrire une fonction permettant d’afficher la somme des commandes passées par un client données.
create or replace function somme_cmd(client in commande.id_client%type) return number is
somme number;
begin
SELECT COUNT(commande_pk) into somme 
FROM commande
WHERE id_client=client; 
   return somme ;
end;
------------------2. Ecrire deux fonction MaxClient et MinClient permettant d’afficher le client qui a fait le Max et Min d’achat 
create or replace function MaxClient return varchar2 is
somme number;
cli varchar2;
begin 
SELECT MAX(y.som) FROM
(SELECT COUNT(commande_pk) as som into somme
FROM commande
GROUP by id_client) y;
SELECT id_client INTO cli
FROM commande where COUNT(commande_pk)=somme
group by id_client;
   return  cli;
end;


create or replace function MinClient return varchar2 is
somme number;
cli varchar2;
begin 
SELECT MIN(y.som) FROM
(SELECT COUNT(commande_pk) as som into somme
FROM commande
GROUP by id_client) y;
SELECT id_client INTO cli
FROM commande where COUNT(commande_pk)=somme
group by id_client;
   return  cli;
end;
-------------------4. Ecrire une fonction qui prend l’ID d’une catégorie et retourne le nombre d’article existant  
create or replace function NbrCategorie(cat in categorie.categorie_pk%type) return number is
nbr NUMBER;
begin
SELECT COUNT(produit_pk) into nbr FROM produit WHERE id_categ=cat;
   return nbr ;
end;
------------------5. Ecrire une fonction qui prend l’ID d’un client et retourne le nombre de commande qu’il a effectue 
create or replace function NbrCmd(client in client.client_pk%type) return number is
nbr NUMBER;
begin
SELECT COUNT(commande_pk) into nbr FROM commande WHERE id_client=client;
   return nbr ;
end;



-----------------6. Ecrire une fonction permettant de calculer le CA d’un produit donné 
create or replace function CA_produit(id IN VARCHAR2) return number is
CAproduit number;
prix NUMBER;
quantity NUMBER;
id_1 VARCHAR2(6);
begin
SELECT pu INTO prix FROM  produit WHERE  produit_pk=id ;
SELECT SUM(qte) ,id_prd  INTO quantity,id_1  FROM concerne  WHERE  id_prd=id GROUP BY id_prd;
CAproduit:=quantity*prix;
   return CAproduit  ;
end;


--------------7. Ecrire une fonction permettant de calculer le CA annuelle de l’entreprise. 
create or replace function CA_produit_annuelle(id IN VARCHAR2,date_initial IN DATE ,date_final IN DATE) return number is
CAproduit number;
prix NUMBER;
quantity NUMBER;
id_1 VARCHAR2(6);
begin
SELECT pu INTO prix FROM  produit WHERE  produit_pk=id ;
SELECT SUM(qte) ,id_prd  INTO quantity,id_1  FROM concerne JOIN commande ON id_cmd=commande_pk   WHERE  id_prd=id AND date_jour BETWEEN date_initial AND date_final    GROUP BY id_prd;
CAproduit:=quantity*prix;
   return CAproduit  ;
end;
sq

---------------------------------Triggers
--On doit ajouter une colonne date de livraison à la table commande dans la base de données
ALTER TABLE commande
ADD date_livraison DATE;
--On doit ajouter également une table historique
CREATE TABLE historique (
   id number(20) PRIMARY KEY,
   date_operation DATE,
   type_operation VARCHAR2(15),
    id_cmd VARCHAR2(20),
    FOREIGN KEY (id_cmd) REFERENCES commande(commande_pk));

--- 1. La date de livraison ne doit pas être inférieure à la date de commande 
CREATE TRIGGER Livraison_commande AFTER INSERT or UPDATE on commande
BEGIN
If exists(SELECT * from inserted I, commande where I.commande_pk=commande.commande_pk and commande.date_jour>I.date_livraison);
BEGIN 
dbms_output.put_line('La date de livraison ne doit pas être inférieure à la date de commande  ');
ROLLBACK;
endif;
END;
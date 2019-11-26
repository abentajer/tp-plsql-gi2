 CREATE OR REPLACE PROCEDURE commande_remise (id in commande.numcommande%type,  jour in commande.dat%type, et in commande.etat%type,emp in commande.id_emp%type, client in commande.id_client%type) IS 
  BEGIN 
  INSERT into commande VALUES (id , jour , et ,emp ,client);
  END;
  CREATE OR REPLACE PROCEDURE cocerne (id in commande.numcommande%type,qte in concerne.qte%type , prd in concerne.id_prd%type, taux_remise in NUMBER , prix out produit.pu%type) IS 
  BEGIN 
  INSERT into concerne VALUES (qte , id , prd);
  select pu into prix from produit where produit_pk=prd;
  prix:=qte*prix*(1-taux_remise);
  END;

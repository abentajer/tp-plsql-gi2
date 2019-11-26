--declencheur 1
CREATE TRIGGER date_livr_cmd
BEFORE INSERT OR UPDATE commande 
OF date_livraison 
FOR EACH ROW 
WHEN(date_livraison<date_commande)
BEGIN
dbms_output.put_line('date livraison ne doit pas etre inferieure a date commande');
END;

--declencheur 2
CREATE SEQUENCE id_hist
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE TRIGGER hist_pass
AFTER INSERT commande
ON historique
BEGIN
insert into historique values(id_hist.nextval, commande.id_commande);
END;
/
/********* Procedure question 2 *****************/
CREATE OR REPLACE PROCEDURE InsertCommande(
	   p_Ncommande IN commande.CODE_COMMANDE%TYPE,
	   p_Datecommande IN commande.DATE_COMMANDE%TYPE,
	   p_Reglage IN commande.REGLAGE%TYPE,
	   p_MHT IN commande.MONTANT_HT%TYPE,
	   p_MTTC IN commande.MONTANT_TTC%TYPE)
IS
BEGIN

  INSERT INTO commande ("CODE_COMMANDE", "DATE_COMMANDE", "REGLAGE", "MONTANT_HT", "MONTANT_TTC") 
  VALUES (p_Ncommande,p_Datecommande,p_Reglage,p_MHT, p_MTTC);

  COMMIT;

END;

/************* Procedure question 3******************/

CREATE OR REPLACE PROCEDURE InsertCommande(
	   p_Ncommande IN commande.CODE_COMMANDE%TYPE,
	   p_Datecommande IN commande.DATE_COMMANDE%TYPE,
	   p_Reglage IN commande.REGLAGE%TYPE,
	   p_MontantHT IN commande.MONTANT_HT%TYPE,
	   p_MontantTTC IN commande.MONTANT_TTC%TYPE,
	   taux number:=(5,2))
IS

BEGIN
    a:=p_Ncommande;  
  INSERT INTO commande ("CODE_COMMANDE", "DATE_COMMANDE", "REGLAGE", "MONTANT_HT", "MONTANT_TTC") 
  VALUES (a*(1-taux),p_Datecommande,p_Reglage,p_MontantHT, p_MontantTTC);

  COMMIT;

END;
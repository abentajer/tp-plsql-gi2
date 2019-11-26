CREATE OR REPLACE PROCEDURE Remise(
	   p_Ncommande IN commande.CODE_COMMANDE%TYPE,
	   p_Datecommande IN commande.DATE_COMMANDE%TYPE,
	   p_Reglage IN commande.REGLAGE%TYPE,
	   p_MontantHT IN commande.MONTANT_HT%TYPE,
	   p_MontantTTC IN commande.MONTANT_TTC%TYPE
)IS

    taux NUMBER(5,2);
    a NUMBER := p_Ncommande; 
    BEGIN
 
         INSERT INTO commande ("CODE_COMMANDE", "DATE_COMMANDE", "REGLAGE", "MONTANT_HT", "MONTANT_TTC") 
         VALUES (a*(1-taux),p_Datecommande,p_Reglage,p_MontantHT, p_MontantTTC);
         COMMIT;

END Remise;

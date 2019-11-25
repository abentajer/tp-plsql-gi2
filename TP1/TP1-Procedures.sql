///////////////////////////////////////////////////////////////////// Question 1

CREATE OR REPLACE PROCEDURE prod
IS
    c_Ref Produit.REF%type;
    c_Libelle Produit.LIBELLE%type;
    c_PU Produit.PU%type;
    c_TVA Produit.TVA%type;
    CURSOR produits is
        SELECT * FROM Produit ORDER BY PU ASC;
BEGIN
    OPEN produits;
    LOOP
        FETCH produits into c_Ref,c_Libelle,c_PU,c_TVA;
        EXIT WHEN produits%notfound;
        dbms_output.put_line(''||c_PU||'');
    END LOOP;
    CLOSE produits;
END;


/////////////////////////////////////////////////////////////////// Question 2



CREATE OR REPLACE PROCEDURE Inser(
    c_Ncommande IN commande.CODE_COMMANDE%TYPE,
    c_Datecommande IN commande.DATE_COMMANDE%TYPE,
    c_Reglage IN commande.REGLAGE%TYPE,
    c_MHT IN commande.MONTANT_HT%TYPE,
    c_MTTC IN commande.MONTANT_TTC%TYPE)
IS
BEGIN

  INSERT INTO commande ("CODE_COMMANDE", "DATE_COMMANDE", "REGLAGE", "MONTANT_HT", "MONTANT_TTC")
  VALUES (c_Ncommande,c_Datecommande,c_Reglage,c_MHT, c_MTTC);

  COMMIT;

END;


//////////////////////////////////////////////////////////////// Question 3


CREATE OR REPLACE PROCEDURE Inser(
    c_Ncommande IN commande.CODE_COMMANDE%TYPE,
    c_Datecommande IN commande.DATE_COMMANDE%TYPE,
    c_Reglage IN commande.REGLAGE%TYPE,
    c_MontantHT IN commande.MONTANT_HT%TYPE,
    c_MontantTTC IN commande.MONTANT_TTC%TYPE,
    remise number:=(6,7))
IS

BEGIN
    x:=p_Ncommande;
  INSERT INTO commande ("CODE_COMMANDE", "DATE_COMMANDE", "REGLAGE", "MONTANT_HT", "MONTANT_TTC")
  VALUES (x*(1-remise),c_Datecommande,c_Reglage,c_MontantHT, c_MontantTTC);

  COMMIT;

END;





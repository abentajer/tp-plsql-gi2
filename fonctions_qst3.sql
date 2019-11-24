
CREATE OR REPLACE FUNCTION CONVERTIR(i IN NUMBER, j IN number )
RETURN number IS 
PU number(20);
BEGIN
	select montant_TTC into PU from commande where code_commande=j;
	IF( i=1 ) THEN
   	PU:= PU*11; /*conversion de mad en euro*/
    END IF;
	IF(i=2) THEN
	PU  := PU/11; /*conversion d'euro en mad*/
	END IF;
    RETURN PU;
END;

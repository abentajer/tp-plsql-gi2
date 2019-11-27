DECLARE
	c_Client CLIENT.CODE_CLIENT%type;
	c_Commande COMMANDE.CODE_COMMANDE%type;
CREATE OR REPLACE FUNCTION SommeCommandes (c_Client)
RETURN INTEGER 
IS 
	somme INTEGER:=0;  
	CURSOR Tab is
		SELECT COUNT(*) FROM COMMANDE WHERE COMMANDE.CODE_CLIENT AS CLIENT.CODE_CLIENT=c_CLIENT;

BEGIN 
	OPEN Tab;
	LOOP 
	FETCH Tab INTO c_Client, c_Commande;
		EXIT WHEN Tab%notfound;
	somme:=SommeCommandes(c_Client);
	dbms_output.put_line('Nombre de commandes effectuees: '||somme);

END;
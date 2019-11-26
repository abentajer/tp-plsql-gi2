DECLARE
nom_cli client.nom%type;
prix_ech number;
nbr_cmd number;

--F2 max
FUNCTION MaxClient RETURN client.nom%type
IS
	nom_max client.nom%type;
	max number;
BEGIN
select client.nom, COUNT(client.nom) INTO nom_max, max FROM commande, m_commande, client WHERE commande.id_client=client.id_client AND m_commande.num_commande=commande.id_commande GROUP BY client.nom ORDER BY max DESC;
RETURN nom_max;
END;


--F2 min
FUNCTION MinClient RETURN client.nom%type
IS
	nom_min client.nom%type;
	min number;
BEGIN
select client.nom, COUNT(client.nom) INTO nom_min, min FROM commande, m_commande, client WHERE commande.id_client=client.id_client AND m_commande.num_commande=commande.id_commande GROUP BY client.nom ORDER BY min ASC;
RETURN nom_min;
END;

--F3
FUNCTION echange(monnaie IN varchar, idcmd IN int, refachat IN varchar) RETURN number IS
	mad number;
	euro number;
	usd number;
BEGIN
select prix_ttc INTO mad FROM m_commande WHERE num_commande=idcmd AND ref=refachat;
IF monnaie='EURO' THEN
	euro := mad/14;
	RETURN euro;  
ELSIF monnaie='USD' THEN 
	usd := mad/7;
	RETURN usd;
END IF;
END;

--F5
FUNCTION nbr_cmd_client(idcli IN client.id_client%type) RETURN number IS
N number;
BEGIN

select count(*) INTO N FROM client, commande WHERE client.id_client=idcli AND client.id_client=commande.id_client GROUP BY client.id_client;

RETURN N;
END;

--debut
BEGIN

dbms_output.put_line('------F2 client qui a effetcuer nombre max puis min des achats');
nom_cli:=MaxClient;
dbms_output.put_line(nom_cli||' a le max achats');
nom_cli:=MinClient;
dbms_output.put_line(nom_cli||' a le min achats');

dbms_output.put_line('-------F3 afficher le prix d un produit d une commande en euro puis en dollar');
prix_ech:=echange('EURO',0,'A02');
dbms_output.put_line('prix ttc de A02 dans commande 0 est '|| prix_ech||'EURO');

prix_ech:=echange('USD',0,'A02');
dbms_output.put_line('prix ttc de A02 dans commande 0 est '|| prix_ech||'USD');


dbms_output.put_line('-------F5 afficher nombre de commandes effectues par client donne');
nbr_cmd:=nbr_cmd_client(1);
dbms_output.put_line('nombre de commandes par client est '|| nbr_cmd ||' commandes');
END;
/
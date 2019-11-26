DECLARE
lib catalogue.libelle%type;
rf catalogue.ref%type;
dt commande.date_commande%type;
qte int;

--C2
CURSOR situation_produit(prd catalogue.ref%type) IS 
SELECT catalogue.libelle, commande.date_commande, m_commande.qte FROM catalogue, m_commande, commande WHERE catalogue.ref=prd AND m_commande.ref=prd AND commande.id_commande=m_commande.num_commande AND catalogue.ref=prd;

-------debut
BEGIN
rf := 'A01';
OPEN situation_produit(rf);
loop
FETCH situation_produit INTO lib, dt, qte;
EXIT WHEN situation_produit%NOTFOUND;
dbms_output.put_line(lib||' (REF '||rf||') Nombre ventes'||qte||' date'||dt);
end loop;
close situation_produit;
END;
/

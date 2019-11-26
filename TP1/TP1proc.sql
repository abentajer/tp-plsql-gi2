SET SERVEROUTPUT ON
DECLARE
r_prod catalogue%ROWTYPE;

--curseur pour procedure P1
CURSOR c_prd_PU IS SELECT ref, libelle, PU FROM catalogue ORDER BY PU DESC;
--P1
PROCEDURE prd_PU IS 
BEGIN
OPEN c_prd_PU;
loop
FETCH c_prd_PU INTO r_prod.ref, r_prod.libelle, r_prod.PU;
EXIT WHEN c_prd_PU%NOTFOUND;
dbms_output.put_line(r_prod.ref||'  '|| r_prod.libelle||' '||r_prod.PU);
end loop;
CLOSE c_prd_PU;
END;
--P3
PROCEDURE remise(cmd IN commande.id_commande%type, taux IN float) IS 
BEGIN
update m_commande set prix_ttc=prix_ttc*(1-taux) where num_commande=cmd;
dbms_output.put_line('remise effectuee a commande '||cmd||' dun taux '||taux);
END;

--debut du script
BEGIN
dbms_output.enable;
dbms_output.put_line('-----P1 liste les produits tri descendant par prix unite');
prd_PU;
dbms_output.put_line('-----P3 appliquer remise a une certaine commande d un certain taux');
remise(0, 0.1);
END;
/
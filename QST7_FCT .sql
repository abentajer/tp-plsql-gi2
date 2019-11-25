create or replace function produit_annuelle(id IN VARCHAR2,date_initial IN DATE ,date_final IN DATE) return number is
CAproduit number;
prix NUMBER;
quantity NUMBER;
id_1 VARCHAR2(6);
begin
SELECT PU INTO prix FROM  produit WHERE  ref =  id ;
SELECT SUM(QTE) ,ref  INTO quantity,id_1  FROM concerne JOIN commande ON id_cmd=commande_pk   WHERE  id_prd=id AND date_jour BETWEEN date_initial AND date_final    GROUP BY id_prd;
CAproduit:=quantity*prix;
   return CAproduit  ;
end;

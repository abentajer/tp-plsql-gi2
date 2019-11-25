create or replace function CA_produit(id IN VARCHAR2) return number is
CAproduit number;
prix NUMBER;
quantity NUMBER;
id_1 VARCHAR2(6);
begin
SELECT PU INTO prix FROM  produit WHERE  produit = id ;
SELECT SUM(QTE) , ref INTO quantity ,id_1  FROM concerne  WHERE  id_prd=id GROUP BY id_prd;
CAproduit:=quantity*prix;
   return CAproduit  ;
end;





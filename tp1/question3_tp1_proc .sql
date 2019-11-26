CREATE OR REPLACE PROCEDURE remise_cmd( X IN ,c_Prix_TTC OUT commande.Prix_TTC%TYPE) 
IS	
   c_Prix_TTC  IN commande.Prix_TTC%type;
   CURSOR  c4 is
	SELECT Prix_TTC FROM commande ;	
BEGIN
	open c4 ;
	loop 
	fetch c4 into c_Prix_TTC ;
	EXIT WHEN  c4%notfound;
        
      	UPDATE commande
     	 SET c_Prix_TTC=c_Prix_TTC*X;
	END loop;
	close c4;
	END remise_cmd;
BEGIN
   X:=0.1;
   remise_cmd( X ,c_Prix_TTC);
	dbms_output.put_line('Prix APRES remise de 10% est : ' || c_Prix_TTC);
END;

/

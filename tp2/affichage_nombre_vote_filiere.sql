DECLARE 
	e_nvot Electeurs.nvot%type;
	f_nomfil Filiere.nomfil%type;
	Cursor NombreParFiliere is
		SELECT nvot,nomfil FROM Electeurs E, Filiere F
		WHERE E.idfl = F.idfil;
	TYPE e_list IS TABLE of Electeurs.nvot%type INDEX BY varchar(20);
	TYPE f_list IS TABLE of Filiere.nomfil%type INDEX BY varchar(20);
	nvot_list e_list;
	nomfil_list f_list;
	counter integer :=0;
BEGIN
	OPEN NombreParFiliere;
	FOR n IN NombreParFiliere LOOP
		counter:=counter+1;
		nvot_list(counter):= n.nvot;
		nomfil_list(counter):= n.nomfil;
		dbms_output.put_line(nvot_list(counter)||''||nomfil_list(counter));
	END LOOP;
 	CLOSE NombreParFiliere;

END; 

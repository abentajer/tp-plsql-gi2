DECLARE
	v_idfil Electeurs.idfil%TYPE;
	v_nvot Electeurs.nvot%TYPE;

CURSOR C_vot IS SELECT idfil ,COUNT(nvot) FROM Electeurs Group BY idfil;

TYPE c_list IS TABLE of Electeurs.idfil%type INDEX BY binary_integer; 
   vote_list c_list; 
   counter integer :=0; 

BEGIN
	FOR n IN C_vot LOOP
		counter := counter +1;
		vote_list(counter) := n.idfil;
		
		dbms_output.put_line('La filiere (' || TO_char(v_idfil) || ') :' ||vote_list(counter) ) ;
	END LOOP;
END;
/

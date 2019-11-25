
CREATE OR REPLACE PROCEDURE inscrire_electeurs(
	   v_id IN Electeurs.idelec%TYPE,
	   v_nom IN Electeurs.nom%type,
	   v_pnom IN Electeurs.pnom%type,
	   v_ddn IN Electeurs.ddn%type,
	   v_nvot IN Electeurs.nvot%type,
	   v_nvoix IN Electeurs.nvoix%type,
	   v_cand IN Electeurs.cand%type,
	   v_idfl IN Electeurs.idfl%type) IS
BEGIN

 	INSERT INTO Electeurs ("idelec", "nom", "pnom", "ddn") 
 	 VALUES (v_idelec, v_nom, v_pnom, v_ddn);

END;
/

set serveroutput on

DECLARE
--q1 les sequences crees avec le script des tables

--q6 table index by
TYPE nbr_vote IS TABLE OF number INDEX BY filiere.nomfil%type;

--q8 nested table
TYPE n_nom IS TABLE OF electeur.nom%type;
nom_cand_10 n_nom := n_nom();
i integer := 0;


nbr_v_fil nbr_vote;

	c_id int;
	c_nom electeur.nom%type;
	c_pnom electeur.pnom%type;
	c_nomfil filiere.nomfil%type;
	c_nbr number;
--q2 
	CURSOR liste_cand IS 
		SELECT idelec,nom, pnom FROM electeur WHERE cand=1;

--q3 
	CURSOR liste_elect IS
		SELECT  idelec,nom, pnom FROM electeur WHERE cand=0;
--q4
	CURSOR liste_filiere IS
		SELECT nomfil FROM filiere;
--q5
	CURSOR liste_electcand IS
		SELECT  idelec,nom, pnom FROM electeur;

--q6	
	CURSOR liste_votefil IS
		SELECT nomfil, SUM(nvot) FROM electeur, filiere WHERE filiere.idfil=electeur.idfil GROUP BY nomfil;
--q7
	CURSOR liste_cand_fil(fil electeur.idfil%TYPE) IS
		SELECT electeur.idelec,electeur.nom, electeur.pnom, filiere.nomfil FROM electeur,filiere WHERE electeur.idfil=filiere.idfil AND electeur.idfil=fil AND electeur.cand=1;

--q8
	CURSOR liste_cand_10nvoix(N int) IS 
		SELECT nom, pnom, nvoix from electeur WHERE cand=1 AND nvoix>N;

--q9
	CURSOR liste_cand_1nvot(M int) IS
		SELECT nom, pnom, nvot FROM electeur WHERE cand=1 AND nvot>M;
-----------------------------------------------------
--debut du script
BEGIN

--q2
	dbms_output.put_line('-------Q2 liste candidats ');
	OPEN liste_cand;
	loop
	FETCH liste_cand INTO c_id, c_nom, c_pnom;
	EXIT WHEN liste_cand%NOTFOUND;
	dbms_output.put_line(c_id || ' '||c_pnom || '  '||c_nom);	
	END loop;
	CLOSE liste_cand;
--q3
	dbms_output.put_line('-------Q3 liste electeurs');
	OPEN liste_elect;
	loop
	FETCH liste_elect INTO c_id, c_nom, c_pnom;
	EXIT WHEN liste_elect%NOTFOUND;
	dbms_output.put_line(c_id || ' '||c_pnom || '  ' ||c_nom);	
	END loop;
	CLOSE liste_elect;

--q4
	dbms_output.put_line('-------Q4 liste filieres');
OPEN liste_filiere;
	loop 
	FETCH liste_filiere INTO c_nomfil;
	EXIT WHEN liste_filiere%NOTFOUND;
	dbms_output.put_line(c_nomfil);
	END loop;
	CLOSE liste_filiere;

--q5
	dbms_output.put_line('-------Q5 liste tous electeurs et candidats');
	OPEN liste_electcand;
	loop
	FETCH liste_electcand INTO c_id, c_nom, c_pnom;
	EXIT WHEN liste_electcand%NOTFOUND;
	dbms_output.put_line(c_id || ' '||c_pnom || '  ' ||c_nom);	
	END loop;
	CLOSE liste_electcand;

--q6
	dbms_output.put_line('-------Q6 liste nombre de votes par filiere');
	OPEN liste_votefil;
	loop
	FETCH liste_votefil INTO c_nomfil, c_nbr;
	--stockage dans index by table
	nbr_v_fil(c_nomfil):=c_nbr;

	dbms_output.put_line('dans filiere '||c_nomfil || ' il y a '||c_nbr || ' de votes ');
	EXIT WHEN liste_votefil%NOTFOUND;
	END loop;
	CLOSE liste_votefil;

	--afficher avec index by table
	dbms_output.put_line('valeur stockee dans index by table nbr_v_fil pour GI '|| nbr_v_fil('GI'));

--q7
	dbms_output.put_line('-------Q7 liste des candidats de filiere 1 GI');
	OPEN liste_cand_fil(1);
	loop
	FETCH liste_cand_fil INTO c_id, c_nom, c_pnom, c_nomfil;
	EXIT WHEN liste_cand_fil%NOTFOUND;
	END loop;
	dbms_output.put_line(c_id || ' '||c_pnom || '  ' ||c_nom);	
	CLOSE liste_cand_fil;

--q8
	dbms_output.put_line('-------Q8 liste des candidats ayant plus de dix voix');
	OPEN liste_cand_10nvoix(10);
	loop
	FETCH liste_cand_10nvoix INTO c_nom, c_pnom, c_nbr;
	EXIT WHEN liste_cand_10nvoix%NOTFOUND;
	dbms_output.put_line(c_nom || ' '||c_pnom || ' a nombre de votes  ' ||c_nbr);

	i := i +1;
	nom_cand_10.extend;
	nom_cand_10(i) := c_nom;
	dbms_output.put_line('premier element de nested table '|| nom_cand_10(1));	
	
	END LOOP;
	CLOSE liste_cand_10nvoix;

--q9
	dbms_output.put_line('-------Q9 liste des candidats ayant vote plus dune fois');
	OPEN liste_cand_1nvot(1);
	loop
	FETCH liste_cand_1nvot INTO c_nom, c_pnom, c_nbr;
	EXIT WHEN liste_cand_1nvot%NOTFOUND;
	dbms_output.put_line(c_nom|| ' '||c_pnom ||' a voter '||c_nbr||' fois');
	END LOOP;
	CLOSE liste_cand_1nvot;

END;
/
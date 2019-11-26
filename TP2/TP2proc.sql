DECLARE

--q11 et q13
PROCEDURE inscrire(id IN int, nom IN electeur.nom%type, pnom IN electeur.pnom%type, ddn IN date, nvot IN int, nvoix IN int, cand IN int, idfil IN int) IS
BEGIN

insert into electeur(idelec, nom, pnom, ddn, nvot, nvoix, cand, idfil) values (id, nom, pnom,ddn, nvot, nvoix, cand, idfil);
dbms_output.put_line('electeur inscrit');
END;

--q15 et q17
PROCEDURE voter_gen(idcand IN electeur.idelec%type) IS
c int;
n electeur.nom%type;
p electeur.pnom%type; 
BEGIN
select cand, nom, pnom into c, n, p from electeur where idelec=idcand;
dbms_output.put_line('on verifie si l id est celui d un candidat');
dbms_output.put_line('valeur doit etre 1 si candidat, sinon 0. VAL:   '||c);
IF c=1 THEN
update electeur set nvoix=nvoix+1 where idelec=idcand;
dbms_output.put_line('un vote ajoute au candidat: '||n||' '||p);
END IF;
END;

----------------------------------debut
BEGIN
dbms_output.put_line('-------q11 ajout de nouveau electeur');
inscrire(8, 'n8', 'p8', '20/5/1998', 1, 3, 1, 2);
dbms_output.put_line('-------q13 ajout d un vote pour un candidat');
voter_gen(2);
END;
/
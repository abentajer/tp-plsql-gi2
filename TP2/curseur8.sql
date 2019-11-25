declare
v_idelec electeurs.idelec%type;
v_nom electeurs.nom%type;
v_pnom electeurs.pnom%type;
v_ddn electeurs.ddn%type;
v_nvot electeurs.nvot%type;
v_nvoix electeurs.nvoix%type;
v_cand electeurs.cand%type;
v_idelec electeurs.idelec%type;
v_nomfil filiere.nomfil%type;
cursor affiche(voix electeurs.nvoix%type) is select electeurs.nom from electeurs where nvoix>voix and electeurs.cand=1;
-- type neste is table of electeurs.nom%type;
-- name neste;

Begin
open affiche;
loop
fetch affiche into v_idelec,v_nom,v_pnom,v_ddn,v_nvot,v_nvoix,v_cand,v_idelec,v_nomfil;
exit when (affiche%Notfound);
end loop;
close affiche;
end;

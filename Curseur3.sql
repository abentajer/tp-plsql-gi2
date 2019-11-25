
set serveroutput on
declare
ligne Filiere%rowtype;
begin
select * into ligne from Filiere ;
dbms_output.put_line('lid de Filiere' || ligne.nomfil || 'est:' || ligne.idfil);
end;
/

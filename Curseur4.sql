set serveroutput on
declare
ligne1 Electeurs%rowtype;
begin
select * into ligne1 from Electeurs ;
dbms_output.put_line(ligne1.idelec || ' ' ligne1.pnom || ' ' ligne1.nom ' ' || ligne1.ddn || ' '|| ligne1.nvot ' ' || ligne1.nvoix || ' ' ligne1.cand);
end;

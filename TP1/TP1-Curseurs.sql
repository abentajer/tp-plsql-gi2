///////////////////////////////////////////////////////////////// Question 1

DECLARE
    CURSOR affiche is select ref,libelle,PU,TVA from produit where ref='A01';
    v_ref produit.ref%type;
    v_libelle produit.libelle%type;
    v_PU produit.PU%type;
    v_TVA produit.TVA%type;
Begin
    open affiche;
        loop
            fetch affiche into v_ref,v_libelle,v_categorie,v_famille,v_PU,v_TVA;
            exit when (affiche%Notfound);
            dbms_output.put_line(v_Ref||''||v_Libelle||''||v_PU||''||v_TVA);
        end loop;
    close affiche;
end;

////////////////////////////////////////////////////////// Question 2

Declare
    v_ref produit.ref%type;
    v_libelle produit.libelle%type;
    cursor affiche is
        select ref,libelle from produit where REF='A01';
begin
    open affiche;
        loop
            fetch affiche into v_ref,v_libelle;
            exit when (affiche%Notfound);
            dbms_output.put_line(|| v_libelle || '(' || v_ref || ') a ete vendu X fois entre la 01/01/2018 et 31/01/2018 d\'une quantite de Y pieces vendu ');
        end loop;
    close affiche;
end;





CREATE OR REPLACE PROCEDURE add_filiere( id_filiere NUMBER )
IS  r_filiere Filiere%ROWTYPE;
BEGIN
  -- get contact based on customer id
  INSERT
  INTO r_filiere
  Values (r_filiere.idfil , r_filiere.nomfil);
   -- print out contact's information
  dbms_output.put_line( r_filiere.idfil || ' ' ||  r_filiere.nomfil );
 
EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line( SQLERRM );
END;
/

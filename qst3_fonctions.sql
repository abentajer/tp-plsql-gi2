create function transformation_en_EURO(montant in number) return number
 is
begin
   return  montant / 10.8;
end;



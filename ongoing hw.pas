const Eps : Real = 0.00001;

function Ar(x1, y1, x2, y2, x3, y3 : Real) : Real;
begin
  Ar := 0.5 * abs((x2 - x1)*(y3 - y1) - (x3 - x1)*(y2 - y1));
end


var
  x1, x2, x3, y1, y2, y3 : Real; {dots of triangular}
  dx, dy : Real; {dot}
  origAr, a1, a2, a3 : Real; {areas}
Begin
  write('Enter A: ');
  readln(x1, y1);
  write('Enter B: ');
  readln(x2, y2);
  write('Enter C: ');
  readln(x3, y3);
  
  write('Enter needed dot: ');
  readln(dx, dy);
  
  origAr := Ar(x1, y1, x2, y2, x3, y3);
  
  {get areas}
  a1 := Ar(x1, y1, x2, y2, dx, dy);
  a2 := Ar(x1, y1, dx, dy, x3, y3);
  a3 := Ar(dx, dy, x2, y2, x3, y3);
  
  if abs() <= Eps then
    writeln('Includes')
  else
    writeln('Does not include');
End.
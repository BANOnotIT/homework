const Eps : Real = 0e-10;

function Ar(x1, y1, x2, y2, x3, y3 : Real) : Real;
begin
  Ar := 0.5 * abs((x2 - x1)*(y3 - y1) - (x3 - x1)*(y2 - y1));
end;


Var
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

  if ((x1 = x2) and (y1 = y2) or
      (x1 = x3) and (y1 = y3) or
      (x2 = x3) and (y2 = y3)) then
  begin
       writeln('Tiangle does not exist');
       exit;
  end;

  write('Enter S: ');
  readln(dx, dy);

  origAr := Ar(x1, y1, x2, y2, x3, y3);

  {get areas}
  a1 := Ar(x1, y1, x2, y2, dx, dy);
  a2 := Ar(x1, y1, dx, dy, x3, y3);
  a3 := Ar(dx, dy, x2, y2, x3, y3);

  if abs(a1+a2+a3 - origAr) <= Eps then
    writeln('S is included in triangle')
  else
    writeln('S in NOT included in triagnel');
End.

{
  Tests
  1. A(0 0) B(10 1) С(10 0) S(5 1)   -> NOT included
  2. A(0 0) B(10 1) С(10 0) S(7 1)   -> NOT included
  3. A(0 0) B(10 1) С(10 0) S(10 1)  -> included
  4. A(0 0) B(0 0)  C(123 123)       -> Doesn't exist
}

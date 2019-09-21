Var
  x, y1, y2, y : real;
  
Begin
  writeln('enter X:');
  readln(x);
  
  y1 := (exp(x) - exp(-x)) / 2;
  y2 := (exp(x) + exp(-x)) / 2;
  y := sqr(y2) - sqr(y1);
  
  writeln('y1 = ', y1:20:16, ' y2 = ', y2:20:16, ' y = ', y:20:16);
End.
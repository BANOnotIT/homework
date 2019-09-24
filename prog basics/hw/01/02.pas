Var
  x, y, w, max : real;
Begin
  writeln('enter x, y, w:');
  readln(x, y, w);
  
  x := sqr(x);
  y := sqr(y) + 5;
  w := sqr(w) - 5;
  
  if x > y then
    max := x
  else
    max := y;
    
  if w > max then
    max := w;
      
  writeln('Max = ', max);
  
End.
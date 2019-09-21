Var
  x, y, w, max : real;
Begin
  writeln('enter x, y, w:');
  readln(x, y, w);
  
  x := sqr(x);
  y := sqr(y) + 5;
  w := sqr(w) - 5;
  
  if x > y then
    if x > w then
      max := x
    else
      max := w
  else
    if y > w then
      max := y
    else
      max := w;
      
  writeln('Max = ', res);
  
End.
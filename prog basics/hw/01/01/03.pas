Var
  x, res, d : real;
Begin
  readln(x);
  
  res := sqr(sin(x)) + sqr(cos(x));
  
  d := abs(res - 1);
  
  writeln('result is ', res:20:16, ' d = ', d:20:16);
End.
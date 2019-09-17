Var
  gap, len, x : real;
  i, k : integer;
Begin
  
  writeln('enter segments count:');
  readln(k);
  
  for i = 0 to 2*k do
  begin
    
    readln(x);
    
    if (gap + len) < x then begin
      if (i mod 2) = 0 then
        gap := x - len;
      else
        len := x - gap;
    end;
  end;
  
  writeln('shadow lenght: ', len);
  
End.
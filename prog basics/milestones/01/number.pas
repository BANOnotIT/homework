Var
  sum, n, i : integer;

Begin
  writeln('Enter k:');
  readln(n);


  sum := 0;

  for i := n-1 downto 1 do begin
    writeln(i,' ', n mod i);
    if (n mod i) = 0 then
      sum := sum + i;
  end;

  if sum = n then
    writeln('TRUE');
  else
    writeln('FALSE');
  // writeln('k is under conditions: ', sum = n);
End.
Var
  a : array[0..19] of integer;
  i, j, n, sum : integer;
  
Begin
  writeln('Enter n <= 20:');
  readln(n);
  
  if n > 20 then begin
    writeln('Can not work with n > 20!');
    exit;
  end;
  
  { getting array values }
  for i = 0 to n do
    read(a[i]);

  for i = 0 to n - 1 do begin
    for j = i to n do
      if a[i] > a[j] then
        sum := sum + 1;
  end;
  
  writeln('inversions count ', sum);
End.
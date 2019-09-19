Var
  a : array[0..19] of integer;
  i, j, n, sum : integer;
  
Begin
  writeln('Enter n <= 20:');
  readln(n);
  
  if n > 20 then begin
    writeln('Can not work with n > 20! Quit...');
    exit;
  end;
  
  { getting array values }
  for i := 0 to n - 1 do
    readln(a[i]);


  for i := 0 to n - 2 do begin
    for j := i+1 to n - 1 do
      if a[i] > a[j] then
        sum := sum + 1;
  end;
  
  writeln('inversions count: ', sum);
End.
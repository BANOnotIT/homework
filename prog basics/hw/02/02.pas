Var
  A : array[1..11, 1..11] of integer;
  p, q, n, i, j : integer;
  
Begin
  writeln('enter n:');
  readln(n);
  
  writeln('enter matrix values in a row:');
  for i := 1 to n do
    for j := 1 to n do
      read(A[i, j]);
  
  writeln('enter p and q:');
  readln(p, q);
  
  if (p > n) or (q > n) then begin
    writeln('coordinates does not exist in matrix');
    exit;
  end;
      
  writeln('source matrix:');
  for i := 1 to n do begin
    for j := 1 to n do
      write(A[i, j]:5);
      
    writeln;
  end;
  
  writeln('elements eql r:');
  writeln('   el    i    j');b 
  for i := 1 to n do
    for j := 1 to n do
      if A[p, q] = A[i, j] then
        writeln(A[i, j]:5, i:5, j:5);
        
        
  writeln('matix without ',p,'th row');
  for i := 1 to n-1 do begin
    for j := 1 to n do
      write(A[i + (i div p), j]:5);
      
    writeln;
  end;
End.
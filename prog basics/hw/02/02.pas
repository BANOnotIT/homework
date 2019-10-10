Var
  A : array[1..11, 1..11] of integer;
  p, q, n, i, j : integer;
  
Begin
  writeln('enter n:');
  readln(n);
  
  writeln('enter matrix ',n*n,' elements. all in a row:');
  for i := 1 to n do
    for j := 1 to n do
      read(A[i, j]);

  writeln('source matrix:');
  for i := 1 to n do begin
    for j := 1 to n do
      write(A[i, j]:5);
    writeln;
  end; writeln;

  writeln('enter p and q:');
  readln(p, q);
  
  if (p > n) or (q > n) then begin
    writeln('coordinates does not exist in matrix');
    exit;
  end;
  
  writeln('elements eql r:');
  writeln('   el    i    j');
  writeln('---------------');
  for i := 1 to n do
    for j := 1 to n do
      if A[p, q] = A[i, j] then
        writeln(A[i, j]:5, i:5, j:5);
  writeln;
        
  writeln('matix without row ',p,':');
  for i := 1 to n do begin
    if i = p then continue;

    for j := 1 to n do
      write(A[i, j]:5);   
    writeln;
  end;
End.
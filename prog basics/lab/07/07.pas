Uses Sorting;
Var 
  A : Sorting.IAInt;
  n, m, i, j : integer;
  
Begin
  repeat
    writeln('enter n, m <= 10:');
    readln(n,m);
  until (n <= 10) or (m <= 10);
  
  writeln('enter all elements in a row:');
  for i := 1 to n do
    for j := 1 to m do
      read(A[i, j]);
      
  for i := 0 to n-1 do
    Sorting.sort(A, i*m, (i+1)*m);
    
  writeln('sorted by rows matrix:');
  for i := 1 to n do begin
    for j := 1 to m do
      read(A[i, j]:4);
    writeln;
  end;
End.
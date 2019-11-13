Uses Sorting;
Var
  A : array of integer;
  n, m, i, j : integer;

Begin
  repeat
    writeln('enter n, m <= 10:');
    readln(n,m);
  until (n <= 10) or (m <= 10);
  setlength(A,n*m);

  writeln('enter all elements in a row:');
  for i := 0 to n-1 do
    for j := 0 to m-1 do
      read(A[i*m + j]);

  for i := 0 to n-1 do begin
    for j := 0 to m-1 do
      write(A[i*m + j]:4);
    writeln;
  end;

  for i := 0 to n-1 do
    Sorting.sort(A, i*m, (i+1)*m-1);
    
  writeln('sorted by rows matrix:');
  for i := 0 to n-1 do begin
    for j := 0 to m-1 do
      write(A[i*m + j]:4);
    writeln;
  end;
End.

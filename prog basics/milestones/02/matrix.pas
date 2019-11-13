VAR
  matrix : array of integer;
  n, m, newm, i,j, k : integer;
  maxi,max : integer;
  j1:integer;

procedure shiftCol(var a: ARRAY OF INTEGER;  start, n, m : integer);
var i, j : integer;
begin
  for i := 0 to n-1 do
    for j := start to m-2 do
      a[i*m + j] := a[i*m + j + 1];
end;

procedure sort(var A : ARRAY OF INTEGER; s, e : integer);
var
  swapped : boolean;
  i, j, tmp : integer;
begin
  for j := 1 to e-s - 1 do begin
    swapped := false;

    for i := s to e - j do
      if A[i] > A[i + 1] then begin
        swapped := true;

        tmp    := A[i];
        A[i]   := A[i + 1];
        A[i+1] := tmp;
      end;

    if not swapped then
      break;
  end;
end;

BEGIN
  WriteLn('Enter N, M:');
  ReadLn(n,m);
  SetLength(matrix, n*m);

  WriteLn('Enter all elements in a row:');
  for i:=0 to n-1 do
    for j := 0 to m-1 do
      read(matrix[i*m + j]);

  newm := m;

  for j := 0 to m-1 do begin
    k := 0;
    for i:=0 to n-1 do
      if (matrix[i*m + j - (m-newm)] mod 2) = 0 then
        k := k+1;

    if k>3 then begin
      newm := newm - 1;
      shiftCol(matrix,j,n,m);
    end;
  end;

  maxi := 0;
  max := matrix[0];
  for i:=0 to n-1 do begin
    for j := 0 to newm-1 do
      if matrix[i*m + j] > max then begin
          max := matrix[i*m + j];
          maxi := i;
      end;
  end;

  sort(matrix,maxi*m,maxi*m + newm);

  WriteLn('Result matrix:');
  for i:=0 to n-1 do begin
    for j := 0 to newm-1 do
      Write(matrix[i*m+j]:3);
    WriteLn;
  end;
END.

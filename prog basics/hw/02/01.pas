Var
  A : array[] of char;
  tmp : char;
  i, j, n, k : integer;
  swapped : boolean;

Begin

  writeln('enter charters count:');
  readln(n);
  
  writeln('enter charters:');
  for i := 1 to n do
    read(A[i]);
    
  writeln;
  
  for j := 1 to n - 1 do begin
    swapped := false;
    
    for i := 1 to n - j do
      if A[i] > A[i + 1] then begin
        swapped := true;
        
        tmp    := A[i];
        A[i]   := A[i + 1];
        A[i+1] := tmp;
      end;
      
    if not swapped then 
      break;
  
  end;
  
  writeln('sorted result:');
  for i := 1 to n do
    write(A[i]);
  
End.
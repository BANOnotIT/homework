program bobrenkoLab05;

Var
  L : array[0..7] of array[0..5] of array[0..3] of integer;
  i, j, a, b, c : integer;
 
Begin

  writeln('Enter 192 elements :D');
  for a = 0 to 8 do
    for b = 0 to 6 do
      for c = 0 to 4 do
        read(L[a][b][c]);

  for i = 0 to 8 * 6 * 4 do
  begin
    if (i mod 12) = 0 then
    begin
      writeln;
      for j = 0 to i div 12 do
        write(' ');
    end;
    
    a := i div (4 * 6);
    b := (i div 4) mod 6;
    c := i mod 4;
    
  
    write(L[a][b][c], ' ');
  end;
End.
program bobrenkoLab05;

Var
  L : array[0..7, 0..5, 0..3] of integer;
  i, j, a, b, c : integer;
 
Begin

  writeln('Enter ', 8*6*4 ,' elements :D');
  for a := 0 to 7 do
    for b := 0 to 5 do
      for c := 0 to 3 do
        readln(L[a, b, c]);

  for i := 0 to 8 * 6 * 4 -1 do
  begin
    if (i mod 12) = 0 then
    begin
      writeln;
      for j := 0 to (i div 12) -1 do
        write(' ');
    end;
    
    a := i div (4 * 6);
    b := (i div 4) mod 6;
    c := i mod 4;
      
    write(L[a,b,c], ' ');
  end;

  writeln;
End.
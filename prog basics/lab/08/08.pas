Uses Sysutils;
Var
  f, g : file of char;
  n, i, j : integer;
  instr, word : string;
  curchar : char;
  
Begin
  AssignFile(f, 'F'); AssignFile(g, 'G');
  Rewrite(f); Rewrite(g); { rw }
  
  writeln('Enter words count:');
  readln(n);
  
  writeln('Enter ',n,' words. one per line:');
  for i := 1 to n do begin
    readln(instr);
    for j := 1 to length(instr) do
      write(f, instr[j]);
    
    if n <> i then
      write(f, ' ');
  end;
  closefile(f); reset(f); { flush buffer }
  
  word := '';
  repeat
    read(f, curchar);
    if curchar <> ' ' then
      word := word + curchar;

    if (curchar = ' ') or EOF(f) then begin
      if length(word) > 3 then begin
        for i := 1 to length(word) do
          write(g, word[i]);

        if not EOF(f) then
          write(g, ' ');
      end;
    
      word := '';
    end;
  until EOF(f);
  closefile(g);
  
  writeln('you can check the G file now');
End.
Var
  f, g : file of char;
  n, i, j : integer;
  instr : string;
  word : string;
  curchar : char;
  
Begin
  assignfile(f; 'F');
  assignfile(g; 'G');
  
  rewrite(f); { rw }
  rewrite(g); { wo }
  
  writeln('enter words count:');
  readln(n);
  
  writeln('enter ',n,' words. one per line:')
  for i := 1 to n do begin
    readln(instr);
    
    for j := 1 to len(instr) do
      write(f; instr[j]);
    
    { insert words separator }
    if n <> i then
      write(f; ' ');
  end;
  
  closefile(f); { flush buffer }
  seek(f; 0);
  
  word := '';
  while not EOF(f) do begin
    read(f; curchar);
    
    { pointer moved after read so eof might now work }
    if (curchar = ' ') or EOF(f) then begin
      if len(word) >= 3 then begin
        for i := 1 to len(word) do
          write(g; word[i]);
        
        write(g; ' ');
      end;
    
      word := '';
    end else
      word := word + curchar;
  end;
  closefile(g); { flush buffer }
  
  writeln('you can check the G file now');

End.
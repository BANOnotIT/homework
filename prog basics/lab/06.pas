Var
  prev, cur : char;
  res, n, i : integer;
  startedWithA : boolean;

Begin
  
  readln(n);
  
  for i = 0 to n do
  begin
    prev := cur;
    
    read(cur);
    
    if i = 0 or prev = ' ' then
      startedWithA := cur = 'A';
    
    if cur = ' ' or i = n - 1 then begin
      if startedWithA and prev = 'E' then
        res := res + 1;
      
      startedWithA := false;
    end;
    
    
      
    
  end;
  writeln; { safe new line so result is apart from input }
  
  writeln(res);

End.
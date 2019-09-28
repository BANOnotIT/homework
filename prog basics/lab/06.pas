Var
  prev, cur : char;
  res, n, i : integer;
  startedWithA : boolean;

Begin
  
  readln(n);
  
  for i := 1 to n do
  begin
    prev := cur;
    
    read(cur);
    
    if (i = 1) or (prev = ' ') then
      startedWithA := cur = 'A';
    
    if (cur = ' ') or (i = n) then begin
      if startedWithA and ((prev = 'E') or (cur = 'E')) then
        res := res + 1;
      
      startedWithA := false;
    end;    
  end;

  writeln(res);

End.
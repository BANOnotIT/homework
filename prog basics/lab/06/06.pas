Var
  prev, cur : char;
  res, n, i : integer;
  startedWithA : boolean;

Begin
  writeln('Enter chars count:');
  readln(n);

  prev := #0;
  res := 0;
  writeln('Enter chars:');
  for i := 1 to n do
  begin
    read(cur);
    
    if (i = 1) or (prev = ' ') then
      startedWithA := cur = 'A';
    
    if (cur = ' ') or (i = n) then begin
      if startedWithA and ((prev = 'E') or (cur = 'E')) then
        res := res + 1;
      
      startedWithA := false;
    end;

    prev := cur;
  end;

  writeln('Found ',res,' "A.*E" words.');
End.
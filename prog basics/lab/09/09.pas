type
  pItem = ^TItem;
  TItem = record
    value : Char;
    next : pItem;
  end;

procedure printlist(current : pItem);
begin
  repeat
    write(current^.value:3);
    current := current^.next;
  until current = nil;
  writeln;
end;


var
  n, i : integer;
  start, prev, current, half : ^TItem;
  matches : boolean;
  search : char;

Begin
  repeat
    writeln('Enter chars count: ');
    readln(n);
  until (n > 0) and ((n mod 2) = 0);

  new(start);
  prev := start;
  writeln('Enter all chars in a row:');
  for i := 1 to n do begin
    new(current);
    read(current^.value);
    prev^.next := current;
    prev := current;
  end;

  // skip a half
  half := start^.next;
  for i := 1 to n div 2 do 
    half := half^.next;

  current := start^.next;
  repeat
    matches := current^.value = half^.value;
    current := current^.next;
    half := half^.next;
  until (not matches) or (half = nil);
  if matches then
    writeln('Halves of list are equal!')
  else
    writeln('Halves of list are NOT equal!');


  writeln('Enter char to exclude:');
  read(search);

  writeln('Entered list:');
  printlist(start^.next);


  current := start^.next;
  matches := false;
  prev := start;
  repeat
    if current^.value = search then begin
      matches := true;
      prev^.next := current^.next;
    end;
    prev := current;
    current := current^.next;
  until (current = nil) or matches;
  if matches then
    dispose(prev);

  if not matches then
    writeln('No such item in list.')
  else begin
    writeln('List without ',search,':');
    printlist(start^.next);
  end;
End.



Type cset = set of char;
Const AL : cset = ['a','e','i','o','u','y'];
Var genset, curset : cset;
  cur : char;
  skipWord, nextIsStart, firstWord, vowelsFound : boolean;

Begin
  nextIsStart := true;
  firstWord := true;
  vowelsFound := false;
  curset := [];
  genset := AL;

  writeln('Enter the string ending with dot:');
  repeat
    read(cur);

    if cur in ['.',' '] then begin    
      if not skipWord then
        genset := genset * curset;
      curset := [];
      
      skipWord := false;
      nextIsStart := true;
    end
    else begin
      if nextIsStart then begin
        skipWord := cur <> 'k';
        nextIsStart := false;
      end
      else curset := curset + [cur];
    end;
  until cur = '.';

  writeln('Vowels found in all k-words:');
  for cur := 'a' to 'z' do
    if cur in genset then begin
      write(cur, ' ');
      vowelsFound := true;
    end;

  if vowelsFound then writeln
  else writeln('no vowels');
End.
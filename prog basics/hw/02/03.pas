Type cset = set of char;
Const AL : cset = ['a','e','i','o','u','y'];
Var
  genset, curset : cset;
  cur : char;
  skipWord, nextIsStart, firstWord, wordsFound : boolean;

Begin
  nextIsStart := true;
  firstWord := true;
  wordsFound := false;

  curset := [];
  genset := AL;

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
        wordsFound := wordsFound or not skipWord;
        nextIsStart := false;
      end
      else
        curset := curset + [cur];
    end;
  until cur = '.';
  
  if not wordsFound then
    writeln('No k-words found')
  else begin
    writeln('Vowels found in all k-words:');
    for cur := 'a' to 'z' do
      if cur in genset then
        write(cur, ' ');
  end;
End.
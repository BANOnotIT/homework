Type
  cset = set of char;

Const
  AL : cset = ['a','e','i','o','u','y'];

Var
  genset, curset : cset;
  cur : char;
  skipWord, nextIsStart, firstWord : boolean;

Begin

  nextIsStart := true;
  firstWord := true;

  repeat
    read(cur);
    
    if cur in ['.',' '] then begin
    
      if firstWord then begin
        genset := curset;
        firstWord := false;
      end;
    
      genset := genset * curset * AL;
      curset := [];
      
      skipWord := false;
      nextIsStart := true;
      
    end
    else begin
      if nextIsStart then begin
        skipWord := cur <> 'k';
        nextIsStart := false;
      end
      else if not skipWord then
        curset := curset + [cur];
    end;
    
  until cur = '.';
  
  for cur := 'a' to 'z' do
    if cur in genset then
      writeln(cur);

End.
{$h+} 
{$mode objfpc} 
// tag::implementation[]
Type
  TBlock = object
    protected width, length, height : real;
    public
      procedure print; virtual;
      constructor init(w,h,l : real);
      function getValue : real;
  end;
  TBrick = object(TBlock)
    protected
      mass : real;
    public
      function getDensity : real;
      constructor init(w,h,l,m : real);
      procedure print;
  end;
constructor TBlock.init(w,h,l : real);
begin
  width := w;  height := h;  length := l;
end;
procedure TBlock.print;
begin
  write('width:',width:5:5,' height:',height:5:5,' length:',length:5:5);
end;
function TBlock.getValue() : real;
begin  getValue := width * height * length;  end;
constructor TBrick.init(w,h,l,m : real);
begin
  inherited init(w,h,l);
  mass := m;
end;
procedure TBrick.print();
begin
  inherited print;
  write(' mass:',mass:5:5);
end;
function TBrick.getDensity : real;
begin  getDensity := mass / getValue;  end;
// end::implementation[]
// tag::testing[]
Var
  brick : TBrick;  block : TBlock;
Begin
  brick.init(1,2,3,6);
  block.init(3,2,2);

  writeln('TBlock getValue+init test: ',block.getValue() = 12);  
  writeln('TBlock print test (visual) 3,2,2:');
  block.print;  writeln;
  
  writeln('TBrick getValue+init test: ', brick.getValue = 6);
  writeln('TBrick getDensity test: ', 1 = brick.getDensity);
  writeln('TBrick print test (visual) 1,2,3,6: ');
  brick.print;  writeln;
End.
// end::testing[]
Type
  TBlock = object
    private 
      width, length, height : float;
    public
      procedure print;
      procedure Init(w,h,l : float);
      function getValue : float;
  end;
  TBrick = object(TBlock)
    private
      mass : float;
    public
      function getDensity : float;
  end;
  
  
procedure TBlock.Init(w,h,l : float);
begin
  width := w;
  heigth := h;
  length := l;
end;

procedure TBlock.print;
begin
  write('width:',width:5:5,' heigth:',heigth:5:5,' length:',length:5:5);
end;

function TBlock.getValue : float;
begin
  getFloat := width * heigth * length;
end;

procedure TBrick.Init(w,h,l,m : float);
begin
  inherited Init(w,h,l)
  mass := m;
end;

procedure TBrick.print;
begin
  inherited print;
  write(' mass:',mass);
end;

function TBrick.getDensity : float;
begin
  getDensity := mass / getValue;
end;

Var
  brick : TBrick;
  block : TBlock;
Begin
  brick.Init(1,2,3,6);
  block.Init(3,2,2);
  
  writeln('TBlock getValue+init test: ',block.getValue = 12);
  
  writeln('TBlock print test (visual) 3,2,2:');
  block.print;
  writeln;
  
  writeln('TBrick getValue+init test: ', brick.getValue = 6);
  writeln('TBrick getDensity test: ', 1 = brick.getDensity);
  writeln('TBrick print test (visual) 1,2,3,6: ');
  brick.print;
  writeln;
End;
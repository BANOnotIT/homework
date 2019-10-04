Uses
  Trap;

Const
  a1: real = -1;
  b1: real = 4;
  
  a2: real = -.5;
  b2: real = 0;

Var
  n, choice : integer;
  s : real

function fn1(x : real): real;
begin
  fn1 := x + cox(x);
end;

function fn2(x : real): real;
begin
  fn2 := tan(x + 1)/(x + 1);
end;

Begin

  repeat
    writeln('Enter function varian (1 - cos, 2 - sin):');
    readln(choice);
  until choice in [1, 2];
  
  repeat
    writeln('Enter n:');
    readln(n);
  until n > 0;
  
  case choice 
   1: s := TRAP(fn1, a1, b1, n);
   2: s := TRAP(fn2, a2, b2, n);
  end;
   
  writeln('Area is ', s);
End.
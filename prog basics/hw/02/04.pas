Uses
  Trap, math;

Const
  a1: real = -1;
  b1: real = 4;
  
  a2: real = -0.5;
  b2: real = 0;

Var
  n, choice : integer;
  s : real;

function fn1(const x : real): real;
begin
  fn1 := x + cos(x);
end;

function fn2(const x : real): real;
begin
  fn2 := tan(x + 1)/(x + 1);
end;

Begin

  repeat
    writeln('Enter function variant (1 - cos, 2 - tan):');
    readln(choice);
  until choice in [1, 2];
  
  repeat
    writeln('Enter n:');
    readln(n);
  until n > 0;
  
  case choice of
   1: s := TRAP.Trap(@fn1, a1, b1, n);
   2: s := TRAP.Trap(@fn2, a2, b2, n);
  end;
   
  writeln('Area is:');
  writeln(s:10:10);
End.
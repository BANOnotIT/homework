Unit Trap;
Interface
  Type TFn = function(const x : real): real;
  function TRAP(const f : TFn; a, b : real; n : integer): real;
  
Implementation
  function TRAP(const f : TFn; a, b : real; n : integer): real;
  var
    h : real;
    i : integer;
  begin
  
    h := (b - a) / n;
    trap := (f(a) + f(b)) / 2;
    
    for i := 1 to n - 1 do
      trap := trap + f(a + (h * i));
    
    trap := trap * h;
  end;
End.
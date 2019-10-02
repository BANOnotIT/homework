Unit Trap;

Type
  TFn: function(x : real): real;
  
Interface
  function TRAP(f : TFn; a, b : real; n : integer): real;
  
Implementation
  function TRAP(f : TFn; a, b : real; n : integer): real;
  var
    h : real;
    i : integer;
    s : real;
  begin
  
    h := (b - a) / n;
    
    trap := (f(a) + f(b)) / 2;
    
    for i := 1 to n - 1 do
      trap := trap + f(a + (h * i));
    
    trap := trap * h;
  
  end;
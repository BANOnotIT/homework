function f(x : real): real;
begin
    f := sqrt(x * x * x)
end;
Const
  A : real = 9.073415289388;
Var
  eps, len, h, dist : real;
  n, i : integer;
Begin
    writeln('Enter eps:');
    readln(eps);

    n := 1;
    repeat
        h := 4.0 / n;
        len := 0;

        for i := 1 to n do begin
            dist := sqrt(
                sqr(h) + 
                sqr(f(h * i) - f(h * (i-1)))
            );
            len := len + dist;
        end;

        n := n + 1;
    until abs(len - A) < eps;

    writeln('result = ',len);
End.
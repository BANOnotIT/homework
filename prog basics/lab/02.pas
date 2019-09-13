Program bobrenkoLab2;

var x, y : real;
Begin
    
    readln(x, y);
    
    if (x <= 0.0) and
       (abs(y) <= sqrt(-x)) and
       (abs(y) <= (x+1.0)) 
    then
      writeln('inside')
    else
      writeln('outside');
       
    
End.

{
    tests
    1. -2   0   ->  ?? -
    2.  1   0   ->  ?? -
    3. -.5  0   ->  ?? +
    4. -.5  -.5 ->  ?? +
}
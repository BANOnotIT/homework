Program bobrenkoLab2;

var x, y : real;
Begin
    
    readln(x, y);
    
    if (x <= 0) and
       (abs(y) <= sqrt(-x)) and
       (abs(y) <= (x+1)) 
    then
      writeln('inside')
    else
      writeln('outside');
       
    
End.
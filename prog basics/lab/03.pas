program bobrenkoLab03;

var cur, prev, sum, k, i, w : integer;
Begin
    prev := 0;
    sum := 0;
    
    
    writeln('Enter k:');
    readln(k);
    
    for i := 0 to k-1 do begin
      w := prev;

      if i = 0 then
        cur := 1
      else begin
        prev := cur;
        cur := w + cur;
      end;
      
      sum := cur + sum;
    end;
    
    writeln(k, 'th factorial sum = ', sum);
    
End.

{
    tests:
        0  -> 0
        1  -> 1
        3  -> 4
        7  -> 33
        
}
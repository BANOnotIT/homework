program bobrenkoLab03;

var cur, prev, sum, k, i, w : integer;
Begin
    prev := 0;
    sum := 0;
    
    
    writeln('Enter k:');
    readln(k);
    
    while (i < k) do begin
      w := prev;

      if i = 0 then
        cur := 1
      else begin
        prev := cur;
        cur := w + cur;
      end;
      
      sum := cur + sum;
      i := i + 1;
    end;
    
    writeln(k, 'th factorial sum = ', sum);
    
End.
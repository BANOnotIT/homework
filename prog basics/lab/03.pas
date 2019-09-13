program bobrenkoLab03;

var prev, pprev, sum, k, i : integer;
Begin
    prev := 1;
    pprev := 1;
    
    write('k: ');
    readln(k);
    
    for i := 0 to k do begin
      prev := pprev + prev;
      pprev := pprev + prev;
      
      sum := prev + sum;
    end;
    
    writeln(sum);
    
End.
Unit Sorting;
Interface
  procedure sort(var A : array of integer; s, e : integer);

Implementation
  procedure sort;
  var 
    swapped : boolean;
    i, j, tmp : integer;
  begin
    for j := s to e - 1 do begin
      swapped := false;
      
      for i := s to e - j do
        if A[i] > A[i + 1] then begin
          swapped := true;
          
          tmp    := A[i];
          A[i]   := A[i + 1];
          A[i+1] := tmp;
        end;
        
      if not swapped then 
        break;
    end;
  end;
End.
Unit Sorting;
Interface
  Type 
    TIndex = 1..10;
    TAInt = array[] of integer;

  procedure sort(var A : TAInt; ai, m : TIndex);

Implementation
  procedure sort(var A : TAInt; ai, m : TIndex);
  var 
    swapped : boolean;
    i, j : TIndex;
    tmp : integer;
  begin
    
    for j := 1 to m - 1 do begin
      swapped := false;
      
      for i := 1 to m - j do
        if A[ai,i] > A[ai,i + 1] then begin
          swapped := true;
          
          tmp       := A[ai,i];
          A[ai,i]   := A[ai,i + 1];
          A[ai,i+1] := tmp;
        end;
        
      if not swapped then 
        break;
    end;
  
    
  end;
  
End.
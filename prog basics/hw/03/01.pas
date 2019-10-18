Type
  TElevator = object
    private
      floor: integer;
    public
      function getFloor() : integer;
      procedure liftTo(nextFloor : integer);
      procedure Init(initialFloor : integer);
  end;

procedure TElevator.Init(initialFloor : integer);
begin
  Self.liftTo(initialFloor);
end;

procedure TElevator.liftTo(nextFloor : integer);
begin
  Self.floor := nextFloor; 
end; 
  
function TElevator.getFloor(): integer;
begin
  getFloor := Self.floor;
end;

Var
  A: TElevator;
Begin
  A.Init(1);
  writeln('Test initial value: ', 1 = A.getFloor);
  
  A.liftTo(2);
  writeln('Test liftTo procedure: ', 2 = A.getFloor);
  
  A.liftTo(3);
  writeln('Test getFloor function: ', 3 = A.getFloor);
End.
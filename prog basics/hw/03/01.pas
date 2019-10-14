Type
  TElevator = object
    floor: integer;
    function getFloor : integer;
    procedure goTo(floor : integer);
    procedure Init(floor : integer);
  end;

procedure TElevator.Init(initialFloor : integer);
begin
  Self.goTo(initialFloor);
end;

procedure TElevator.goTo(nextFloor : integer);
begin
  Self.floor := nextFloor; 
end; 
  
function TElevator.getFloor(): integer
begin
  getFloor := Self.floor;
end;

Var
  A: TElevator;
Begin
  A.Init(1);
  writeln('Test initial value: ', 1 = A.floor);
  
  A.goTo(2);
  writeln('Test goTo procedure: ', 2 = A.floor);
  
  A.goTo(3);
  writeln('Test getFloor function: ', 3 = A.getFloor);
End.
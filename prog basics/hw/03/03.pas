Type
  sym = string[2];
  Atom = object
    private
      symbol : sym;
      mass : real;
      
    public
      procedure Init(sym : sym; m : real);
      procedure print;
      function getMass : real;
      function getSym : sym;
  end;

  pAtom = ^Atom;
  
  Molecule = object
    private
      atoms : array of pAtom;
      ratios : array of integer;
    public
      procedure Init(ats : array of pAtom);
      procedure print;
      function getMass : real;
  end;
  
procedure Molecule.Init(ats : array of pAtom);
var
  i, l : integer;
begin
  setlength(self.atoms, 1);
  setlength(self.ratios, 1);
  self.atoms[0] := ats[0];
  self.ratios[0] := 1;
  l := 1;
  
  for i := 1 to high(ats)-1 do begin
    if atoms[l-1]^.getSym = ats[i]^.getSym then
      inc(ratios[l-1])
    else begin
      inc(l);
      setlength(self.atoms, l); setlength(self.ratios, l);
      
      self.atoms[l-1] := ats[i];
      self.ratios[l-1] := 1;
    end;
  end;
end;

procedure Molecule.print;
var 
  i : integer;
begin
  for i := 0 to length(self.atoms)-1 do begin
    write(self.atoms[i]^.getSym);
    if self.ratios[i] <> 1 then
      write(self.ratios[i]);
  end;
end;


unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls, Graphics;

type
  Figure = class
  public
    points: array of TPoint;
    rad: real;
    origin: TPoint;
    canvas: TCanvas;
    procedure Paint;
    constructor Create(shape: TShape);
  end;

  I = class(Figure)
    constructor Create(shape: TShape);
  end;

  T = class(Figure)
    constructor Create(shape: TShape);
  end;

  H = class(Figure)
    constructor Create(shape: TShape);
  end;


implementation


function rotate(origin, p: TPoint; alpha: real): TPoint;
var
  x, y: longint;
begin
  Result := p - origin;
  X := Round(Result.x * cos(alpha) - Result.y * sin(alpha));
  Y := Round(Result.x * sin(alpha) + Result.y * cos(alpha));
  Result := TPoint.Create(x, y) + origin;
end;

procedure Figure.Paint;
var
  prev, cur: TPoint;
  i: integer;
begin
  canvas.Clear;

  prev := rotate(origin, points[1], rad);
  canvas.MoveTo(prev);

  for i := 2 to length(points) do
  begin
    cur := rotate(origin, points[i], rad);
    Canvas.LineTo(cur);
  end;

end;

constructor Figure.Create(shape: TShape);
begin
  canvas := shape.Canvas;
end;

constructor I.Create(shape: TShape);
begin
  inherited Create(shape);
  SetLength(points, 6);

  points[1] := Point(35, 20);
  points[2] := Point(65, 20);
  points[3] := Point(50, 20);
  points[4] := Point(50, 60);
  points[5] := Point(35, 60);
  points[6] := Point(65, 60);

  origin := Point(50, 60);
end;

constructor T.Create(shape: TShape);
begin
  inherited Create(shape);
  SetLength(points, 7);

  points[1] := Point(35, 25);
  points[2] := Point(35, 20);
  points[3] := Point(65, 20);
  points[4] := Point(65, 25);
  points[5] := Point(65, 20);
  points[6] := Point(50, 20);
  points[7] := Point(50, 60);

  origin := Point(50, 60);
end;

constructor H.Create(shape: TShape);
begin
  inherited Create(shape);
  SetLength(points, 6);

  points[1] := Point(30, 20);
  points[2] := Point(30, 60);
  points[3] := Point(30, 40);
  points[4] := Point(50, 40);
  points[5] := Point(50, 60);
  points[6] := Point(50, 20);

  origin := Point(30, 40);
end;

end.

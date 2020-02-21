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

  Line = class(Figure)
    constructor Create(shape: TShape);
  end;

  Triangle = class(Figure)
    constructor Create(shape: TShape);
  end;

  Diamond = class(Figure)
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

  for i := 1 to length(points) + 1 do
  begin
    cur := rotate(origin, points[(i mod length(points)) + 1], rad);
    Canvas.LineTo(cur);

    prev := cur;

  end;

end;

constructor Figure.Create(shape: TShape);
begin
  canvas := shape.Canvas;
  origin := TPoint.Create(Round(shape.Width / 2), Round(shape.Width / 2));
end;

constructor Line.Create(shape: TShape);
begin
  inherited Create(shape);
  SetLength(points, 2);
  points[1] := TPoint.Create(Round(shape.Width / 2), 0);
  points[2] := TPoint.Create(Round(shape.Width / 2), shape.Height);
end;

constructor Triangle.Create(shape: TShape);
var
  half, threeq, s: longint;
begin
  inherited Create(shape);
  SetLength(points, 3);
  half := Round(shape.Width / 2);
  threeq := Round(3 * shape.Width / 4);
  points[1] := TPoint.Create(half, 0);
  points[2] := TPoint.Create(half - 10, threeq);
  points[3] := TPoint.Create(half + 10, threeq);
end;

constructor Diamond.Create(shape: TShape);
var
  half: longint;
begin
  inherited Create(shape);
  SetLength(points, 4);
  half := Round(shape.Width / 2);
  points[1] := TPoint.Create(half, 0);
  points[2] := TPoint.Create(half - 10, half);
  points[3] := TPoint.Create(half, shape.Width);
  points[4] := TPoint.Create(half + 10, half);
end;

end.

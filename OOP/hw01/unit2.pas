unit Unit2;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls,
  ComCtrls;

type
  line = class
  protected
    canv: TCanvas;
    x0, y0: integer;
  public
    constructor Create(xs, ys: integer; canvas: TCanvas);
    procedure setbrush(size: integer; color: TColor);
    procedure draw(x1, y1: integer) virtual;
  end;

  zip = class(line)
  public
    procedure draw(x1, y1: integer) override;
  end;

implementation

constructor line.Create(xs, ys: integer; canvas: TCanvas);
begin
  canv := canvas;
  x0 := xs;
  y0 := ys;
end;

procedure line.setbrush(size: integer; color: TColor);
begin
  canv.Pen.Color := color;
  canv.Pen.Width := size;
end;

procedure line.draw(x1, y1: integer);
begin
  canv.Clear;
  canv.Line(x0, y0, x1, y1);
end;

procedure zip.draw(x1, y1: integer);
begin
  canv.Clear;
  canv.line(x0, y0, x1, y0);
  canv.line(x1, y0, x1, y1);
end;

end.

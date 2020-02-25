unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ColorBox,
  MaskEdit, StdCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    ColorBox1: TColorBox;
    LabeledEdit1: TLabeledEdit;
    PaintBox1: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure PaintBox1MouseLeave(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
  private

  public

  end;

var
  Form1: TForm1;
  startX, startY: integer;
  Lines: Line;
  down: boolean = False;


implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  ss: integer;
begin
  if button = mbRight then
    Lines := zip.Create(x, y, PaintBox1.Canvas)
  else
    Lines := line.Create(x, y, PaintBox1.Canvas);

  val(LabeledEdit1.Text, ss);
  Lines.setbrush(ss, ColorBox1.Selected);
  down := True;
end;

procedure TForm1.PaintBox1MouseLeave(Sender: TObject);
begin
  down := False;
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
begin
  if down then
    Lines.draw(x, y);
end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  down := False;
end;

end.



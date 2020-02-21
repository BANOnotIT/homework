unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);


  end;

var
  Form1: TForm1;
  li: Line;
  tri: Triangle;
  diam: Diamond;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  li := Line.Create(shape1);
  tri := Triangle.Create(Shape2);
  diam := Diamond.Create(shape3);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  li.rad := li.rad + 0.5;
  li.paint;
  tri.rad := tri.rad + 0.3;
  tri.Paint;
  diam.rad := diam.rad + 0.1;
  diam.paint;
end;

end.


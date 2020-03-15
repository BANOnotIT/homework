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
    procedure Shape2ChangeBounds(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);


  end;

var
  Form1: TForm1;
  li: I;
  tri: T;
  diam: H;
  ti : integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  li := I.Create(shape1);
  tri := T.Create(Shape2);
  diam := H.Create(shape3);
end;

procedure TForm1.Shape2ChangeBounds(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  li.rad := sin(ti / 3);
  li.paint;

  tri.rad := 0.2 * sin(ti / 2);
  tri.Paint;

  diam.rad := 1.7 * sin(ti/5);
  diam.paint;

  inc(ti);
end;

end.


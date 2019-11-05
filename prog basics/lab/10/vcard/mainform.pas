unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    LabeledEdit1: TLabeledEdit;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdleTimer1Timer(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
type
  TCard = record
    name : string[22];
    surname : string[22];
    phone : string[22];
    addr : string[22];
  end;

{$R *.lfm}

{ TForm1 }



procedure TForm1.Button1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.IdleTimer1Timer(Sender: TObject);
begin

  StringGrid1.InsertRowWithValues(0,[LabeledEdit1.Text,'','','']);

end;

procedure TForm1.LabeledEdit1Change(Sender: TObject);
begin
  writeln(LabeledEdit1.Text);
  Timer1.Enabled:=true;
end;

end.


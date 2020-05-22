unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, MaskEdit;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
  end;

var
  Form4: TForm4;

implementation

{$R *.lfm}

{ TForm4 }

procedure TForm4.Button1Click(Sender: TObject);
begin
  SQLQuery1.Close;
  SQLQuery1.ParamByName('date').AsString := MaskEdit1.Text;
  SQLQuery1.Open;
  ShowMessage(SQLQuery1.fields[0].AsString);
end;

end.

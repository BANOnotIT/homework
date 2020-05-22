unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, sqldb, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
begin
  SQLQuery1.Close;
  SQLQuery1.ParamByName('cost').AsInteger := StrToInt(Edit1.Text);
  SQLQuery1.Open;
end;

end.

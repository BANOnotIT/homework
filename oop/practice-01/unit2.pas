unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, DB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, DBCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    producerEdit: TEdit;
    titleEdit: TEdit;
    Label2: TLabel;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Edit1Change(Sender: TObject);
begin

end;

procedure TForm2.Label1Click(Sender: TObject);
begin

end;

procedure TForm2.Button1Click(Sender: TObject);
var
  a: integer;
begin
  SQLQuery1.Close;

  SQLQuery1.ParamByName('producer').AsString := producerEdit.Text;
  SQLQuery1.ParamByName('title').AsString := titleEdit.Text;

  SQLQuery1.Open;
  if SQLQuery1.EOF then
    ShowMessage('Отсутствует')
  else
    ShowMessage('В наличии');
end;

end.

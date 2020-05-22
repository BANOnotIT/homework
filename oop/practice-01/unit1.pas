unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, DB, csvdataset, Forms, Controls,
  Graphics, Dialogs, DBGrids, DBCtrls, StdCtrls, ExtCtrls, sqlscript,
  Unit2, Unit3, Unit4, Unit5;

type

  { TForm1 }

  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  end;

var
  Form1: TForm1;
  checkForm: TForm2;
  getForm: TForm3;
  sumForm: TForm4;
  graphForm: TForm5;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  checkForm := TForm2.Create(Self);
  getForm := TForm3.Create(Self);
  sumForm := TForm4.Create(Self);
  graphForm := TForm5.Create(Self);
  SQLQuery1.Open;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  SQLQuery1.ApplyUpdates;
  SQLTransaction1.Commit;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  checkForm.Show;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
  getForm.Show;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  sumForm.Show;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
  graphForm.Show;
end;

end.

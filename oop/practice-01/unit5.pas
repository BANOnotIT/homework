unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, DB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  TADbSource, TAGraph, TASeries;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    DataSource1: TDataSource;
    DbChartSource1: TDbChartSource;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form5: TForm5;

implementation

{$R *.lfm}

{ TForm5 }

procedure TForm5.Button1Click(Sender: TObject);
begin
  SQLQuery1.Close;
  SQLQuery1.ParamByName('title').AsString := edit1.Text;
  SQLQuery1.Open;
  DbChartSource1.Reset;
end;

procedure TForm5.Label1Click(Sender: TObject);
begin

end;

end.


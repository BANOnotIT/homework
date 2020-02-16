unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TADbSource,
  TAGraph;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    ComboBox1: TComboBox;
    DbChartSource1: TDbChartSource;
  private

  public

  end;

var
  Form5: TForm5;

implementation

{$R *.lfm}

end.


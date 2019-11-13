unit calc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
var
    sum : real;
    operation : char = '#';

{$R *.lfm}

{ TForm1 }

procedure Operate;
var s : string;
    n : real;
    code:integer;
begin
     s:=Form1.Edit1.text; { читаем сроку из параметра text Edit1}
     Form1.Edit1.clear; { очищаем Edit1}
     val(s,n,code); { преобразуем строку в число}
     case operation of
          { выполняем операцию}
          '@': sum:=n;
          '+': sum:=sum+n;
          '-': sum:=sum-n;
          '*': sum:=sum*n;
          '/': sum:=sum/n;
     end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.Edit1.Clear;
  operation:='@';
  Form1.Edit1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     operate; { выполнить предыдущую операцию}
     operation:='+'; { установить состояние "операция +"}
     Edit1.SetFocus; { установить активным окно компонента Edit1}
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Operate;
  operation:='*';
  Edit1.SetFocus;
end;

procedure TForm1.Button4Click(Sender: TObject);
var s : string;
begin
  operate;
  str(sum:6:3,s);
  Form1.Edit1.text := s;
  operation := '@';
  Form1.Edit1.SetFocus;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Operate;
  operation:='-';
  Edit1.SetFocus;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Operate;
  operation:= '/';
  Edit1.SetFocus;
end;

end.


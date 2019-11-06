unit NewCardForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons, cardtype;


type

  { TCardForm }

  TCardForm = class(TForm)
    AddBtn: TBitBtn;
    SurnameEdit: TLabeledEdit;
    NameEdit: TLabeledEdit;
    PhoneEdit: TLabeledEdit;
    AddrEdit: TLabeledEdit;
    procedure AddBtnClick(Sender: TObject);
    procedure AddrEditChange(Sender: TObject);
  private

  public
    OnNewCard : procedure (newcard : TCard);
  end;

var
  CardForm: TCardForm;

implementation

{$R *.lfm}

{ TCardForm }

procedure TCardForm.AddBtnClick(Sender: TObject);
var newcard : TCard;
begin
   newcard.surname:=SurnameEdit.Text;
   newcard.name:=NameEdit.Text;
   newcard.phone:=PhoneEdit.Text;
   newcard.addr:=AddrEdit.Text;

   Self.OnNewCard(newcard);

   Self.Hide;

end;

procedure TCardForm.AddrEditChange(Sender: TObject);
begin

end;

end.


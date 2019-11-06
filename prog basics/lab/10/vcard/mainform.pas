unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  ExtCtrls, Buttons, NewCardForm, cardtype;

type
  { TCardsAppForm }

  TCardsAppForm = class(TForm)
    AddCardBtn: TBitBtn;
    SearchField: TLabeledEdit;
    CardsGrid: TStringGrid;
    procedure AddCardBtnClick(Sender: TObject);
    procedure FilterCardsBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SearchFieldChange(Sender: TObject);
  private

  public

  end;

var
  CardsAppForm: TCardsAppForm;

implementation
var
  cards : file of TCard;
  CardForm : TCardForm;

{$R *.lfm}

{ TCardsAppForm }

procedure RenderAllCardsMatchingSurname;
var
  card : TCard;
  surnamePart : string;
begin
  CardsAppForm.CardsGrid.Clean;
  CardsAppForm.CardsGrid.RowCount:=1;

  surnamePart := CardsAppForm.SearchField.Text;

  seek(cards,0);
  while not EOF(cards) do begin
    Read(cards,card);

    if (surnamePart = '') or (Pos(surnamePart,card.surname)<>0) then
        CardsAppForm.CardsGrid.InsertRowWithValues(1 , [
          card.surname, card.name, card.phone, card.addr
        ]);
  end;
end;

procedure TCardsAppForm.AddCardBtnClick(Sender: TObject);
begin
      CardForm.Show;
end;

procedure AppendCardToFile(newcard: TCard);
begin
  Write(cards,newcard);
  RenderAllCardsMatchingSurname;
end;

procedure TCardsAppForm.FilterCardsBtnClick(Sender: TObject);
begin

end;

procedure TCardsAppForm.FormCreate(Sender: TObject);
begin
  AssignFile(cards,'CARDS.bin');
  Reset(cards);
  SearchField.Text:='';

  CardForm:= TCardForm.Create(CardsAppForm);
  CardForm.OnNewCard:=@AppendCardToFile;

  RenderAllCardsMatchingSurname;
end;

procedure TCardsAppForm.SearchFieldChange(Sender: TObject);
begin
      RenderAllCardsMatchingSurname;
end;

end.


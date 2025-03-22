unit form_modal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, frame_a, frame_b, u_common;

type

  { TfrmModal }

  TfrmModal = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    CheckBox1: TCheckBox;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    pnlParent: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FFrameA: TfrmFrameA;
    FFrameB: TfrmFrameB;
    FFrameType: TMyType;
  public
    property FrameType: TMyType read FFrameType write FFrameType;
  end;

var
  frmModal: TfrmModal;

implementation

{$R *.lfm}

{ TfrmModal }

procedure TfrmModal.FormCreate(Sender: TObject);
begin
  FFrameA:= nil;
  FFrameB:= nil;
  FrameType:= mtNone;

  pnlBottom.Color:= clMoneyGreen;
  pnlTop.Color:= clCream;
end;

procedure TfrmModal.FormDestroy(Sender: TObject);
begin
  if Assigned(FFrameA) then FFrameA.Free;
  if Assigned(FFrameB) then FFrameB.Free;
end;

procedure TfrmModal.FormShow(Sender: TObject);
begin
  case FrameType of
    mtFrameA:
      begin
        FFrameA:= TfrmFrameA.Create(Self);
        with FFrameA do
        begin
          Parent:= pnlParent;
          BorderStyle:= bsNone;
          Align:= alClient;
          ShowInTaskBar:= stNever;
          Show;
        end;
      end;
    mtFrameB:
      begin
        FFrameB:= TfrmFrameB.Create(Self);
        with FFrameB do
        begin
          Parent:= pnlParent;
          BorderStyle:= bsNone;
          Align:= alClient;
          ShowInTaskBar:= stNever;
          Show;
        end;
      end
    else
      pnlParent.Caption:= 'Frame has not been created';
  end;
end;

end.


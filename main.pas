unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  u_common;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnCallModalForm: TButton;
    rgItems: TRadioGroup;
    procedure btnCallModalFormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgItemsClick(Sender: TObject);
  private
    FFrameType: TMyType;
  public
    property FrameType: TMyType read FFrameType;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  form_modal
  ;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
//
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  rgItemsClick(Sender);
end;

procedure TfrmMain.rgItemsClick(Sender: TObject);
begin
  case rgItems.ItemIndex of
    0: FFrameType:= mtFrameA;
    1: FFrameType:= mtFrameB;
    2: FFrameType:= mtNone;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FFrameType:= mtNone;

  with rgItems do
  begin
    AutoSize:= True;
    Items.Clear;
    Items.Add('Show Pseudoframe A');
    Items.Add('Show Pseudoframe B');
    Items.Add('Show without Pseudoframe');
    ItemIndex:= 0;
  end;
end;

procedure TfrmMain.btnCallModalFormClick(Sender: TObject);
var
  tmpFrm: TfrmModal = nil;
begin
  tmpFrm:= TfrmModal.Create(Self);

  try
    tmpFrm.FrameType:= Self.FrameType;
    tmpFrm.ShowModal;
  finally
    FreeAndNil(tmpFrm);
  end;
end;

end.


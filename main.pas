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
    chbScrboxAutoSize: TCheckBox;
    rgItems: TRadioGroup;
    procedure btnCallModalFormClick(Sender: TObject);
    procedure chbScrboxAutoSizeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgItemsClick(Sender: TObject);
  private
    FFrameType: TMyType;
    FScrbxAutoScroll: Boolean;
  public
    property FrameType: TMyType read FFrameType;
    property ScrbxAutoScroll: Boolean read FScrbxAutoScroll;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  form_modal
  ;

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormShow(Sender: TObject);
begin
  rgItemsClick(Sender);
  chbScrboxAutoSizeChange(Sender);
end;

procedure TfrmMain.rgItemsClick(Sender: TObject);
begin
  case rgItems.ItemIndex of
    0: FFrameType:= mtFrameA;
    1: FFrameType:= mtFrameB;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  with rgItems do
  begin
    AutoSize:= True;
    Items.Clear;
    Items.Add('Show frame A');
    Items.Add('Show frame B');
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
    tmpFrm.scrboxModal.AutoScroll:= ScrbxAutoScroll;
    tmpFrm.ShowModal;
  finally
    FreeAndNil(tmpFrm);
  end;
end;

procedure TfrmMain.chbScrboxAutoSizeChange(Sender: TObject);
begin
  FScrbxAutoScroll:= chbScrboxAutoSize.Checked;
end;

end.


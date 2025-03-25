unit frame_a;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmFrameA }

  TfrmFrameA = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmFrameA: TfrmFrameA;

implementation

{$R *.lfm}

{ TfrmFrameA }

procedure TfrmFrameA.FormShow(Sender: TObject);
begin
  Label1.Caption:= Self.Name;
end;

procedure TfrmFrameA.FormCreate(Sender: TObject);
begin
  Shape1.Constraints.MinWidth:= Button1.Width * 7;
  Shape1.Brush.Color:= clLime;
end;

end.


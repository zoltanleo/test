unit frame_b;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmFrameB }

  TfrmFrameB = class(TForm)
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmFrameB: TfrmFrameB;

implementation

{$R *.lfm}

{ TfrmFrameB }

procedure TfrmFrameB.FormShow(Sender: TObject);
begin
  Label1.Caption:= Self.Name;
end;

procedure TfrmFrameB.FormCreate(Sender: TObject);
begin
  Shape1.Constraints.MinWidth:= CheckBox1.Width * 7;
  Shape1.Height:= 0;
end;

end.


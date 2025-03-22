unit frame_b;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmFrameB }

  TfrmFrameB = class(TForm)
    CheckBox1: TCheckBox;
    Label1: TLabel;
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

end.


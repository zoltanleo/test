unit frame_a;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmFrameA }

  TfrmFrameA = class(TForm)
    Button1: TButton;
    Label1: TLabel;
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

end.


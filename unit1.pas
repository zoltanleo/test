unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, laz.VirtualTrees;

type

  { TForm1 }

  TForm1 = class(TForm)
    vst: TLazVirtualStringTree;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
  Node: PVirtualNode = nil;
begin
  vst.RootNodeCount:= 10;
  vst.TreeOptions.MiscOptions:= vst.TreeOptions.MiscOptions + [toCheckSupport];
  Node:= vst.GetFirst;
  while Assigned(Node) do
  begin
    if (vst.AbsoluteIndex(Node) mod 2 = 0)
      then Node^.CheckType:= ctCheckBox
      else Node^.CheckType:= ctRadioButton;
    Node:= Node^.NextSibling;
  end;
end;

end.


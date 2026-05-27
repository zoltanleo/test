unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    TrackBar1: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  Edit1.Text:= IntToStr(TrackBar1.Position);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Self.Constraints.MinWidth:= Canvas.TextWidth('W') * 30;
  Self.AutoSize:= True;
  Edit1.ReadOnly:= True;
  Edit1.Constraints.MinWidth:= Canvas.TextWidth('00000');
  Edit1.MaxLength:= 3;
  TrackBar1.Min:= 0;
  TrackBar1.Max:= 100;
  TrackBar1.Frequency:= 10;
  TrackBar1Change(Sender);
end;

end.


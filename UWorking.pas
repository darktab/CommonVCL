unit UWorking;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects;

type
  TWorkingForm = class(TForm)
    WorkingPanel: TRectangle;
    GrayBox: TRectangle;
    WorkingLBL: TLabel;
    AniIndicator: TAniIndicator;
    bgImage: TImage;
    procedure FormCreate(Sender: TObject);
    procedure WorkingMsg(Text: String; Working: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TWorkingForm.FormCreate(Sender: TObject);
begin
{$IFDEF IOS}
  self.bgImage.Visible := False;
{$ENDIF}
end;

procedure TWorkingForm.WorkingMsg(Text: String; Working: Boolean);
begin
  if Working = True then
  begin
    Application.ProcessMessages;
    self.Show;
    self.AniIndicator.Enabled := True;
    self.WorkingLBL.Text := Text;
  end
  else
  begin
    self.AniIndicator.Enabled := False;
    self.WorkingLBL.Text := Text;
    self.Hide;

    // TabbedwithNavigationForm.Show;
  end;
end;

end.

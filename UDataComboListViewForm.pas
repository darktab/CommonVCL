unit UDataComboListViewForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView, UDataListView, FMX.ListBox, UDataComboBox;

type
  TDataComboListViewForm = class(TForm)
    TopToolBar: TToolBar;
    DataListView: TDataListView;
    TopPrevButton: TButton;
    TopNextButton: TButton;
    TopDataComboBox: TDataComboBox;
    procedure TopPrevButtonClick(Sender: TObject);
    procedure TopNextButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataComboListViewForm: TDataComboListViewForm;

procedure Register;

implementation

{$R *.fmx}

procedure Register;
begin
  RegisterComponents('Data Access', [TDataComboListViewForm]);
end;

procedure TDataComboListViewForm.TopNextButtonClick(Sender: TObject);
begin
  if TopDataComboBox.Items.Count > 1 then
  begin

    try
      TopDataComboBox.ItemIndex := TopDataComboBox.ItemIndex + 1;
    finally

    end;

  end;
end;

procedure TDataComboListViewForm.TopPrevButtonClick(Sender: TObject);
begin
  if TopDataComboBox.Items.Count > 1 then
  begin

    try
      TopDataComboBox.ItemIndex := TopDataComboBox.ItemIndex - 1;
    finally

    end;

  end;
end;

end.

unit UDataComboBox;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.ListBox,
  Data.DB;

type
  TDataComboBox = class(TComboBox)
  private
    { Private declarations }
    fDataSet: TDataSet;
    fDataFieldName: String;
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure init(lDataSet: TDataSet; lDataFieldName: string); overload;
    procedure init; overload;
    Constructor Create(AOwner: TComponent); override;

  published
    { Published declarations }
    Property DataSet: TDataSet read fDataSet write fDataSet;
    Property DataFieldName: String read fDataFieldName write fDataFieldName;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Data Access', [TDataComboBox]);
end;

procedure TDataComboBox.init;
var
  field: TField;
begin
  self.Clear;
  if not self.DataSet.Active then
    self.DataSet.Open;
  self.DataSet.First;
  while not self.DataSet.EOF do
  begin
    for field in self.DataSet.Fields do
    begin
      if field.FieldName = self.DataFieldName then
      begin
        self.Items.Add(self.DataSet.FieldByName(field.FieldName).AsString);
      end;
    end;
    self.DataSet.Next;
  end;

  // on se positionne sur le premier bouquet
  // et on retourne la référence
  self.ItemIndex := 0;
  self.DataSet.First;
end;

procedure TDataComboBox.init(lDataSet: TDataSet; lDataFieldName: string);
begin
  self.DataSet := lDataSet;
  self.DataFieldName := lDataFieldName;

  init;

end;

// Create a combobox
constructor TDataComboBox.Create(AOwner: TComponent);
begin
  // Execute the parent (TObject) constructor first
  inherited; // Call the parent Create method

  // init;

end;

end.

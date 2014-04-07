unit UDataListView;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.ListView,
  Data.DB;

type
  TDataListView = class(TListView)
  private
    { Private declarations }
    fDataSet: TDataSet;
    fDataFieldName: String;
    fDetailStringList: TStringList;
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure init(lDataSet: TDataSet; lDataFieldName: string); overload;
    procedure init(lDetailStringList: TStringList); overload;
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
  RegisterComponents('Data Access', [TDataListView]);
end;

procedure TDataListView.init(lDetailStringList: TStringList);
begin
  fDetailStringList := lDetailStringList;
  init;
end;

procedure TDataListView.init;
var
  item: TListViewItem;
  field: TField;
  detail: string;
begin
  self.ClearItems;
  if not self.DataSet.Active then
    self.DataSet.Open;
  self.DataSet.First;
  while not self.DataSet.EOF do
  begin
    item := self.Items.Add;
    for field in self.DataSet.Fields do
    begin
      if field.FieldName = self.DataFieldName then
      begin

        item.Text := self.DataSet.FieldByName(field.FieldName).AsString;
      end;
      if Assigned(fDetailStringList) then
      begin
        for detail in fDetailStringList do
        begin
          if field.FieldName = detail then
          begin
            item.detail := item.detail + ' ' + self.DataSet.FieldByName
              (field.FieldName).AsString;
          end;
        end;
      end;
    end;
    self.DataSet.Next;
  end;

  // on se positionne sur le premier bouquet
  // et on retourne la référence
  self.ItemIndex := 0;
  self.DataSet.First;
end;

procedure TDataListView.init(lDataSet: TDataSet; lDataFieldName: string);
begin
  self.DataSet := lDataSet;
  self.DataFieldName := lDataFieldName;

  init;

end;

// Create a ListView
constructor TDataListView.Create(AOwner: TComponent);
begin
  // Execute the parent (TObject) constructor first
  inherited; // Call the parent Create method

  // init;

end;

end.

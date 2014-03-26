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
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure init(lDataSet: TDataSet; lDataFieldName: string); overload;
    procedure init; overload;
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

procedure TDataListView.init;
var
  item: TListViewItem;
  field: TField;
begin
  self.ClearItems;
  if not self.DataSet.Active then
    self.DataSet.Open;
  self.DataSet.First;
  while not self.DataSet.EOF do
  begin
    for field in self.DataSet.Fields do
    begin
      if field.FieldName = self.DataFieldName then
      begin
        item := self.Items.Add;
        item.Text := self.DataSet.FieldByName(field.FieldName).AsString;
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

end.

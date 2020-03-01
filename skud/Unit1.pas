unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, IBX.IBDatabase,
  Vcl.Grids, Vcl.DBGrids, IBX.IBCustomDataSet, IBX.IBQuery, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, IniFiles;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    PageControl1: TPageControl;
    insert: TTabSheet;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    btnSend: TButton;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    TabSheet1: TTabSheet;
    ComboBox3: TComboBox;
    DateTimePicker2: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    Button2: TButton;
    Button3: TButton;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses dm, Unit2;

procedure TForm1.btnSendClick(Sender: TObject);
begin
  dm.DataModule2.IBQuery3.SQL.Clear;
  dm.DataModule2.IBQuery3.SQL.Text:='SELECT * FROM FB_USR WHERE FIO = :FIO';
  dm.DataModule2.IBQuery3.Params[0].Value:=ComboBox1.Text;
  dm.DataModule2.IBQuery3.Open;
  Label1.Caption:=dm.DataModule2.IBQuery3.FieldByName('ID').AsString;

  dm.DataModule2.IBQuery3.SQL.Clear;
  dm.DataModule2.IBQuery3.SQL.Text:='SELECT * FROM FB_KEY WHERE GUID = :ID';
  dm.DataModule2.IBQuery3.Params[0].Value:=Label1.Caption;
  dm.DataModule2.IBQuery3.Open;
  Label2.Caption:=dm.DataModule2.IBQuery3.FieldByName('ID').AsString;
  Label3.Caption:=dm.DataModule2.IBQuery3.FieldByName('INHEX').AsString;
  Label5.Caption:='0000'+Label3.Caption;

  dm.DataModule2.IBQuery3.SQL.Clear;
  dm.DataModule2.IBQuery3.SQL.Text:='SELECT * FROM FB_DVS WHERE NAME = :NAME';
  dm.DataModule2.IBQuery3.Params[0].Value:=ComboBox2.Text;
  dm.DataModule2.IBQuery3.Open;
  Label4.Caption:=dm.DataModule2.IBQuery3.FieldByName('ID').AsString;

  if (ComboBox1.ItemIndex = -1) or (ComboBox2.ItemHeight = -1) or (label1.Caption='') or (label4.Caption='') then
  begin
    ShowMessage('������� ������');
    exit;
  end;

  if not CheckBox1.Checked then
  begin
     with dm.DataModule2 do
      begin
        IBTransaction3.Active:=false;
        IBQuery3.SQL.Clear;
        IBQuery3.SQL.Add('insert into fb_evn (ID, DT, DVS, EVN, EVNH, UID, IDH, USR, EKEY, EKEYH)');
        IBQuery3.SQL.Add('values (null, :DT, :DVS, :EVN, :EVNH, :UID, :IDH, :USR, :EKEY, :EKEYH)');
        IBQuery3.Params.ParamByName('DT').Value:=MaskEdit1.Text;
        IBQuery3.Params.ParamByName('DVS').Value:=Label4.Caption;
        IBQuery3.Params.ParamByName('EVN').Value:=2;
        IBQuery3.Params.ParamByName('EVNH').Value:=0;
        IBQuery3.Params.ParamByName('UID').Value:=Label3.Caption;
        IBQuery3.Params.ParamByName('IDH').Value:=0;
        IBQuery3.Params.ParamByName('USR').Value:=Label1.Caption;
        IBQuery3.Params.ParamByName('EKEY').Value:=Label2.Caption;
        IBQuery3.Params.ParamByName('EKEYH').Value:=Label5.Caption;

        IBTransaction3.StartTransaction;
        IBQuery3.ExecSQL;
        IBTransaction3.Commit;
        IBTransaction3.Active:=false;

        IBTransaction3.Active:=false;
        IBQuery3.SQL.Clear;
        IBQuery3.SQL.Add('insert into fb_evn (ID, DT, DVS, EVN, EVNH, UID, IDH, USR, EKEY, EKEYH)');
        IBQuery3.SQL.Add('values (null, :DT, :DVS, :EVN, :EVNH, :UID, :IDH, :USR, :EKEY, :EKEYH)');
        IBQuery3.Params.ParamByName('DT').Value:=FormatDateTime( 'dd.mm.yy HH:mm:ss', StrtoDateTime(MaskEdit1.Text)+((Random(5)+1)/(24*3600)));
        IBQuery3.Params.ParamByName('DVS').Value:=Label4.Caption;
        IBQuery3.Params.ParamByName('EVN').Value:=3;
        IBQuery3.Params.ParamByName('EVNH').Value:=0;
        IBQuery3.Params.ParamByName('UID').Value:=Label3.Caption;
        IBQuery3.Params.ParamByName('IDH').Value:=0;
        IBQuery3.Params.ParamByName('USR').Value:=Label1.Caption;
        IBQuery3.Params.ParamByName('EKEY').Value:=Label2.Caption;
        IBQuery3.Params.ParamByName('EKEYH').Value:=Label5.Caption;

        IBTransaction3.StartTransaction;
        IBQuery3.ExecSQL;
        IBTransaction3.Commit;
        IBTransaction3.Active:=false;

        IBQuery1.Active:=false;
        IBQuery1.Active:=true;
        ShowMessage('������ ��!');
        //label1.Caption:='0000000000000';
      end;
  end
  else
  begin
    with dm.DataModule2 do
      begin
        IBTransaction3.Active:=false;
        IBQuery3.SQL.Clear;
        IBQuery3.SQL.Add('insert into fb_evn (ID, DT, DVS, EVN, EVNH, UID, IDH, USR, EKEY, EKEYH)');
        IBQuery3.SQL.Add('values (null, :DT, :DVS, :EVN, :EVNH, :UID, :IDH, :USR, :EKEY, :EKEYH)');
        IBQuery3.Params.ParamByName('DT').Value:=MaskEdit1.Text;
        IBQuery3.Params.ParamByName('DVS').Value:=Label4.Caption;
        IBQuery3.Params.ParamByName('EVN').Value:=4;
        IBQuery3.Params.ParamByName('EVNH').Value:=0;
        IBQuery3.Params.ParamByName('UID').Value:=Label3.Caption;
        IBQuery3.Params.ParamByName('IDH').Value:=0;
        IBQuery3.Params.ParamByName('USR').Value:=Label1.Caption;
        IBQuery3.Params.ParamByName('EKEY').Value:=Label2.Caption;
        IBQuery3.Params.ParamByName('EKEYH').Value:=Label5.Caption;

        IBTransaction3.StartTransaction;
        IBQuery3.ExecSQL;
        IBTransaction3.Commit;
        IBTransaction3.Active:=false;

        IBTransaction3.Active:=false;
        IBQuery3.SQL.Clear;
        IBQuery3.SQL.Add('insert into fb_evn (ID, DT, DVS, EVN, EVNH, UID, IDH, USR, EKEY, EKEYH)');
        IBQuery3.SQL.Add('values (null, :DT, :DVS, :EVN, :EVNH, :UID, :IDH, :USR, :EKEY, :EKEYH)');
        IBQuery3.Params.ParamByName('DT').Value:=FormatDateTime( 'dd.mm.yy HH:mm:ss', StrtoDateTime(MaskEdit1.Text)+((Random(5)+1)/(24*3600)));
        IBQuery3.Params.ParamByName('DVS').Value:=Label4.Caption;
        IBQuery3.Params.ParamByName('EVN').Value:=5;
        IBQuery3.Params.ParamByName('EVNH').Value:=0;
        IBQuery3.Params.ParamByName('UID').Value:=Label3.Caption;
        IBQuery3.Params.ParamByName('IDH').Value:=0;
        IBQuery3.Params.ParamByName('USR').Value:=Label1.Caption;
        IBQuery3.Params.ParamByName('EKEY').Value:=Label2.Caption;
        IBQuery3.Params.ParamByName('EKEYH').Value:=Label5.Caption;

        IBTransaction3.StartTransaction;
        IBQuery3.ExecSQL;
        IBTransaction3.Commit;
        IBTransaction3.Active:=false;

        IBQuery1.Active:=false;
        IBQuery1.Active:=true;
        ShowMessage('���� ��!');
        //label1.Caption:='0000000000000';
      end;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Label7.Caption = '' then
  begin
    ShowMessage('�������� ������');
    exit;
  end;
with dm.DataModule2 do
      begin
        IBTransaction3.Active:=false;
        IBQuery3.SQL.Clear;
        IBQuery3.SQL.Text:='update fb_evn set DT = :DT where ID = :ID';
        IBQuery3.Params.ParamByName('DT').Value:=MaskEdit2.Text;
        IBQuery3.Params.ParamByName('ID').Value:=Label7.Caption;


        IBTransaction3.StartTransaction;
        IBQuery3.ExecSQL;
        IBTransaction3.Commit;
        IBTransaction3.Active:=false;

        IBQuery1.Active:=false;
        IBQuery1.Active:=true;
        ShowMessage('������ ��������!');
      end;
label7.Caption:='';
Button2.Enabled:=false;
      Button3.Enabled:=false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if Label7.Caption = 'id' then
  begin
    ShowMessage('�������� ������');
    exit;
  end;
with dm.DataModule2 do
      begin
        IBTransaction3.Active:=false;
        IBQuery3.SQL.Clear;
        IBQuery3.SQL.Text:='delete from fb_evn where ID = :ID';
        IBQuery3.Params.ParamByName('ID').Value:=Label7.Caption;


        IBTransaction3.StartTransaction;
        IBQuery3.ExecSQL;
        IBTransaction3.Commit;
        IBTransaction3.Active:=false;

        IBQuery1.Active:=false;
        IBQuery1.Active:=true;
        ShowMessage('�������!');
      end;
      label7.Caption:='';
      Button2.Enabled:=false;
      Button3.Enabled:=false;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then panel1.Color:=rgb(255, 207, 207) else panel1.Color:=clWhite;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  dm.DataModule2.IBQuery3.SQL.Clear;
  dm.DataModule2.IBQuery3.SQL.Text:='SELECT * FROM FB_USR WHERE FIO = :FIO';
  dm.DataModule2.IBQuery3.Params[0].Value:=ComboBox1.Text;
  dm.DataModule2.IBQuery3.Open;
  Label1.Caption:=dm.DataModule2.IBQuery3.FieldByName('ID').AsString;

  dm.DataModule2.IBQuery3.SQL.Clear;
  dm.DataModule2.IBQuery3.SQL.Text:='SELECT * FROM FB_KEY WHERE GUID = :ID';
  dm.DataModule2.IBQuery3.Params[0].Value:=Label1.Caption;
  dm.DataModule2.IBQuery3.Open;
  Label2.Caption:=dm.DataModule2.IBQuery3.FieldByName('ID').AsString;
  Label3.Caption:=dm.DataModule2.IBQuery3.FieldByName('INHEX').AsString;
  Label5.Caption:='0000'+Label3.Caption;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  dm.DataModule2.IBQuery3.SQL.Clear;
  dm.DataModule2.IBQuery3.SQL.Text:='SELECT * FROM FB_DVS WHERE NAME = :NAME';
  dm.DataModule2.IBQuery3.Params[0].Value:=ComboBox2.Text;
  dm.DataModule2.IBQuery3.Open;
  Label4.Caption:=dm.DataModule2.IBQuery3.FieldByName('ID').AsString;
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
  dm.DataModule2.IBQuery3.SQL.Clear;
  dm.DataModule2.IBQuery3.SQL.Text:='SELECT * FROM FB_USR WHERE FIO = :FIO';
  dm.DataModule2.IBQuery3.Params[0].Value:=ComboBox3.Text;
  dm.DataModule2.IBQuery3.Open;
  Label6.Caption:=dm.DataModule2.IBQuery3.FieldByName('ID').AsString;

  with dm.DataModule2 do
      begin
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Text:='SELECT * FROM FB_EVN where DT >= :DT1 AND DT <=:DT2 and USR = :USR order by DT desc';
        IBQuery1.Params[0].Value:=FormatDateTime( 'dd.mm.yy 00:00:00', DateTimePicker2.DateTime);
        IBQuery1.Params[1].Value:=FormatDateTime( 'dd.mm.yy 23:59:59', DateTimePicker2.DateTime);
        IBQuery1.Params[2].Value:=Label6.Caption;
        IBQuery1.Open;
        IBTransaction1.Commit;
        IBTransaction1.Active:=false;
        IBQuery1.Active:=false;
        IBQuery1.Active:=true;
      end;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  Label7.Caption:=dm.DataModule2.IBQuery1.FieldByName('ID').AsString;
  MaskEdit2.Text:=FormatDateTime( 'dd.mm.yy HH:mm:ss', dm.DataModule2.IBQuery1.FieldByName('DT').AsDateTime);
  if Label7.Caption <> '' then begin Button2.Enabled:=true; Button3.Enabled:=true; end else begin Button2.Enabled:=false; Button3.Enabled:=false; end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  frmAut:=TfrmAut.Create(Application);
  if frmAut.ShowModal = mrOk then
  begin
    if  frmAut.Edit1.Text='Aa2013exc' then
    begin
      frmAut.Free;
    end
    else
    Application.Terminate;
  end
  else
  Application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
var FIniFile: TIniFile;
str: String;
begin
try
  FIniFile:= TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  try
  str :=  FIniFile.ReadString('Base', 'Path', '');
  dm.DataModule2.IBDatabase1.DatabaseName := str;
  finally
  FIniFile.Free;
  end;
  dm.DataModule2.IBDatabase1.Connected := true;
  except
   on E:Exception do
   begin
      ShowMessage('Error connect DB file =(');
      Halt;
   end;
end;

  MaskEdit1.Text:=FormatDateTime( 'dd.mm.yy hh:mm:ss', Now);

  dm.DataModule2.IBQuery1.Active:=true;
  ComboBox1.Items.Clear;
  dm.DataModule2.IBQuery3.SQL.Clear;
  dm.DataModule2.IBQuery3.SQL.Text:='SELECT FIO FROM FB_USR';
  dm.DataModule2.IBQuery3.Open;
  while not dm.DataModule2.IBQuery3.Eof do
      begin
        ComboBox1.Items.Add(dm.DataModule2.IBQuery3.Fields[0].AsString);
        dm.DataModule2.IBQuery3.Next;
      end;

  ComboBox2.Items.Clear;
  dm.DataModule2.IBQuery3.SQL.Clear;
  dm.DataModule2.IBQuery3.SQL.Text:='SELECT NAME FROM FB_DVS';
  dm.DataModule2.IBQuery3.Open;
  while not dm.DataModule2.IBQuery3.Eof do
      begin
        ComboBox2.Items.Add(dm.DataModule2.IBQuery3.Fields[0].AsString);
        dm.DataModule2.IBQuery3.Next;
      end;

  DateTimePicker2.DateTime:=Now;
  dm.DataModule2.IBQuery1.Active:=true;
  ComboBox3.Items.Clear;
  dm.DataModule2.IBQuery3.SQL.Clear;
  dm.DataModule2.IBQuery3.SQL.Text:='SELECT FIO FROM FB_USR';
  dm.DataModule2.IBQuery3.Open;
  while not dm.DataModule2.IBQuery3.Eof do
      begin
        ComboBox3.Items.Add(dm.DataModule2.IBQuery3.Fields[0].AsString);
        dm.DataModule2.IBQuery3.Next;
      end;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
with dm.DataModule2 do
      begin
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Text:='select * from FB_EVN order by DT desc';
        IBQuery1.Open;
        IBTransaction1.Commit;
        IBTransaction1.Active:=false;
        IBQuery1.Active:=false;
        IBQuery1.Active:=true;
      end;
end;

procedure TForm1.TabSheet1Show(Sender: TObject);
begin
  if label6.Caption<>'0000000000000' then

with dm.DataModule2 do
      begin
        IBQuery1.SQL.Clear;
        IBQuery1.SQL.Text:='SELECT * FROM FB_EVN where DT >= :DT1 AND DT <=:DT2 and USR = :USR order by DT desc';
        IBQuery1.Params[0].Value:=FormatDateTime( 'dd.mm.yy 00:00:00', DateTimePicker2.DateTime);
        IBQuery1.Params[1].Value:=FormatDateTime( 'dd.mm.yy 23:59:59', DateTimePicker2.DateTime);
        IBQuery1.Params[2].Value:=Label6.Caption;
        IBQuery1.Open;
        IBTransaction1.Commit;
        IBTransaction1.Active:=false;
        IBQuery1.Active:=false;
        IBQuery1.Active:=true;
      end;
end;

end.

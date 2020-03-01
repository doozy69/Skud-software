unit dm;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBDatabase, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TDataModule2 = class(TDataModule)
    DataSource1: TDataSource;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    IBQuery1ID: TLargeintField;
    IBQuery1DT: TDateTimeField;
    IBQuery1DVS: TIBStringField;
    IBQuery1EVN: TSmallintField;
    IBQuery1EVNH: TSmallintField;
    IBQuery1UID: TIBStringField;
    IBQuery1IDH: TLargeintField;
    IBQuery1USR: TLargeintField;
    IBQuery1EKEY: TLargeintField;
    IBQuery1EKEYH: TIBStringField;
    IBDatabase1: TIBDatabase;
    IBTransaction3: TIBTransaction;
    IBQuery3: TIBQuery;
    DataSource3: TDataSource;
    IBTransaction2: TIBTransaction;
    IBQuery2: TIBQuery;
    DataSource2: TDataSource;
    IBQuery2FIO: TIBStringField;
    IBQuery2ID: TLargeintField;
    IBQuery2TABNUM: TIBStringField;
    IBQuery2FNAME: TIBStringField;
    IBQuery2LNAME: TIBStringField;
    IBQuery2SNAME: TIBStringField;
    IBQuery2DOLZ: TLargeintField;
    IBQuery2PODR: TLargeintField;
    IBQuery2DOP1: TIBStringField;
    IBQuery2DOP2: TIBStringField;
    IBQuery2DOP3: TIBStringField;
    IBQuery2DOP4: TIBStringField;
    IBQuery2DIS: TSmallintField;
    IBQuery2FL: TSmallintField;
    IBQuery2GUEST: TSmallintField;
    IBQuery2FLAG1: TSmallintField;
    IBQuery2FLAG2: TSmallintField;
    IBQuery2WEB_LOGIN: TIBStringField;
    IBQuery2WEB_PASS: TIBStringField;
    IBQuery2PHT: TSmallintField;
    IBQuery2DIST_ACT: TSmallintField;
    IBQuery2DIST_DES: TIBStringField;
    IBQuery2DIST_DAT: TDateTimeField;
    IBQuery2BALANCE: TIBBCDField;
    IBQuery2PHONE: TIBStringField;
    IBQuery2EMAIL: TIBStringField;
    IBQuery1fio: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Unit1;

{$R *.dfm}

end.

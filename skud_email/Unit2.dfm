object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'DMAIL'
  ClientHeight = 566
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labUSRID: TLabel
    Left = 8
    Top = 552
    Width = 3
    Height = 13
  end
  object labUSR_DZ: TLabel
    Left = 335
    Top = 552
    Width = 3
    Height = 13
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 261
    Width = 497
    Height = 273
    DataSource = DataSource2
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid2CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'fio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USR_DZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_DZ'
        Visible = True
      end>
  end
  object cballUser: TComboBox
    Left = 0
    Top = 234
    Width = 416
    Height = 21
    TabOrder = 1
    Text = #1060#1048#1054
    OnChange = cballUserChange
  end
  object btnAddUser: TButton
    Left = 422
    Top = 230
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Enabled = False
    TabOrder = 2
    OnClick = btnAddUserClick
  end
  object btnDeleteUser: TButton
    Left = 422
    Top = 540
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = btnDeleteUserClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 497
    Height = 224
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 912
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 912
    Top = 80
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select first 1 * from FB_EVN where USR = 1563726871867 and dt > ' +
        'current_date order by DT desc')
    Left = 912
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 912
    Top = 192
  end
  object IdSMTP1: TIdSMTP
    Host = 'srv1.mrs.ru'
    Password = 'Absgwi1392647hDvnA'
    SASLMechanisms = <>
    Username = 'ok'
    Left = 912
    Top = 312
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CharSet = 'UTF-8'
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 912
    Top = 376
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 912
    Top = 512
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 832
    Top = 80
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM FB_DZ')
    Left = 832
    Top = 136
    object IBQuery2USR_DZ: TLargeintField
      FieldName = 'USR_DZ'
      Origin = '"FB_DZ"."USR_DZ"'
    end
    object IBQuery2DT_DZ: TDateTimeField
      FieldName = 'DT_DZ'
      Origin = '"FB_DZ"."DT_DZ"'
    end
    object IBQuery2fio: TStringField
      FieldKind = fkLookup
      FieldName = 'fio'
      LookupDataSet = IBQuery3
      LookupKeyFields = 'ID'
      LookupResultField = 'FIO'
      KeyFields = 'USR_DZ'
      Size = 40
      Lookup = True
    end
  end
  object DataSource2: TDataSource
    DataSet = IBQuery2
    Left = 832
    Top = 192
  end
  object DataSource3: TDataSource
    DataSet = IBQuery3
    Left = 752
    Top = 192
  end
  object IBQuery3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction3
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select *  from FB_USR')
    Left = 752
    Top = 136
  end
  object IBTransaction3: TIBTransaction
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 752
    Top = 80
  end
  object DataSource4: TDataSource
    DataSet = IBQuery4
    Left = 672
    Top = 192
  end
  object IBQuery4: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction4
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 672
    Top = 136
  end
  object IBTransaction4: TIBTransaction
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 672
    Top = 80
  end
  object IBQuery5: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction4
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 608
    Top = 136
  end
  object IBQuery6: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction6
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 552
    Top = 136
  end
  object IBTransaction5: TIBTransaction
    Left = 608
    Top = 80
  end
  object IBTransaction6: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 552
    Top = 80
  end
end

object frmAut: TfrmAut
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Authorization'
  ClientHeight = 132
  ClientWidth = 208
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 8
    Top = 56
    Width = 192
    Height = 21
    Alignment = taCenter
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 8
    Top = 80
    Width = 192
    Height = 25
    Caption = 'Button1'
    ModalResult = 1
    TabOrder = 1
    Visible = False
  end
end

program DE;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  dm in 'dm.pas' {DataModule2: TDataModule},
  Unit2 in 'Unit2.pas' {frmAut};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.

program GreenMessageAPI_Demo;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmGreenMessage},
  Api.Pc_msg_r001 in 'lib\Api.Pc_msg_r001.pas',
  GreenMessage in 'lib\GreenMessage.pas',
  GreenMessage.Structure in 'lib\GreenMessage.Structure.pas',
  Api.Green_msg_send in 'lib\Api.Green_msg_send.pas',
  Api.Pc_org_c001 in 'lib\Api.Pc_org_c001.pas',
  Api.Pc_org_s001 in 'lib\Api.Pc_org_s001.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGreenMessage, frmGreenMessage);
  Application.Run;
end.

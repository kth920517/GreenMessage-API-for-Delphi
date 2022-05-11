unit uMain;

interface

uses
  Winapi.Windows
, Winapi.Messages

, System.SysUtils
, System.Variants
, System.Classes

, Vcl.Graphics
, Vcl.Controls
, Vcl.Forms
, Vcl.Dialogs
, Vcl.StdCtrls
, Vcl.Grids
, Vcl.DBGrids

, Data.DB

, FireDAC.Stan.Intf
, FireDAC.Stan.Option
, FireDAC.Stan.Param
, FireDAC.Stan.Error
, FireDAC.DatS
, FireDAC.Phys.Intf
, FireDAC.DApt.Intf
, FireDAC.Comp.DataSet
, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ExtCtrls
;

type
  TfrmGreenMessage = class(TForm)
    btnOrgSearch: TButton;
    btnRegOrg: TButton;
    btnSendMsg: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnSendMsgSearch: TButton;
    FDMemTable1: TFDMemTable;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    edt1_SAUP_NO: TLabeledEdit;
    edt1_LOGIN_ID: TLabeledEdit;
    edt1_PTL_ID: TLabeledEdit;
    edt2_SAUP_NO: TLabeledEdit;
    edt2_PTL_ID: TLabeledEdit;
    edt2_USE_INTT_ID: TLabeledEdit;
    edt2_LOGIN_ID: TLabeledEdit;
    edt2_SAUM_NM: TLabeledEdit;
    edt2_CHNL_GB: TLabeledEdit;
    edt2_ORG_NM: TLabeledEdit;
    edt2_SEND_NM: TLabeledEdit;
    edt2_HP_NO: TLabeledEdit;
    edt2_PHOTO: TLabeledEdit;
    edt2_CHNL_ID: TLabeledEdit;
    Panel1: TPanel;
    edt3_SAUP_NO: TLabeledEdit;
    edt3_LINK_CD: TLabeledEdit;
    edt3_PHOTO: TLabeledEdit;
    edt3_ENCRYPT_GB: TLabeledEdit;
    edt3_LINK_NM: TLabeledEdit;
    edt3_SEND_NM: TLabeledEdit;
    edt3_MSG_TYPE: TLabeledEdit;
    edt3_LINK_URL: TLabeledEdit;
    edt3_SEND_IMG: TLabeledEdit;
    edt3_MSG_TXT: TLabeledEdit;
    edt3_HP_NO: TLabeledEdit;
    edt4_SAUP_NO: TLabeledEdit;
    edt4_SEND_TODT: TLabeledEdit;
    edt4_INQ_GB: TLabeledEdit;
    edt4_INQ_DATA: TLabeledEdit;
    edt4_SEND_FRDT: TLabeledEdit;
    edt3_CHNL_CODE: TLabeledEdit;
    edt3_SMS_TXT: TLabeledEdit;
    edt3_CNTS_CD: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOrgSearchClick(Sender: TObject);
    procedure btnRegOrgClick(Sender: TObject);
    procedure btnSendMsgClick(Sender: TObject);
    procedure btnSendMsgSearchClick(Sender: TObject);
  private
    { Private declarations }
    FUSER_ID: string;
  public
    { Public declarations }
  end;

var
  frmGreenMessage: TfrmGreenMessage;

implementation

uses
  GreenMessage.Structure
, Api.Pc_org_s001
, Api.Pc_org_c001
, Api.Pc_msg_r001
, Api.Green_msg_send
;

{$R *.dfm}

procedure TfrmGreenMessage.FormCreate(Sender: TObject);
begin
  FUSER_ID := '';
end;

procedure TfrmGreenMessage.btnOrgSearchClick(Sender: TObject);
var
  oContent: TGrnMsgContent;
begin
  oContent.Clear;

  //자동생성을 사용할 경우, 생성에 필요한 필수정보까지 추가 입력
  oContent.SAUP_NO := edt1_SAUP_NO.Text;
  oContent.LOGIN_ID := edt1_LOGIN_ID.Text;
  oContent.PTL_ID := edt1_PTL_ID.Text;

  with TPc_org_s001.Send(oContent{, True}) do begin
    if isSuccessful then begin
      FUSER_ID := Data.ORG_NO;
      ShowMessage(FUSER_ID);
    end else
      ShowMessage(ResultMessage);
  end;
end;

procedure TfrmGreenMessage.btnRegOrgClick(Sender: TObject);
var
  oContent: TGrnMsgContent;
begin
  oContent.Clear;
  oContent.SAUP_NO := edt2_SAUP_NO.Text;
  oContent.LOGIN_ID := edt2_LOGIN_ID.Text;
  oContent.ORG_NM := edt2_ORG_NM.Text;
  oContent.PTL_ID := edt2_PTL_ID.Text;
  oContent.SAUM_NM := edt2_SAUM_NM.Text;
  oContent.SEND_NM := edt2_SEND_NM.Text;
  oContent.CHNL_ID := edt2_CHNL_ID.Text;
  oContent.USE_INTT_ID := edt2_USE_INTT_ID.Text;
  oContent.CHNL_GB := edt2_CHNL_GB.Text;

  oContent.USER.Clear;
  oContent.USER.Count := 1;
  oContent.USER[0].HP_NO := edt2_HP_NO.Text;

  oContent.PHOTO.Clear;
  oContent.PHOTO.Count := 1;
  oContent.PHOTO[0] := edt2_PHOTO.Text;

  with TPc_org_c001.Send(oContent) do begin
    if isSuccessful then begin
      FUSER_ID := Data.USER_NO;
      ShowMessage(FUSER_ID);
    end else
      ShowMessage(ResultMessage);
  end;
end;

procedure TfrmGreenMessage.btnSendMsgClick(Sender: TObject);
var
  oContent: TGrnMsgContent;
begin
  if FUSER_ID.IsEmpty then
    Exit;

  oContent.Clear;
  oContent.USER_ID := FUSER_ID; //공통부 필수값

  oContent.SAUP_NO := edt3_SAUP_NO.Text;
  oContent.ENCRYPT_GB := edt3_ENCRYPT_GB.Text;
  oContent.MSG_TYPE := edt3_MSG_TYPE.Text;
  oContent.MSG_TXT := edt3_MSG_TXT.Text;
  oContent.LINK_CD := edt3_LINK_CD.Text;
  oContent.LINK_NM := edt3_LINK_NM.Text;
  oContent.LINK_URL := edt3_LINK_URL.Text;
  oContent.SEND_NM := edt3_SEND_NM.Text;
  oContent.SEND_IMG := edt3_SEND_IMG.Text;
  oContent.SMS_TXT := edt3_SMS_TXT.Text;
  oContent.CNTS_CD := edt3_CNTS_CD.Text;

  oContent.USER.Clear;
  oContent.USER.Count := 1;
  oContent.USER[0].HP_NO := edt3_HP_NO.Text;

  oContent.PHOTO.Clear;
  oContent.PHOTO.Count := 1;
  oContent.PHOTO[0] := edt3_PHOTO.Text;

  with TGreen_msg_send.Send(oContent) do begin
    if isSuccessful then
      ShowMessage(Data.MSG_NO)
    else
      ShowMessage(ResultMessage);
  end;
end;

procedure TfrmGreenMessage.btnSendMsgSearchClick(Sender: TObject);
var
  I: Integer;
  oContent: TGrnMsgContent;
begin
  if FUSER_ID.IsEmpty then
    Exit;

  oContent.Clear;
  oContent.USER_ID := FUSER_ID; //공통부 필수값

  oContent.SAUP_NO := edt4_SAUP_NO.Text;
  oContent.INQ_GB := edt4_INQ_GB.Text;
  oContent.INQ_DATA := edt4_INQ_DATA.Text;
  oContent.SEND_FRDT := edt4_SEND_FRDT.Text;
  oContent.SEND_TODT := edt4_SEND_TODT.Text;

  with TPc_msg_r001.Send(oContent) do begin
    if isSuccessful then begin
      FDMemTable1.DisableControls;
      try
        FDMemTable1.Close;
        FDMemTable1.FieldDefs.Clear;
        FDMemTable1.FieldDefs.Add('MSG_NO', ftWideString, 1000);
        FDMemTable1.FieldDefs.Add('MSG_TXT', ftWideString, 1000);
        FDMemTable1.CreateDataSet;

        for I := Low(Data.INQ_REC) to High(Data.INQ_REC) do begin
          FDMemTable1.Append;
          FDMemTable1.FieldByName('MSG_NO').AsString := Data.INQ_REC[I].MSG_NO;
          FDMemTable1.FieldByName('MSG_TXT').AsString := Data.INQ_REC[I].MSG_TXT;
          FDMemTable1.Post;
        end;
      finally
        FDMemTable1.EnableControls;
      end;
    end else
      ShowMessage(ResultMessage);
  end;
end;

end.

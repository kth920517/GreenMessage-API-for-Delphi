{******************************************************************************}
{                                                                              }
{                       GreenMessage API for Delphi                            }
{                                                                              }
{                       Copyright (C) TeakHyun Kang                            }
{                                                                              }
{                       https://github.com/kth920517                           }
{                       https://developist.tistory.com/                        }
{                                                                              }
{******************************************************************************}

unit Api.Green_msg_send;

interface

uses
  GreenMessage.Structure
, GreenMessage
;

type
  TGreen_msg_send = class(TGreenMessageAPI)
  const
    API_NAME = 'green_msg_send';
  type
    TUSER_REC = record
      HP_NO: string;
    end;

    TPHOTO_REC = record
      PHOTO: string;
    end;

    TREQ_DATA = record
      SAUP_NO: string;
      ENCRYPT_GB: string;
      MSG_TYPE: string;
      MSG_TXT: string;
      LINK_CD: string;
      LINK_NM: string;
      LINK_URL: string;
      USER_REC: TArray<TUSER_REC>;
      PHOTO_REC: TArray<TPHOTO_REC>;
      SEND_NM: string;
      SEND_IMG: string;
      CHNL_CODE: string;
      SMS_TXT: string;
      CNTS_CD: string;
    end;
    TRequest = TGreenMessageAPI.TCommonUserReq<TREQ_DATA>;

    TRESP_DATA = record
      TOT_CNT: string;
      GREEN_CNT: string;
      SMS_CNT: string;
      MSG_NO: string;
    end;
    TResponse = TGreenMessageAPI.TCommonRes<TRESP_DATA>;
  public
    class function Send(const AContent: TGrnMsgContent): TGrnMsgResult<TRESP_DATA>; overload;
  end;

implementation

uses
  System.SysUtils;

{ TGreen_msg_send }

class function TGreen_msg_send.Send(const AContent: TGrnMsgContent): TGrnMsgResult<TRESP_DATA>;
  function URLEncode(AStr: string): string;
  var
    I: Integer;
    sSrc: AnsiString;
  begin
    Result := '';

    sSrc := AnsiString(AStr);

    for I := 1 to Length(sSrc) do begin
      if not (sSrc[I] in ['A'..'Z', 'a'..'z', '0'..'9']) then
        Result := Result + '%' + IntToHex(Ord(sSrc[I]), 2)
      else
        Result := Result + sSrc[I];
    end;
  end;
var
  I: Integer;
  nCount: Integer;

  oRequest: TRequest;
  oResponse: TResponse;
begin
  Result.isSuccessful := False;
  Result.ResultCode := '';
  Result.ResultMessage := '';

  //공통
  oRequest.KEY := API_NAME;
  oRequest.SECR_KEY := SECR_KEY;
  oRequest.USER_ID := AContent.USER_ID;
  oRequest.APP_TYPE := AContent.APP_TYPE;
  oRequest.TR_TIME := FormatDateTime('YYYYMMDDhhnnss', Now);

  //REQ_DATA
  oRequest.REQ_DATA.SAUP_NO := AContent.SAUP_NO;

  //ENCRYPT_GB
  //0: 평문, 1: 암호화
  oRequest.REQ_DATA.ENCRYPT_GB := AContent.ENCRYPT_GB;

  //MSG_TYPE
  //0: 일반 텍스트, 1: 링크포함, 2: 콘텐츠메시지(별도신청)
  oRequest.REQ_DATA.MSG_TYPE := AContent.MSG_TYPE;
  oRequest.REQ_DATA.MSG_TXT := AContent.MSG_TXT;

  oRequest.REQ_DATA.LINK_CD := AContent.LINK_CD;
  oRequest.REQ_DATA.LINK_NM := AContent.LINK_NM;
  oRequest.REQ_DATA.LINK_URL := AContent.LINK_URL;

  oRequest.REQ_DATA.SEND_NM := AContent.SEND_NM;
  oRequest.REQ_DATA.SEND_IMG := AContent.SEND_IMG;

  oRequest.REQ_DATA.CHNL_CODE := AContent.CHNL_CODE; //고정값

  //별도신청 옵션
  oRequest.REQ_DATA.SMS_TXT := AContent.SMS_TXT;
  oRequest.REQ_DATA.CNTS_CD := AContent.CNTS_CD;

  try
    //받는 사람
    nCount := AContent.USER.Count;

    if nCount > 0 then begin
      SetLength(oRequest.REQ_DATA.USER_REC, nCount);

      for I := 0 to nCount - 1 do
        oRequest.REQ_DATA.USER_REC[I].HP_NO := AContent.USER[I].HP_NO;
    end else
    if nCount <= 0 then
      SetLength(oRequest.REQ_DATA.USER_REC, 1); //그린메시지에서 파싱 불가로 최소 1개

    //사진첨부
    nCount := AContent.PHOTO.Count;

    if nCount > 0 then begin
      SetLength(oRequest.REQ_DATA.PHOTO_REC, nCount);

      for I := 0 to nCount - 1 do
        oRequest.REQ_DATA.PHOTO_REC[I].PHOTO := URLEncode(AContent.PHOTO[I]);
    end else
    if nCount <= 0 then
      SetLength(oRequest.REQ_DATA.PHOTO_REC, 1); //그린메시지에서 파싱 불가로 최소 1개

    if Send<TRequest, TResponse>(oRequest, oResponse, rmPOST) then begin
      Result.isSuccessful := oResponse.RSLT_CD.Equals('0000');
      Result.ResultCode := oResponse.RSLT_CD;
      Result.ResultMessage := oResponse.RSLT_MSG;

      Result.Data := oResponse.RESP_DATA;
    end else
      raise Exception.Create(oResponse.RSLT_MSG);
  finally
    SetLength(oRequest.REQ_DATA.USER_REC, 0);
    SetLength(oRequest.REQ_DATA.PHOTO_REC, 0);
  end;
end;

end.

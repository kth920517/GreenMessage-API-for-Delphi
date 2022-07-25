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

unit Api.Pc_org_c001;

interface

uses
  GreenMessage.Structure
, GreenMessage
;

type
  TPc_org_c001 = class(TGreenMessageAPI)
  const
    API_NAME = 'pc_org_c001';
  type
    TREQ_DATA = record
      SAUP_NO: string;
      LOGIN_ID: string;
      ORG_NM: string;
      PHOTO: string;
      PTL_ID: string;
      SAUM_NM: string;
      SEND_NM: string;
      CHNL_ID: string;
      USE_INTT_ID: string;
      CHNL_GB: string;
      HP_NO: string;
    end;
    TRequest = TGreenMessageAPI.TCommonReq<TREQ_DATA>;

    TRESP_DATA = record
      USER_NO: string;
      USER_GB: string;
      REDIRECT_URL: string;
    end;
    TResponse = TGreenMessageAPI.TCommonRes<TRESP_DATA>;
  public
    class function Send(const AContent: TGrnMsgContent): TGrnMsgResult<TRESP_DATA>; overload;
  end;

implementation

uses
  System.SysUtils;

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

{ TPc_org_c001 }

class function TPc_org_c001.Send(const AContent: TGrnMsgContent): TGrnMsgResult<TRESP_DATA>;
var
  oRequest: TRequest;
  oResponse: TResponse;
begin
  Result.isSuccessful := False;
  Result.ResultCode := '';
  Result.ResultMessage := '';

  //공통
  oRequest.KEY := API_NAME;
  oRequest.SECR_KEY := SECR_KEY;
  oRequest.APP_TYPE := AContent.APP_TYPE;
  oRequest.TR_TIME := FormatDateTime('YYYYMMDDhhnnss', Now);

  //REQ_DATA
  oRequest.REQ_DATA.SAUP_NO := AContent.SAUP_NO;
  oRequest.REQ_DATA.LOGIN_ID := AContent.LOGIN_ID;
  oRequest.REQ_DATA.ORG_NM := AContent.ORG_NM;

  if AContent.PHOTO.Count > 0 then
    oRequest.REQ_DATA.PHOTO := URLEncode(AContent.PHOTO[0]) //그린메시지에서 파싱불가로 재인코딩
//    oRequest.REQ_DATA.PHOTO := AContent.PHOTO[0]
  else
    oRequest.REQ_DATA.PHOTO := '';

  oRequest.REQ_DATA.PTL_ID := AContent.PTL_ID;
  oRequest.REQ_DATA.SAUM_NM := AContent.SAUM_NM;
  oRequest.REQ_DATA.SEND_NM := AContent.SEND_NM;
  oRequest.REQ_DATA.CHNL_ID := AContent.CHNL_ID;
  oRequest.REQ_DATA.USE_INTT_ID := AContent.USE_INTT_ID;

  if oRequest.REQ_DATA.USE_INTT_ID.Length > 20 then
    raise Exception.Create('이용기관 ID는 20자리를 초과할 수 없습니다.');
//    oRequest.REQ_DATA.USE_INTT_ID := Copy(oRequest.REQ_DATA.USE_INTT_ID, 1, 20);

  oRequest.REQ_DATA.CHNL_GB := AContent.CHNL_GB;

  if AContent.USER.Count > 0 then
    oRequest.REQ_DATA.HP_NO := AContent.USER[0].HP_NO
  else
    oRequest.REQ_DATA.HP_NO := '';

  if Send<TRequest, TResponse>(oRequest, oResponse, rmPOST) then begin
    Result.isSuccessful := oResponse.RSLT_CD.Equals('0000');
    Result.ResultCode := oResponse.RSLT_CD;
    Result.ResultMessage := oResponse.RSLT_MSG;

    if Result.isSuccessful then
      Result.Data.USER_NO := oResponse.RESP_DATA.USER_NO;
  end;
end;

end.

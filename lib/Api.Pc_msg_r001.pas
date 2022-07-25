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

unit Api.Pc_msg_r001;

interface

uses
  GreenMessage.Structure
, GreenMessage
;

type
  TPc_msg_r001 = class(TGreenMessageAPI)
  const
    API_NAME = 'pc_msg_r001';
  type
    TREQ_DATA = record
      SAUP_NO: string;
      INQ_GB: string;
      INQ_DATA: string;
      SEND_FRDT: string;
      SEND_TODT: string;
    end;
    TRequest = TGreenMessageAPI.TCommonUserReq<TREQ_DATA>;

    TINQ_REC = record
      MSG_NO: string;
      REG_DT: string;
      REG_TM: string;
      TOT_CNT: string;
      MI_CNT: string;
      MSG_TXT: string;
      SEND_USER: string;
      SEND_NM: string;
      SAUP_NM: string;
      CHNL_CODE: string;
      SMS_CNT: string;
    end;

    TRESP_DATA = record
      INQ_REC: TArray<TINQ_REC>;
    end;
    TResponse = TGreenMessageAPI.TCommonRes<TRESP_DATA>;
  public
    class function Send(const AContent: TGrnMsgContent): TGrnMsgResult<TRESP_DATA>; overload;
  end;

implementation

uses
  System.SysUtils;

{ TPc_msg_r001 }

class function TPc_msg_r001.Send(const AContent: TGrnMsgContent): TGrnMsgResult<TRESP_DATA>;
var
  oRequest: TRequest;
  oResponse: TResponse;
begin
  Result.isSuccessful := False;
  Result.ResultCode := '';
  Result.ResultMessage := '';

  //°øÅë
  oRequest.KEY := API_NAME;
  oRequest.SECR_KEY := SECR_KEY;
  oRequest.USER_ID := AContent.USER_ID;
  oRequest.APP_TYPE := AContent.APP_TYPE;
  oRequest.TR_TIME := FormatDateTime('YYYYMMDDhhnnss', Now);

  //REQ_DATA
  oRequest.REQ_DATA.SAUP_NO := AContent.SAUP_NO;
  oRequest.REQ_DATA.INQ_GB := AContent.INQ_GB;
  oRequest.REQ_DATA.INQ_DATA := AContent.INQ_DATA;
  oRequest.REQ_DATA.SEND_FRDT := AContent.SEND_FRDT;
  oRequest.REQ_DATA.SEND_TODT := AContent.SEND_TODT;

  if Send<TRequest, TResponse>(oRequest, oResponse) then begin
    Result.isSuccessful := oResponse.RSLT_CD.Equals('0000');
    Result.ResultCode := oResponse.RSLT_CD;
    Result.ResultMessage := oResponse.RSLT_MSG;

    Result.Data := oResponse.RESP_DATA;
  end;
end;

end.

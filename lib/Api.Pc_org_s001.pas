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

unit Api.Pc_org_s001;

interface

uses
  GreenMessage.Structure
, GreenMessage
;

type
  TPc_org_s001 = class(TGreenMessageAPI)
  const
    API_NAME = 'pc_org_s001';
  type
    TREQ_DATA = record
      SAUP_NO: string;
      LOGIN_ID: string;
      PTL_ID: string;
    end;
    TRequest = TGreenMessageAPI.TCommonReq<TREQ_DATA>;

    TRESP_DATA = record
      ORG_NO: string;
      POPUP_URL: string;
    end;
    TResponse = TGreenMessageAPI.TCommonRes<TRESP_DATA>;
  public
    class function Send(const AContent: TGrnMsgContent; AutoCreate: Boolean = False): TGrnMsgResult<TRESP_DATA>; overload;
  end;

implementation

uses
  System.SysUtils

, Api.Pc_org_c001
;

{ TPc_org_s001 }

class function TPc_org_s001.Send(const AContent: TGrnMsgContent; AutoCreate: Boolean): TGrnMsgResult<TRESP_DATA>;
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
  oRequest.APP_TYPE := AContent.APP_TYPE;
  oRequest.TR_TIME := FormatDateTime('YYYYMMDDhhnnss', Now);

  //REQ_DATA
  oRequest.REQ_DATA.SAUP_NO := AContent.SAUP_NO;
  oRequest.REQ_DATA.LOGIN_ID := AContent.LOGIN_ID;
  oRequest.REQ_DATA.PTL_ID := AContent.PTL_ID;

  if Send<TRequest, TResponse>(oRequest, oResponse) then begin
    Result.isSuccessful := oResponse.RSLT_CD.Equals('0000');
    Result.ResultCode := oResponse.RSLT_CD;
    Result.ResultMessage := oResponse.RSLT_MSG;

    if Result.isSuccessful then
      Result.Data.ORG_NO := oResponse.RESP_DATA.ORG_NO
    else
    if AutoCreate and Result.ResultCode.Equals('0910') then begin
      with TPc_org_c001.Send(AContent) do begin
        if isSuccessful then begin
          Result.isSuccessful := isSuccessful;
          Result.ResultCode := ResultCode;
          Result.ResultMessage := ResultMessage;

          Result.Data.ORG_NO := Data.USER_NO;
        end;
      end;
    end;
  end else
    raise Exception.Create(oResponse.RSLT_MSG);
end;

end.

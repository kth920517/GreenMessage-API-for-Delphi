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

unit GreenMessage;

interface

type
  TGreenMessageAPI = class
  const
  {$IFDEF DEBUG}
    SECR_KEY = 'xxxx';
    GREEN_MESSAGE_URL = 'http://greenbox.wecambodia.com/api/v1';
  {$ELSE}
    SECR_KEY = 'xxxx';
    GREEN_MESSAGE_URL = 'https://gmessage.appplay.co.kr/api/v1';
  {$ENDIF}
  type
    TRestMethod = (rmGET, rmPOST, rmPATCH, rmPUT, rmDELETE);

    TCommonReq<TREQ_DATA> = record
      KEY: string;
      SECR_KEY: string;
      APP_TYPE: string;
      TR_TIME: string;
      REQ_DATA: TREQ_DATA;
    end;

    TCommonUserReq<TREQ_DATA> = record
      KEY: string;
      SECR_KEY: string;
      USER_ID: string;
      APP_TYPE: string;
      TR_TIME: string;
      REQ_DATA: TREQ_DATA;
    end;

    TCommonRes<TRESP_DATA> = record
      RSLT_CD: string;
      RSLT_MSG: string;
      RESP_DATA: TRESP_DATA;
    end;
  public
    class function Send<TRequest, TResponse>(
      const ARequest: TRequest; var AResponse: TResponse; const AMethod: TRestMethod = rmGET): Boolean; overload;
  end;

implementation

uses
  System.Classes
, System.SysUtils
, System.StrUtils
, System.Net.URLClient
, System.Json
, System.Json.Types
, System.JSON.Serializers

, Vcl.Dialogs

, IdHTTP
, IdSSL
, IdSSLOpenSSL
;

{ TGreenMessageAPI }

class function TGreenMessageAPI.Send<TRequest, TResponse>(
  const ARequest: TRequest; var AResponse: TResponse; const AMethod: TRestMethod): Boolean;
const
  ERROR_RESPONSE = '{"RSLT_MSG":"%s"}';
var
  sURL: string;
  sJSONData: string;

  IdHTTP: TIdHTTP;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;

  oRequestStream: TStringStream;
  oResponseStream: TStringStream;

  sResponse: string;
  sErrorMessage: string;
begin
  with TJsonSerializer.Create do begin
    try
      sJSONData := Serialize<TRequest>(ARequest).Replace('\\', '\');
    finally
      Free;
    end;
  end;

  oRequestStream := TStringStream.Create('', TEncoding.UTF8);
  oResponseStream := TStringStream.Create('', TEncoding.UTF8);

  try
    IdHTTP := TIdHTTP.Create(nil);
    IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

    try
      IdSSL.SSLOptions.SSLVersions := [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];

      IdHTTP.AllowCookies := True;
      IdHTTP.HandleRedirects := True;
//      IdHTTP.HTTPOptions := [hoForceEncodeParams];
      IdHTTP.IOHandler := IdSSL;

      IdHTTP.Request.Clear;
      IdHTTP.Request.CustomHeaders.Clear;

      IdHTTP.Request.UserAgent := 'Developist Communication Protocol';
      IdHTTP.Request.Accept := 'application/json';

      IdHTTP.Response.Clear;
      IdHTTP.Response.CustomHeaders.Clear;

      sResponse := '';
      sErrorMessage := '';

      try
        sURL := GREEN_MESSAGE_URL + '?JSONData=' + TURI.URLEncode(sJSONData);

        case AMethod of
          rmGET: begin
            IdHTTP.Request.ContentType := 'application/json;charset=UTF-8';
            IdHTTP.Get(sURL, oResponseStream);
          end;

          rmPOST: begin
            IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
            IdHTTP.Post(sURL, oRequestStream, oResponseStream);
          end;

          rmPATCH: ;
          rmPUT: ;
          rmDELETE: ;
        end;
      except
        on E: EIdHTTPProtocolException do begin
          sErrorMessage := E.ErrorMessage;
        end;

        on E: Exception do begin
          sErrorMessage := IfThen(
                             sErrorMessage.IsEmpty,
                             E.Message,
                             sErrorMessage + sLineBreak + E.Message
                           );
        end;
      end;

      sResponse := oResponseStream.DataString;

      if IdHTTP.Response.ResponseCode in [200..209] then begin

        with TJsonSerializer.Create do begin
          try
            AResponse := DeSerialize<TResponse>(sResponse);
          finally
            Free;
          end;
        end;

        Result := True;
      end else begin
        sResponse := IfThen(
                       sResponse.IsEmpty,
                       sErrorMessage,
                       sResponse + sLineBreak + sErrorMessage
                     );
        sResponse := sResponse.Replace('"', '\"');

        with TJsonSerializer.Create do begin
          try
            AResponse := DeSerialize<TResponse>(
              Format(ERROR_RESPONSE, [sResponse])
            );
          finally
            Free;
          end;
        end;
      end;
    finally
      if IdHTTP.Connected then
        IdHTTP.Disconnect;

      IdSSL.Free;
      IdHTTP.Free;
    end;

    oRequestStream.Clear;
    oResponseStream.Clear;
  finally
    oRequestStream.Free;
    oResponseStream.Free;
  end;
end;

end.

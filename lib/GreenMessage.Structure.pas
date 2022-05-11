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

unit GreenMessage.Structure;

interface

type
  TGrnMsgResult<T> = record
    isSuccessful: Boolean;
    ResultCode: string;
    ResultMessage: string;

    Data: T;
  end;

type
  TGrnMsgUser = record
    HP_NO: string;
  end;
  TGrnMsgUserList = TArray<TGrnMsgUser>;

  TGrnMsgUserListHelper = record helper for TGrnMsgUserList
  private
    procedure SetCount(const Value: Integer);
    function GetCount: Integer;
  public
    procedure Clear;
    property Count: Integer read GetCount write SetCount;
  end;

  TGrnMsgPhotoList = TArray<string>;

  TGrnMsgPhotoListHelper = record helper for TGrnMsgPhotoList
  private
    procedure SetCount(const Value: Integer);
    function GetCount: Integer;
  public
    procedure Clear;
    property Count: Integer read GetCount write SetCount;
  end;

  TGrnMsgContent = record
    APP_TYPE: string;
    SAUP_NO: string;
    SAUM_NM: string;
    ORG_NM: string;
    CHNL_ID: string;
    CHNL_GB: string;
    CHNL_CODE: string;
    PTL_ID: string;
    LOGIN_ID: string;
    USE_INTT_ID: string;
    USER_ID: string;
    ENCRYPT_GB: string;
    SEND_NM: string;
    SEND_IMG: string;
    MSG_TYPE: string;
    MSG_TXT: string;
    LINK_CD: string;
    LINK_NM: string;
    LINK_URL: string;
    SMS_TXT: string;
    CNTS_CD: string;
    INQ_GB: string;
    INQ_DATA: string;
    SEND_FRDT: string;
    SEND_TODT: string;

    USER: TGrnMsgUserList;
    PHOTO: TGrnMsgPhotoList;
  end;

  TGrnMsgContentHelper = record helper for TGrnMsgContent
    procedure Clear;
  end;

implementation

uses
  System.SysUtils
;

{ TGrnMsgUserListHelper }

procedure TGrnMsgUserListHelper.Clear;
begin
  SetLength(Self, 0);
end;

function TGrnMsgUserListHelper.GetCount: Integer;
begin
  Result := Length(Self);
end;

procedure TGrnMsgUserListHelper.SetCount(const Value: Integer);
begin
  SetLength(Self, Value);
end;

{ TGrnMsgPhotoListHelper }

procedure TGrnMsgPhotoListHelper.Clear;
begin
  SetLength(Self, 0);
end;

procedure TGrnMsgPhotoListHelper.SetCount(const Value: Integer);
begin
  SetLength(Self, Value);
end;

function TGrnMsgPhotoListHelper.GetCount: Integer;
begin
  Result := Length(Self);
end;

{ TGrnMsgContentHelper }

procedure TGrnMsgContentHelper.Clear;
begin
  Self.APP_TYPE := '0';
  Self.SAUP_NO := '';
  Self.SAUM_NM := '';
  Self.ORG_NM := '';
  Self.CHNL_ID := '';
  Self.CHNL_GB := '';
  Self.CHNL_CODE := '0001';
  Self.PTL_ID := '';
  Self.LOGIN_ID := '';
  Self.USE_INTT_ID := '';
  Self.USER_ID := '';
  Self.ENCRYPT_GB := '0';
  Self.SEND_NM := '';
  Self.SEND_IMG := '';
  Self.MSG_TYPE := '0';
  Self.MSG_TXT := '';
  Self.LINK_CD := '';
  Self.LINK_NM := '';
  Self.LINK_URL := '';
  Self.SMS_TXT := '';
  Self.CNTS_CD := '';
  Self.INQ_GB := '0';
  Self.INQ_DATA := '';
  Self.SEND_FRDT := '';
  Self.SEND_TODT := '';

  Self.PHOTO.Clear;
  Self.USER.Clear;
end;

end.

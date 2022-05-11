# GreenMessage API for Delphi

- ❗`GreenMessage.pas`의 **SECR_KEY**에 발급받은 **Key**로 교체 후 사용해주세요.
- 수십만건 전송 테스트 완료.

## API
- 기관정보 조회 - pc_org_s001
- 발신자 정보 등록 - pc_org_c001
- 메시지 발송 - green_msg_send
- 발송내역 조회 - pc_msg_r001

## Infomation
#### API Class function **Send**
- 전송 실패 시 raise

Result
- isSuccessful = 처리 결과 코드가 '0000'일 경우 True이고 나머지는 False
- ResultCode = 그린메시지의 처리 결과 코드
- ResultMessage = 그린메시지의 결과메시지
- Data = 그린메시지의 RESP_DATA와 동일
 
## Usage
Sample Code
1. `GreenMessage.Structure.pas`와 사용하려는 API의 `Api.~.Pas`를 Uses절에 추가.
2. 
```pascal
var
  Content: TGrnMsgContent;
begin
  Content.<Param> := <Value>;

  with <APIClass>.Send(Content) do begin
    if isSuccessful then begin
      ShowMessage(Data.<Param>);
    end else begin
      ShowMessage(ResultCode + ':' + ResultMessage);
    end;
  end;
end;
```

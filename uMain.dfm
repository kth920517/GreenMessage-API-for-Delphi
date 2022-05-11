object frmGreenMessage: TfrmGreenMessage
  Left = 0
  Top = 0
  Caption = 'GreenMessage API Demo'
  ClientHeight = 326
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 585
    Height = 326
    ActivePage = TabSheet3
    Align = alClient
    TabHeight = 50
    TabOrder = 0
    TabWidth = 100
    ExplicitHeight = 281
    object TabSheet1: TTabSheet
      Caption = #44592#44288#51221#48372' '#51312#54924
      object btnOrgSearch: TButton
        Left = 0
        Top = 217
        Width = 577
        Height = 49
        Align = alBottom
        Caption = #44592#44288#51221#48372' '#51312#54924
        TabOrder = 0
        OnClick = btnOrgSearchClick
        ExplicitLeft = 224
        ExplicitTop = 160
        ExplicitWidth = 137
      end
      object edt1_SAUP_NO: TLabeledEdit
        Left = 24
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = #49324#50629#51088#48264#54840
        TabOrder = 1
      end
      object edt1_LOGIN_ID: TLabeledEdit
        Left = 160
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = #51217#49549' '#50500#51060#46356
        TabOrder = 2
      end
      object edt1_PTL_ID: TLabeledEdit
        Left = 296
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = #54252#53560' '#50500#51060#46356
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = #48156#49888#51088' '#51221#48372' '#46321#47197
      ImageIndex = 1
      object btnRegOrg: TButton
        Left = 0
        Top = 217
        Width = 577
        Height = 49
        Align = alBottom
        Caption = #48156#49888#51088' '#51221#48372' '#46321#47197
        TabOrder = 0
        OnClick = btnRegOrgClick
        ExplicitLeft = 151
        ExplicitTop = 8
        ExplicitWidth = 137
      end
      object edt2_SAUP_NO: TLabeledEdit
        Left = 24
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = #49324#50629#51088#48264#54840
        TabOrder = 1
      end
      object edt2_PTL_ID: TLabeledEdit
        Left = 24
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = #54252#53560' '#50500#51060#46356
        TabOrder = 2
      end
      object edt2_USE_INTT_ID: TLabeledEdit
        Left = 24
        Top = 120
        Width = 121
        Height = 21
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = #51060#50857#44592#44288' ID'
        TabOrder = 3
      end
      object edt2_LOGIN_ID: TLabeledEdit
        Left = 160
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = #51217#49549' '#50500#51060#46356
        TabOrder = 4
      end
      object edt2_SAUM_NM: TLabeledEdit
        Left = 160
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 44
        EditLabel.Height = 13
        EditLabel.Caption = #49324#50629#51109#47749
        TabOrder = 5
      end
      object edt2_CHNL_GB: TLabeledEdit
        Left = 160
        Top = 120
        Width = 121
        Height = 21
        EditLabel.Width = 44
        EditLabel.Height = 13
        EditLabel.Caption = #52292#45328#44396#48516
        TabOrder = 6
      end
      object edt2_ORG_NM: TLabeledEdit
        Left = 296
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = #44592#44288#47749
        TabOrder = 7
      end
      object edt2_SEND_NM: TLabeledEdit
        Left = 296
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 44
        EditLabel.Height = 13
        EditLabel.Caption = #48156#49569#51088#47749
        TabOrder = 8
      end
      object edt2_HP_NO: TLabeledEdit
        Left = 296
        Top = 120
        Width = 121
        Height = 21
        EditLabel.Width = 77
        EditLabel.Height = 13
        EditLabel.Caption = #48156#49888#51088#51204#54868#48264#54840
        TabOrder = 9
      end
      object edt2_PHOTO: TLabeledEdit
        Left = 432
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = #45824#54364#51060#48120#51648
        TabOrder = 10
        TextHint = 'Base64 Encoding'
      end
      object edt2_CHNL_ID: TLabeledEdit
        Left = 432
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = #52292#45328' '#50500#51060#46356
        TabOrder = 11
      end
    end
    object TabSheet3: TTabSheet
      Caption = #47700#49884#51648' '#48156#49569
      ImageIndex = 2
      object btnSendMsg: TButton
        Left = 0
        Top = 217
        Width = 577
        Height = 49
        Align = alBottom
        Caption = #47700#49884#51648' '#48156#49569
        TabOrder = 0
        OnClick = btnSendMsgClick
        ExplicitLeft = 294
        ExplicitTop = 8
        ExplicitWidth = 137
      end
      object edt3_SAUP_NO: TLabeledEdit
        Left = 24
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = #49324#50629#51088#48264#54840
        TabOrder = 1
      end
      object edt3_LINK_CD: TLabeledEdit
        Left = 24
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 66
        EditLabel.Height = 13
        EditLabel.Caption = #50672#44208' APP'#53076#46300
        TabOrder = 2
      end
      object edt3_PHOTO: TLabeledEdit
        Left = 24
        Top = 120
        Width = 121
        Height = 21
        EditLabel.Width = 44
        EditLabel.Height = 13
        EditLabel.Caption = #52392#48512#49324#51652
        TabOrder = 3
      end
      object edt3_ENCRYPT_GB: TLabeledEdit
        Left = 160
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = #50516#54840#54868#44396#48516
        TabOrder = 4
      end
      object edt3_LINK_NM: TLabeledEdit
        Left = 160
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = #50672#44208' URL'#47749
        TabOrder = 5
      end
      object edt3_SEND_NM: TLabeledEdit
        Left = 160
        Top = 120
        Width = 121
        Height = 21
        EditLabel.Width = 44
        EditLabel.Height = 13
        EditLabel.Caption = #48156#49569#51088#47749
        TabOrder = 6
      end
      object edt3_MSG_TYPE: TLabeledEdit
        Left = 296
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = #47700#49884#51648#44396#48516
        TabOrder = 7
      end
      object edt3_LINK_URL: TLabeledEdit
        Left = 296
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 44
        EditLabel.Height = 13
        EditLabel.Caption = #50672#44208' URL'
        TabOrder = 8
      end
      object edt3_SEND_IMG: TLabeledEdit
        Left = 296
        Top = 120
        Width = 121
        Height = 21
        EditLabel.Width = 69
        EditLabel.Height = 13
        EditLabel.Caption = #48156#49569#51088' '#51060#48120#51648
        TabOrder = 9
      end
      object edt3_MSG_TXT: TLabeledEdit
        Left = 432
        Top = 40
        Width = 121
        Height = 21
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = #47700#49884#51648' '#45236#50857
        TabOrder = 10
      end
      object edt3_HP_NO: TLabeledEdit
        Left = 432
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 91
        EditLabel.Height = 13
        EditLabel.Caption = #49688#49888#51088' '#55092#45824#54256#48264#54840
        TabOrder = 11
      end
      object edt3_CHNL_CODE: TLabeledEdit
        Left = 432
        Top = 120
        Width = 121
        Height = 21
        EditLabel.Width = 66
        EditLabel.Height = 13
        EditLabel.Caption = #48156#49569#52292#45328#53076#46300
        TabOrder = 12
      end
      object edt3_SMS_TXT: TLabeledEdit
        Left = 24
        Top = 160
        Width = 121
        Height = 21
        EditLabel.Width = 67
        EditLabel.Height = 13
        EditLabel.Caption = 'SMS '#48320#54872#47928#44396
        TabOrder = 13
      end
      object edt3_CNTS_CD: TLabeledEdit
        Left = 160
        Top = 160
        Width = 121
        Height = 21
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = #53080#53584#52768' '#53076#46300
        TabOrder = 14
      end
    end
    object TabSheet4: TTabSheet
      Caption = #48156#49569#45236#50669' '#51312#54924
      ImageIndex = 3
      object btnSendMsgSearch: TButton
        Left = 0
        Top = 217
        Width = 577
        Height = 49
        Align = alBottom
        Caption = #48156#49569#45236#50669' '#51312#54924
        TabOrder = 0
        OnClick = btnSendMsgSearchClick
        ExplicitLeft = 213
        ExplicitTop = 8
        ExplicitWidth = 137
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 129
        Width = 577
        Height = 88
        Align = alClient
        DataSource = DataSource1
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 577
        Height = 129
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel1'
        ShowCaption = False
        TabOrder = 2
        object edt4_SAUP_NO: TLabeledEdit
          Left = 24
          Top = 40
          Width = 121
          Height = 21
          EditLabel.Width = 55
          EditLabel.Height = 13
          EditLabel.Caption = #49324#50629#51088#48264#54840
          TabOrder = 0
        end
        object edt4_SEND_TODT: TLabeledEdit
          Left = 160
          Top = 80
          Width = 121
          Height = 21
          EditLabel.Width = 55
          EditLabel.Height = 13
          EditLabel.Caption = #48156#49569#51333#47308#51068
          TabOrder = 1
          TextHint = 'YYYYMMDD'
        end
        object edt4_INQ_GB: TLabeledEdit
          Left = 160
          Top = 40
          Width = 121
          Height = 21
          EditLabel.Width = 44
          EditLabel.Height = 13
          EditLabel.Caption = #44160#49353#44396#48516
          TabOrder = 2
        end
        object edt4_INQ_DATA: TLabeledEdit
          Left = 296
          Top = 40
          Width = 121
          Height = 21
          EditLabel.Width = 44
          EditLabel.Height = 13
          EditLabel.Caption = #44160#49353#45236#50857
          TabOrder = 3
        end
        object edt4_SEND_FRDT: TLabeledEdit
          Left = 24
          Top = 80
          Width = 121
          Height = 21
          EditLabel.Width = 55
          EditLabel.Height = 13
          EditLabel.Caption = #48156#49569#49884#51089#51068
          TabOrder = 4
          TextHint = 'YYYYMMDD'
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 528
    Top = 8
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 456
    Top = 8
  end
end

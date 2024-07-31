object Form1: TForm1
  Left = 412
  Top = 126
  BorderStyle = bsSingle
  Caption = #1043#1088#1072#1092#1086#1041#1091#1076#1110#1074#1085#1080#1082
  ClientHeight = 401
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  WindowMenu = N1
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 16
    Top = 8
    Width = 657
    Height = 377
  end
  object PaintBox1: TPaintBox
    Left = 24
    Top = 16
    Width = 640
    Height = 360
    OnMouseDown = PaintBox1MouseDown
    OnMouseMove = PaintBox1MouseMove
    OnMouseUp = PaintBox1MouseUp
  end
  object Label1: TLabel
    Left = 32
    Top = 320
    Width = 43
    Height = 19
    Caption = 'Label1'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri Light'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Button1: TButton
    Left = 680
    Top = 248
    Width = 97
    Height = 25
    Caption = #1042#1080#1076#1072#1083#1080#1090#1080' '#1056#1077#1073#1088#1086
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 680
    Top = 184
    Width = 81
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 680
    Top = 216
    Width = 81
    Height = 21
    TabOrder = 2
  end
  object StaticText1: TStaticText
    Left = 680
    Top = 160
    Width = 80
    Height = 20
    Caption = #1050#1110#1085#1094#1110' '#1088#1077#1073#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Button2: TButton
    Left = -8
    Top = 184
    Width = 97
    Height = 65
    Caption = #1055#1086#1074#1077#1088#1085#1091#1090#1080#1089#1103' '#1076#1086' '#1088#1077#1078#1080#1084#1091' '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1075#1088#1072#1092#1091
    TabOrder = 4
    WordWrap = True
    OnClick = Button2Click
  end
  object RadioButton1: TRadioButton
    Left = 680
    Top = 104
    Width = 97
    Height = 17
    Caption = #1085#1077#1086#1088#1110#1108#1085#1090#1086#1074#1072#1085#1080#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 679
    Top = 128
    Width = 97
    Height = 17
    Caption = #1086#1088#1110#1108#1085#1090#1086#1074#1072#1085#1080#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = RadioButton2Click
  end
  object CheckBox1: TCheckBox
    Left = 680
    Top = 80
    Width = 97
    Height = 17
    Caption = #1047#1074#1072#1078#1077#1085#1080#1081
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = CheckBox1Click
  end
  object Button3: TButton
    Left = 680
    Top = 312
    Width = 89
    Height = 33
    Caption = #1047#1072#1076#1072#1090#1080' '#1074#1072#1075#1091' '#1088#1077#1073#1088#1072
    TabOrder = 8
    OnClick = Button3Click
  end
  object Edit3: TEdit
    Left = 680
    Top = 280
    Width = 81
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object MainMenu1: TMainMenu
    Left = 736
    Top = 8
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1053#1086#1074#1080#1081
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1042#1110#1076#1082#1088#1080#1090#1080
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1047#1073#1077#1088#1077#1075#1090#1080
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082
        OnClick = N5Click
      end
    end
    object N7: TMenuItem
      Caption = #1060#1086#1088#1084#1072#1090
      object N8: TMenuItem
        Caption = #1047#1084#1110#1085#1080#1090#1080' '#1086#1089#1085#1086#1074#1085#1080#1081' '#1082#1086#1083#1110#1088' '#1074#1077#1088#1096#1080#1085#1080
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1047#1084#1110#1085#1080#1090#1080' '#1082#1086#1083#1110#1088' '#1074#1080#1076#1110#1083#1077#1085#1085#1103' '#1074#1077#1088#1096#1080#1085#1080
        OnClick = N9Click
      end
    end
    object N6: TMenuItem
      Caption = #1044#1086#1074#1110#1076#1082#1072
      OnClick = N6Click
    end
    object N10: TMenuItem
      Caption = #1040#1085#1110#1084#1072#1094#1110#1111' '#1040#1083#1075#1086#1088#1080#1090#1084#1110#1074
      object N11: TMenuItem
        Caption = #1055#1086#1096#1091#1082' '#1074' '#1096#1080#1088#1080#1085#1091
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #1055#1086#1096#1091#1082' '#1074' '#1075#1083#1080#1073#1080#1085#1091
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #1055#1086#1096#1091#1082' '#1077#1081#1083#1077#1088#1086#1074#1086#1075#1086' '#1096#1083#1103#1093#1091
        OnClick = N13Click
      end
      object N14: TMenuItem
        Caption = #1058#1086#1087#1086#1083#1086#1075#1110#1095#1085#1077' '#1089#1086#1088#1090#1091#1074#1072#1085#1085#1103
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #1055#1086#1096#1091#1082' '#1084#1086#1089#1090#1110#1074
        OnClick = N15Click
      end
      object N16: TMenuItem
        Caption = #1040#1083#1075#1086#1088#1080#1090#1084' '#1044#1077#1081#1082#1089#1090#1088#1080
        OnClick = N16Click
      end
      object N17: TMenuItem
        Caption = #1040#1083#1075#1086#1088#1080#1090#1084' '#1050#1088#1072#1089#1082#1072#1083#1072' ('#1084#1110#1085#1110#1084#1072#1083#1100#1085#1077' '#1082#1110#1089#1090#1103#1082#1086#1074#1077' '#1076#1077#1088#1077#1074#1086')'
        OnClick = N17Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'grph'
    Filter = 'grph'
    Left = 712
    Top = 8
  end
  object OpenDialog1: TOpenDialog
    Filter = 'grph'
    Left = 680
    Top = 8
  end
  object ColorDialog1: TColorDialog
    Color = clLime
    CustomColors.Strings = (
      'ColorA=FFFFFFFF'
      'ColorB=FFFFFFFF'
      'ColorC=FFFFFFFF'
      'ColorD=FFFFFFFF'
      'ColorE=FFFFFFFF'
      'ColorF=FFFFFFFF'
      'ColorG=FFFFFFFF'
      'ColorH=FFFFFFFF'
      'ColorI=FFFFFFFF'
      'ColorJ=FFFFFFFF'
      'ColorK=FFFFFFFF'
      'ColorL=FFFFFFFF'
      'ColorM=FFFFFFFF'
      'ColorN=FFFFFFFF'
      'ColorO=FFFFFFFF'
      'ColorP=FFFFFFFF')
    Left = 680
    Top = 56
  end
  object Timer1: TTimer
    Interval = 300
    OnTimer = Timer1Timer
    Left = 720
    Top = 48
  end
end

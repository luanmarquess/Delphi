object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 213
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 44
    Height = 23
    Caption = 'Dolar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 36
    Height = 23
    Caption = 'Real'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object msg: TLabel
    Left = 24
    Top = 128
    Width = 1
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dolar: TEdit
    Left = 24
    Top = 37
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object converter: TButton
    Left = 163
    Top = 66
    Width = 75
    Height = 25
    Caption = 'Converter'
    TabOrder = 1
    OnClick = converterClick
  end
  object real: TEdit
    Left = 24
    Top = 93
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object comprar: TButton
    Left = 244
    Top = 66
    Width = 75
    Height = 25
    Caption = 'Comprar'
    Enabled = False
    TabOrder = 3
    OnClick = comprarClick
  end
end

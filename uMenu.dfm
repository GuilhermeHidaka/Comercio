object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlCentral: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 600
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object pnlButtons: TPanel
      Left = 16
      Top = 7
      Width = 73
      Height = 585
      BevelOuter = bvNone
      Color = clHighlight
      ParentBackground = False
      TabOrder = 0
    end
    object pnlLogo: TPanel
      Left = 120
      Top = 23
      Width = 657
      Height = 553
      BevelOuter = bvNone
      Color = cl3DLight
      ParentBackground = False
      TabOrder = 1
      object pnlTopCenter: TPanel
        Left = 0
        Top = 0
        Width = 657
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        Color = clNavy
        ParentBackground = False
        TabOrder = 0
      end
      object pnlTopFooter: TPanel
        Left = 0
        Top = 520
        Width = 657
        Height = 33
        Align = alBottom
        BevelOuter = bvNone
        Color = clNavy
        ParentBackground = False
        TabOrder = 1
      end
    end
  end
end

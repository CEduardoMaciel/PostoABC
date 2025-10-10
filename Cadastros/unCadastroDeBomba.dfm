object fmCadastroBomba: TfmCadastroBomba
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Bomba'
  ClientHeight = 169
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 66
    Top = 40
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label3: TLabel
    Left = 16
    Top = 99
    Width = 36
    Height = 13
    Caption = 'Tanque'
  end
  object edCodigoBomba: TMaskEdit
    Left = 18
    Top = 59
    Width = 46
    Height = 21
    MaxLength = 3
    TabOrder = 0
    OnKeyPress = AoPressionarEnterNoCampoCodigo
  end
  object edDescricaoBomba: TEdit
    Left = 70
    Top = 59
    Width = 309
    Height = 21
    Enabled = False
    MaxLength = 50
    TabOrder = 1
  end
  object btCancelar: TButton
    Left = 304
    Top = 114
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = Cancelar
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 34
    Align = alTop
    BorderStyle = bsSingle
    TabOrder = 4
    object Label4: TLabel
      Left = 66
      Top = 1
      Width = 76
      Height = 27
      Caption = 'Bomba'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object btExcluir: TButton
      Left = 327
      Top = 4
      Width = 58
      Height = 25
      Caption = 'Excluir'
      Enabled = False
      TabOrder = 0
      OnClick = Excluir
    end
    object btEditar: TButton
      Left = 263
      Top = 4
      Width = 58
      Height = 25
      Caption = 'Editar'
      Enabled = False
      TabOrder = 1
      OnClick = Editar
    end
    object btSalvar: TButton
      Left = 201
      Top = 4
      Width = 58
      Height = 25
      Caption = '&Salvar'
      Enabled = False
      TabOrder = 2
      OnClick = Salvar
    end
  end
  object lcTanques: TDBLookupComboBox
    Left = 18
    Top = 118
    Width = 280
    Height = 21
    KeyField = 'CODIGO_TANQUE'
    ListField = 'DESCRICAO'
    ListSource = dsTanquesBomba
    TabOrder = 2
  end
  object dsTanquesBomba: TDataSource
    Left = 240
    Top = 120
  end
end

object DM: TDM
  Height = 480
  Width = 640
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\Users\guiik\Desktop\Comercio\DB\COMERCIO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=fB')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object fbclient: TFDPhysFBDriverLink
    VendorLib = 'C:\Users\guiik\Desktop\Comercio\dlls\fbclient.dll'
    Left = 144
    Top = 40
  end
  object TabelaClientes: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Conexao
    SQL.Strings = (
      'select * from clientes'
      '')
    Left = 144
    Top = 144
    object TabelaClientesID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TabelaClientesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Size = 28
    end
    object TabelaClientesCPF_CLIENTE: TStringField
      FieldName = 'CPF_CLIENTE'
      Origin = 'CPF_CLIENTE'
    end
    object TabelaClientesNUMERO_CLIENTE: TStringField
      FieldName = 'NUMERO_CLIENTE'
      Origin = 'NUMERO_CLIENTE'
      Size = 18
    end
    object TabelaClientesCREDITO_CLIENTE: TSingleField
      FieldName = 'CREDITO_CLIENTE'
      Origin = 'CREDITO_CLIENTE'
    end
    object TabelaClientesCOINS_CLIENTE: TSingleField
      FieldName = 'COINS_CLIENTE'
      Origin = 'COINS_CLIENTE'
    end
  end
  object TabelaProdutos: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = Conexao
    SQL.Strings = (
      'select * from produtos'
      '')
    Left = 72
    Top = 112
    object TabelaProdutosCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TabelaProdutosNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME_PRODUTO'
      Size = 30
    end
    object TabelaProdutosCUSTO_PRODUTO: TSingleField
      FieldName = 'CUSTO_PRODUTO'
      Origin = 'CUSTO_PRODUTO'
    end
    object TabelaProdutosVENDA_PRODUTO: TSingleField
      FieldName = 'VENDA_PRODUTO'
      Origin = 'VENDA_PRODUTO'
    end
    object TabelaProdutosLUCRO_PRODUTO: TSingleField
      FieldName = 'LUCRO_PRODUTO'
      Origin = 'LUCRO_PRODUTO'
    end
    object TabelaProdutosESTOQUE_PRODUTO: TIntegerField
      FieldName = 'ESTOQUE_PRODUTO'
      Origin = 'ESTOQUE_PRODUTO'
    end
  end
end

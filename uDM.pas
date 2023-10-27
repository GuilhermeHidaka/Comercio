unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    fbclient: TFDPhysFBDriverLink;
    TabelaClientes: TFDQuery;
    TabelaProdutos: TFDQuery;
    TabelaProdutosCOD_PRODUTO: TIntegerField;
    TabelaProdutosNOME_PRODUTO: TStringField;
    TabelaProdutosCUSTO_PRODUTO: TSingleField;
    TabelaProdutosVENDA_PRODUTO: TSingleField;
    TabelaProdutosLUCRO_PRODUTO: TSingleField;
    TabelaProdutosESTOQUE_PRODUTO: TIntegerField;
    TabelaClientesID_CLIENTE: TIntegerField;
    TabelaClientesNOME_CLIENTE: TStringField;
    TabelaClientesCPF_CLIENTE: TStringField;
    TabelaClientesNUMERO_CLIENTE: TStringField;
    TabelaClientesCREDITO_CLIENTE: TSingleField;
    TabelaClientesCOINS_CLIENTE: TSingleField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

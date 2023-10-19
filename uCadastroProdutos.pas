unit uCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadastroProdutos = class(TForm)
    pnlCenter: TPanel;
    pnlMidTop: TPanel;
    pnlTop2: TPanel;
    btnFinalizar: TSpeedButton;
    pnlMidFooter: TPanel;
    lblNomeTela: TLabel;
    btnHome: TBitBtn;
    pnlMid: TPanel;
    pnlButtons: TPanel;
    btnSalvar: TBitBtn;
    btnIncluir: TBitBtn;
    btnModificar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    pnlDados: TPanel;
    pnlProCod: TPanel;
    pnlDescricaoProduto: TPanel;
    pnlCusto: TPanel;
    pnlVenda: TPanel;
    ConexaoProdutos: TFDConnection;
    TabelaProdutos: TFDQuery;
    dsProdutos: TDataSource;
    fbClient: TFDPhysFBDriverLink;
    lblCodigo: TLabel;
    edtdbCodigoProduto: TDBEdit;
    lblDescricao: TLabel;
    edtdbDescricaoProduto: TDBEdit;
    lblCusto: TLabel;
    lblVenda: TLabel;
    edtdbCusto: TDBEdit;
    edtdbVenda: TDBEdit;
    pnlLucro: TPanel;
    pnlEstoque: TPanel;
    lblEstoque: TLabel;
    edtdbEstoque: TDBEdit;
    lblLucro: TLabel;
    edtdbLucro: TDBEdit;
    TabelaProdutosCOD_PRODUTO: TIntegerField;
    TabelaProdutosNOME_PRODUTO: TStringField;
    TabelaProdutosCUSTO_PRODUTO: TSingleField;
    TabelaProdutosVENDA_PRODUTO: TSingleField;
    TabelaProdutosLUCRO_PRODUTO: TSingleField;
    TabelaProdutosESTOQUE_PRODUTO: TIntegerField;
    DBNavigator1: TDBNavigator;
    dbGridProdutos: TDBGrid;
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure edtdbCustoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProdutos: TfrmCadastroProdutos;

implementation

{$R *.dfm}

uses uCadastro, uCadastroClientes;

procedure TfrmCadastroProdutos.btnFinalizarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmCadastroProdutos.btnHomeClick(Sender: TObject);
begin
  frmCadastroProdutos.Hide;
  frmCadastro.Show;
end;

procedure TfrmCadastroProdutos.edtdbCustoChange(Sender: TObject);
//var
 // n: Double;
begin
  (* n := StrToFloat(edt1.Text);
    n := n / StrToFloat(edt2.Text);
    edt3.Text := FloatToStr(n);
  n := StrToFloat(edtdbVenda.Text);
  n := n - StrToFloat(edtdbCusto.Text);
  edtdbLucro.Text := FloatToStr(n);

  // Venda-Custo=lucro   *)
end;

end.

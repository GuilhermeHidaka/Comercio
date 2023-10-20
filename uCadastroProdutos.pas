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
    dbGridProdutos: TDBGrid;
    btnCalcLucro: TButton;
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure btnCalcLucroClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtdbDescricaoProdutoChange(Sender: TObject);
    procedure dbGridProdutosCellClick(Column: TColumn);
    procedure edtdbEstoqueChange(Sender: TObject);
    procedure edtdbCustoChange(Sender: TObject);
    procedure edtdbVendaChange(Sender: TObject);
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

procedure TfrmCadastroProdutos.btnCalcLucroClick(Sender: TObject);
var
  n: double;
begin
  if (edtdbCusto.Text = '') or (edtdbVenda.Text = '') then
    MessageDlg('Os campos Custo e Venda devem estar preenchidos', mtError,
      [TMsgDlgBtn.mbOK], 0)
  else if (edtdbCusto.Text <> '') and (edtdbVenda.Text <> '') then
    n := StrToFloat(edtdbVenda.Text);
  n := n - StrToFloat(edtdbCusto.Text);
  edtdbLucro.Text := FloatToStr(n);

end;

procedure TfrmCadastroProdutos.btnCancelarClick(Sender: TObject);
begin
  TabelaProdutos.Cancel;
  btnIncluir.Enabled := False;
  edtdbDescricaoProduto.Enabled := False;
  edtdbEstoque.Enabled := False;
  edtdbCusto.Enabled := False;
  edtdbVenda.Enabled := False;
  btnIncluir.Enabled := True;

  // Utilizando fun��o Qry.Cancel para cancelar o registro que estejasendo inserido por�m n�o gravado
end;

procedure TfrmCadastroProdutos.btnExcluirClick(Sender: TObject);
begin
  TabelaProdutos.Delete;
  // Utilizando fun��o Qry.Delete para excluir determinado registro setado no RowSelect ou o pr�ximo do dbGrid
end;

procedure TfrmCadastroProdutos.btnFinalizarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmCadastroProdutos.btnHomeClick(Sender: TObject);
begin
  frmCadastroProdutos.Hide;
  frmCadastro.Show;
end;

procedure TfrmCadastroProdutos.btnIncluirClick(Sender: TObject);
begin
  TabelaProdutos.Insert;
  btnIncluir.Enabled := False;
  // btnSalvar.Enabled:=True;
  edtdbDescricaoProduto.Enabled := True;
  edtdbEstoque.Enabled := True;
  edtdbCusto.Enabled := True;
  edtdbVenda.Enabled := True;
  // Libera��o dos campos para inser��o de valor apenas ap�s apertar o bot�o de incluir (btnIncluir)
  dbGridProdutos.Enabled:=False;
  //N�o permite clicar no dbgrid ativando o clear para os camps edtDB enquanto n�o clicar no bot�o btnSalvar

end;

procedure TfrmCadastroProdutos.btnModificarClick(Sender: TObject);
begin
  TabelaProdutos.Edit;
  // utilizando fun��o Qry.Edit para editar registro j� salvo pela fun��o Qry.Post
  //teste
end;

procedure TfrmCadastroProdutos.btnSalvarClick(Sender: TObject);
begin
  TabelaProdutos.Post;
  ConexaoProdutos.Commit;
  // para gravar no banco de dados todos os registros da Qry (TabelaClientes)
  btnIncluir.Enabled := True;
  btnSalvar.Enabled := False;
  // Voltar enabled incluir
  edtdbDescricaoProduto.Enabled := False;
  edtdbEstoque.Enabled := False;
  edtdbCusto.Enabled := False;
  edtdbVenda.Enabled := False;
  // Voltar Enabled padr�o de n�o inclus�o ou altera��o
  dbGridProdutos.Enabled:=True;
  //Volta condi��o do clique em celular do dbGrid
end;

procedure TfrmCadastroProdutos.dbGridProdutosCellClick(Column: TColumn);
begin
      edtdbDescricaoProduto.Text := '';
      edtdbEstoque.Text := '';
      edtdbCusto.Text := '';
      edtdbVenda.Text := '';
      edtdbLucro.Text := '';
      //tentando

end;

procedure TfrmCadastroProdutos.edtdbCustoChange(Sender: TObject);
begin
  if (edtdbDescricaoProduto.Text <> '') and (edtdbEstoque.Text <> '') and
    (edtdbCusto.Text <> '') and (edtdbVenda.Text <> '') then
    btnSalvar.Enabled := True;
  if (edtdbDescricaoProduto.Text = '') or (edtdbEstoque.Text = '') or
    (edtdbCusto.Text = '') or (edtdbVenda.Text = '') then
    btnSalvar.Enabled := False;
    //A cada mudan�a de campo no clique, verifica se todos j� foram preenchidos para validar a libera��o do bot�o salvar.
end;

procedure TfrmCadastroProdutos.edtdbDescricaoProdutoChange(Sender: TObject);
begin
  if (edtdbDescricaoProduto.Text <> '') and (edtdbEstoque.Text <> '') and
    (edtdbCusto.Text <> '') and (edtdbVenda.Text <> '') then
    btnSalvar.Enabled := True;
  if (edtdbDescricaoProduto.Text = '') or (edtdbEstoque.Text = '') or
    (edtdbCusto.Text = '') or (edtdbVenda.Text = '') then
    btnSalvar.Enabled := False;
end;

procedure TfrmCadastroProdutos.edtdbEstoqueChange(Sender: TObject);
begin
  if (edtdbDescricaoProduto.Text <> '') and (edtdbEstoque.Text <> '') and
    (edtdbCusto.Text <> '') and (edtdbVenda.Text <> '') then
    btnSalvar.Enabled := True;
  if (edtdbDescricaoProduto.Text = '') or (edtdbEstoque.Text = '') or
    (edtdbCusto.Text = '') or (edtdbVenda.Text = '') then
    btnSalvar.Enabled := False;
end;

procedure TfrmCadastroProdutos.edtdbVendaChange(Sender: TObject);
begin
  if (edtdbDescricaoProduto.Text <> '') and (edtdbEstoque.Text <> '') and
    (edtdbCusto.Text <> '') and (edtdbVenda.Text <> '') then
    btnSalvar.Enabled := True;
  if (edtdbDescricaoProduto.Text = '') or (edtdbEstoque.Text = '') or
    (edtdbCusto.Text = '') or (edtdbVenda.Text = '') then
    btnSalvar.Enabled := False;
end;

procedure TfrmCadastroProdutos.FormCreate(Sender: TObject);
begin
  edtdbCodigoProduto.Enabled := False;
  ConexaoProdutos.Connected := True;
  TabelaProdutos.Open();
  btnSalvar.Enabled := False;

  edtdbDescricaoProduto.Enabled := False;
  edtdbEstoque.Enabled := False;
  edtdbCusto.Enabled := False;
  edtdbVenda.Enabled := False;
  // n�o permitir inser��o sem clicar no bot�o de adicionar
  //.
end;

end.

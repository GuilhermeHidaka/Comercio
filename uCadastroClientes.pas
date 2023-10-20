unit uCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.IBBase, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadastroClientes = class(TForm)
    pnlCenter: TPanel;
    pnlMidTop: TPanel;
    pnlTop2: TPanel;
    btnFinalizar: TSpeedButton;
    pnlMidFooter: TPanel;
    lblNomeTela: TLabel;
    btnHome: TBitBtn;
    pnlMid: TPanel;
    ConexaoClientes: TFDConnection;
    TabelaClientes: TFDQuery;
    dsClientes: TDataSource;
    fbClient: TFDPhysFBDriverLink;
    TabelaClientesID_CLIENTE: TIntegerField;
    TabelaClientesNOME_CLIENTE: TStringField;
    TabelaClientesCPF_CLIENTE: TStringField;
    TabelaClientesNUMERO_CLIENTE: TStringField;
    TabelaClientesCREDITO_CLIENTE: TSingleField;
    TabelaClientesCOINS_CLIENTE: TSingleField;
    pnlDadosClientes: TPanel;
    pnlLDados: TPanel;
    pnlRDados: TPanel;
    DBEdit5: TDBEdit;
    pnlDadosNome: TPanel;
    pnlDadosCPF: TPanel;
    edtdbNome: TDBEdit;
    edtdbCPF: TDBEdit;
    lblNome: TLabel;
    lblCPF: TLabel;
    pnlDadosCelularCredito: TPanel;
    lblCelular: TLabel;
    pnlDadosCredito: TPanel;
    lblCredito: TLabel;
    edtdbCredito: TDBEdit;
    edtdbCelular: TDBEdit;
    pnlDBGrid: TPanel;
    DBgridClientes: TDBGrid;
    lblBuscar: TLabel;
    edtBuscar: TEdit;
    pnlButtons: TPanel;
    btnSalvar: TBitBtn;
    btnIncluir: TBitBtn;
    btnModificar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure edtdbNomeChange(Sender: TObject);
    procedure edtdbCPFChange(Sender: TObject);
    procedure edtdbCelularChange(Sender: TObject);
    procedure edtdbCreditoChange(Sender: TObject);
    procedure DBgridClientesCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

{$R *.dfm}

uses uCadastro, uCadastroProdutos;

procedure TfrmCadastroClientes.btnCancelarClick(Sender: TObject);
begin
TabelaClientes.Cancel;
DBgridClientes.Enabled:=True;
btnIncluir.Enabled:=False;
edtdbNome.Enabled:=False;
edtdbCPF.Enabled:=False;
edtdbCelular.Enabled:=False;
edtdbCredito.Enabled:=False;
btnIncluir.Enabled:=True;
//Utilizando fun��o Qry.Cancel para cancelar o registro que estejasendo inserido por�m n�o gravado
btnSalvar.Enabled:=False;
btnExcluir.Enabled:=True;
end;

procedure TfrmCadastroClientes.btnExcluirClick(Sender: TObject);
begin
TabelaClientes.Delete;
//Utilizando fun��o Qry.Delete para excluir determinado registro setado no RowSelect ou o pr�ximo do dbGrid
end;

procedure TfrmCadastroClientes.btnFinalizarClick(Sender: TObject);
begin
Application.Terminate;
//Finaliza aplica��o
end;

procedure TfrmCadastroClientes.btnHomeClick(Sender: TObject);
begin
frmCadastroClientes.Hide;
frmCadastro.Show;
//Troca de janelas, fechando uma e abrindo outra
end;

procedure TfrmCadastroClientes.btnIncluirClick(Sender: TObject);
begin
btnExcluir.Enabled:=False;
TabelaClientes.Insert;
btnIncluir.Enabled:=False;
//btnSalvar.Enabled:=True;
edtdbNome.Enabled:=True;
edtdbCPF.Enabled:=True;
edtdbCelular.Enabled:=True;
edtdbCredito.Enabled:=True;
//Libera��o dos campos para inser��o de valor apenas ap�s apertar o bot�o de incluir (btnIncluir)7
DBgridClientes.Enabled:=False;
//quando estiver inserindo ser� imposs�vel clicar no grid e apagar todos os campos
end;

procedure TfrmCadastroClientes.btnModificarClick(Sender: TObject);
begin
btnIncluir.Enabled:=False;
TabelaClientes.Edit;
edtdbNome.Enabled:=True;
edtdbCPF.Enabled:=True;
edtdbCelular.Enabled:=True;
edtdbCredito.Enabled:=True;
btnExcluir.Enabled:=False;
btnSalvar.Enabled:=True;
//utilizando fun��o Qry.Edit para editar registro j� salvo pela fun��o Qry.Post
end;

procedure TfrmCadastroClientes.btnSalvarClick(Sender: TObject);
begin
TabelaClientes.Post;
ConexaoClientes.Commit;
//para gravar no banco de dados todos os registros da Qry (TabelaClientes)
btnIncluir.Enabled:=True;
btnSalvar.Enabled:=False;
//Voltar enabled incluir
edtdbNome.Enabled:=False;
edtdbCPF.Enabled:=False;
edtdbCelular.Enabled:=False;
edtdbCredito.Enabled:=False;
//Voltar Enabled padr�o de n�o inclus�o ou altera��o
dbGridClientes.Enabled:=True;
btnExcluir.Enabled:=True;
end;





procedure TfrmCadastroClientes.DBgridClientesCellClick(Column: TColumn);
begin
edtdbNome.Text:='';
edtdbCPF.Text:='';
edtdbCredito.Text:='';
edtdbCelular.Text:='';
end;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TfrmCadastroClientes.edtBuscarChange(Sender: TObject);
begin
TabelaClientes.Locate('NOME_CLIENTE',edtBuscar.Text,[loPartialKey,loCaseInsensitive]);
//Qry.Locate('COLUNA',componente.propriedade,[loPartialKey,loCaseInsensitive]);
//loCaseInsensitive %consulta
end;

procedure TfrmCadastroClientes.edtdbCelularChange(Sender: TObject);
begin
if (edtdbNome.Text<>'') and (edtdbCPF.Text<>'') and (edtdbCelular.Text<>'') and (edtdbCredito.Text<>'') then
btnSalvar.Enabled:=True;
if (edtdbNome.Text='') or (edtdbCPF.Text='') or (edtdbCelular.Text='') or (edtdbCredito.Text='') then
btnSalvar.Enabled:=False;
end;


procedure TfrmCadastroClientes.edtdbCPFChange(Sender: TObject);
begin
if (edtdbNome.Text<>'') and (edtdbCPF.Text<>'') and (edtdbCelular.Text<>'') and (edtdbCredito.Text<>'') then
btnSalvar.Enabled:=True;
if (edtdbNome.Text='') or (edtdbCPF.Text='') or (edtdbCelular.Text='') or (edtdbCredito.Text='') then
btnSalvar.Enabled:=False;
end;


procedure TfrmCadastroClientes.edtdbCreditoChange(Sender: TObject);
begin
if (edtdbNome.Text<>'') and (edtdbCPF.Text<>'') and (edtdbCelular.Text<>'') and (edtdbCredito.Text<>'') then
btnSalvar.Enabled:=True;
if (edtdbNome.Text='') or (edtdbCPF.Text='') or (edtdbCelular.Text='') or (edtdbCredito.Text='') then
btnSalvar.Enabled:=False;
end;


procedure TfrmCadastroClientes.edtdbNomeChange(Sender: TObject);
begin
if (edtdbNome.Text<>'') and (edtdbCPF.Text<>'') and (edtdbCelular.Text<>'') and (edtdbCredito.Text<>'') then
btnSalvar.Enabled:=True;
if (edtdbNome.Text='') or (edtdbCPF.Text='') or (edtdbCelular.Text='') or (edtdbCredito.Text='') then
btnSalvar.Enabled:=False;
end;
         // Definindo condi��es para liberar a grava��o apenas se todos os campos estiverem preenchidos
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

procedure TfrmCadastroClientes.FormCreate(Sender: TObject);
begin
ConexaoClientes.Connected:=True;
TabelaClientes.Open();
btnSalvar.Enabled:=False;

edtdbNome.Enabled:=False;
edtdbCPF.Enabled:=False;
edtdbCelular.Enabled:=False;
edtdbCredito.Enabled:=False;
//n�o permitir inser��o sem clicar no bot�o de adicionar
end;

(*
edtdbNome.Enabled:=False;
edtdbCPF.Enabled:=False;
edtdbCelular.Enabled:=False;
edtdbCredito.Enabled:=False;

atribuindo enbled false a todos os edtDB do frmCadastroClientes
*)

end.

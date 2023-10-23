unit uCompras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCompras = class(TForm)
    pnlCenter: TPanel;
    pnlMidTop: TPanel;
    pnlTop2: TPanel;
    btnFinalizar: TSpeedButton;
    pnlMidFooter: TPanel;
    lblNomeTela: TLabel;
    btnHome: TBitBtn;
    pnlMid: TPanel;
    pnlDbGrid: TPanel;
    pnlBuscarEstoque: TPanel;
    dbGridEstoqueCompras: TDBGrid;
    pnlDados: TPanel;
    Label1: TLabel;
    lblQtde: TLabel;
    btnSalvarEstoque: TBitBtn;
    pnlEstetico1: TPanel;
    ConexaoCompras: TFDConnection;
    TabelaParaEstoque: TFDQuery;
    fbClient: TFDPhysFBDriverLink;
    dsCompras: TDataSource;
    edtdbQtdeCompras: TDBEdit;
    edtCodigoCompras: TEdit;
    btnEditEstoque: TBitBtn;
    procedure btnHomeClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure edtCodigoComprasChange(Sender: TObject);
    procedure btnEditEstoqueClick(Sender: TObject);
    procedure btnSalvarEstoqueClick(Sender: TObject);
  private
    { Private declarations }
  public
  estoqueAtual, estoqueNovo : integer;
    { Public declarations }
  end;

var
  frmCompras: TfrmCompras;

implementation

{$R *.dfm}

uses uMenu;

procedure TfrmCompras.btnEditEstoqueClick(Sender: TObject);
begin
  if edtdbQtdeCompras.Text <> null then
  begin
  //Estoque Atual recebe valor convertido string para inteiro
    estoqueAtual := StrToInt(edtdbQtdeCompras.Text);
  end;
  btnEditEstoque.Enabled:=False;
    //Estoque mecânica pt.1
end;

procedure TfrmCompras.btnFinalizarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmCompras.btnHomeClick(Sender: TObject);
begin
  frmCompras.Hide;
  frmMenu.Show;
end;

procedure TfrmCompras.btnSalvarEstoqueClick(Sender: TObject);
begin
  estoqueNovo:= StrToInt(edtdbQtdeCompras.Text);
  estoqueNovo := estoqueAtual + estoqueNovo;
  edtdbQtdeCompras.Text:=IntToStr(estoqueNovo);
  TabelaParaEstoque.Post;
  //Estoque mecânica pt.2
end;

procedure TfrmCompras.edtCodigoComprasChange(Sender: TObject);
begin
TabelaParaEstoque.Locate('COD_PRODUTO',edtCodigoCompras.Text,[loPartialKey,loCaseInsensitive]);

end;

end.

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
  Vcl.DBCtrls;

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
    Conexao: TFDConnection;
    TabelaClientes: TFDQuery;
    dsClientes: TDataSource;
    fbClient: TFDPhysFBDriverLink;
    TabelaClientesID_CLIENTE: TIntegerField;
    TabelaClientesNOME_CLIENTE: TStringField;
    TabelaClientesCPF_CLIENTE: TStringField;
    TabelaClientesNUMERO_CLIENTE: TStringField;
    TabelaClientesCREDITO_CLIENTE: TSingleField;
    TabelaClientesCOINS_CLIENTE: TSingleField;
    DBNavigator1: TDBNavigator;
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnHomeClick(Sender: TObject);
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

procedure TfrmCadastroClientes.btnFinalizarClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TfrmCadastroClientes.btnHomeClick(Sender: TObject);
begin
frmCadastroClientes.Hide;
frmCadastro.Show;
end;

end.

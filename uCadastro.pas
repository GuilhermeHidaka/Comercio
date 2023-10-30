unit uCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Imaging.pngimage;

type

  TfrmCadastro = class(TForm)
    pnlCenter: TPanel;
    pnlMidTop: TPanel;
    pnlTop2: TPanel;
    pnlMidFooter: TPanel;
    pnlMid: TPanel;
    pnlLeft: TPanel;
    Panel1: TPanel;
    btnCadastroClientes: TBitBtn;
    btnCadastroProdutos: TBitBtn;
    Image1: TImage;
    lblNomeTela: TLabel;
    Image2: TImage;
    btnVoltarCadastroProdutos: TBitBtn;
    procedure btnHomeClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnCadastroProdutosClick(Sender: TObject);
    procedure btnCadastroClientesClick(Sender: TObject);
    procedure btnVoltarCadastroProdutosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

uses uMenu, uCadastroClientes, uCadastroProdutos, uCompras;

procedure TfrmCadastro.btnCadastroClientesClick(Sender: TObject);
begin
  frmCadastroClientes := TfrmCadastroClientes.Create(self);
  frmCadastro.Hide;
  frmCadastroClientes.Show;
end;

procedure TfrmCadastro.btnCadastroProdutosClick(Sender: TObject);
begin
  frmCadastroProdutos := TfrmCadastroProdutos.Create(self);
  frmCadastro.Hide;
  frmCadastroProdutos.Show;
end;

procedure TfrmCadastro.btnFinalizarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmCadastro.btnHomeClick(Sender: TObject);
begin
  frmCadastro.Hide;
  frmMenu.Show;
end;

procedure TfrmCadastro.btnVoltarCadastroProdutosClick(Sender: TObject);
begin
  frmMenu.Show;

  frmCadastro.Close;
  frmCadastro.Free;
end;

end.

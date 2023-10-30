unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TfrmMenu = class(TForm)
    pnlCentral: TPanel;
    pnlButtons: TPanel;
    pnlLogo: TPanel;
    pnlTopCenter: TPanel;
    pnlTopFooter: TPanel;
    imgLogo: TImage;
    btnConfig: TBitBtn;
    pnlLateralBarra: TPanel;
    btnRelatorios: TBitBtn;
    btnEstoque: TBitBtn;
    btnVendas: TBitBtn;
    btnCompras: TBitBtn;
    btnCadastro: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    btnFinalizar: TSpeedButton;
    Label1: TLabel;
    procedure btnCadastroClick(Sender: TObject);
    procedure btnComprasClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
    procedure btnEstoqueClick(Sender: TObject);
    procedure btnRelatoriosClick(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses uCadastro, uCompras, uConfig, uEstoque, uRelatorios, uVendas;

procedure TfrmMenu.btnCadastroClick(Sender: TObject);
begin
  frmCadastro := TfrmCadastro.Create(self);
  frmMenu.Hide;
  frmCadastro.Show;
end;

procedure TfrmMenu.btnComprasClick(Sender: TObject);
begin
  frmCompras := TfrmCompras.Create(self);
  frmMenu.Hide;
  frmCompras.Show;
end;

procedure TfrmMenu.btnConfigClick(Sender: TObject);
begin
  frmConfig := TfrmConfig.Create(self);
  frmMenu.Hide;
  frmConfig.Show;
end;

procedure TfrmMenu.btnEstoqueClick(Sender: TObject);
begin
  frmEstoque := TfrmEstoque.Create(self);
  frmMenu.Hide;
  frmEstoque.Show;
end;

procedure TfrmMenu.btnFinalizarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMenu.btnRelatoriosClick(Sender: TObject);
begin
  frmRelatorios := TfrmRelatorios.Create(self);
  frmMenu.Hide;
  frmRelatorios.Show;
end;

procedure TfrmMenu.btnVendasClick(Sender: TObject);
begin
  frmVendas := TfrmVendas.Create(self);
  frmMenu.Hide;
  frmVendas.Show;
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
frmMenu.Close;
frmMenu.Free;
end;

end.

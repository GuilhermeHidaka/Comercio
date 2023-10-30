unit uVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmVendas = class(TForm)
    pnlCenter: TPanel;
    pnlMidTop: TPanel;
    pnlTop2: TPanel;
    pnlMidFooter: TPanel;
    pnlMid: TPanel;
    Image1: TImage;
    lblNomeTela: TLabel;
    Image2: TImage;
    btnVoltarCadastroProdutos: TBitBtn;
    procedure btnHomeClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

uses uMenu;

procedure TfrmVendas.btnFinalizarClick(Sender: TObject);
begin
  frmMenu.Show;
  frmVendas.Close;
  frmVendas.Free;
end;

procedure TfrmVendas.btnHomeClick(Sender: TObject);
begin
  frmVendas.Hide;
  frmMenu.Show;
end;

end.

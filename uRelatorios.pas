unit uRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmRelatorios = class(TForm)
    pnlCenter: TPanel;
    pnlMidTop: TPanel;
    pnlTop2: TPanel;
    pnlMidFooter: TPanel;
    pnlMid: TPanel;
    Image1: TImage;
    Image2: TImage;
    lblNomeTela: TLabel;
    btnVoltarCadastroProdutos: TBitBtn;
    procedure btnHomeClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

{$R *.dfm}

uses uMenu;

procedure TfrmRelatorios.btnFinalizarClick(Sender: TObject);
begin
  frmMenu.Show;
  frmRelatorios.Close;
  frmRelatorios.Free;
end;

procedure TfrmRelatorios.btnHomeClick(Sender: TObject);
begin
  frmRelatorios.Hide;
  frmMenu.Show;
end;

end.

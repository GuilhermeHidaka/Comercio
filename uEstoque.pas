unit uEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmEstoque = class(TForm)
    pnlCenter: TPanel;
    pnlMidTop: TPanel;
    pnlTop2: TPanel;
    btnFinalizar: TSpeedButton;
    pnlMidFooter: TPanel;
    lblNomeTela: TLabel;
    btnHome: TBitBtn;
    pnlMid: TPanel;
    procedure btnHomeClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstoque: TfrmEstoque;

implementation

{$R *.dfm}

uses uMenu;

procedure TfrmEstoque.btnFinalizarClick(Sender: TObject);
begin
  frmMenu.Show;
  frmEstoque.Close;
  frmEstoque.Free;
end;

procedure TfrmEstoque.btnHomeClick(Sender: TObject);
begin
  frmEstoque.Hide;
  frmMenu.Show;
end;

end.

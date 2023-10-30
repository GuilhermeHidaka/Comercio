unit uConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmConfig = class(TForm)
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
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

uses uMenu;

procedure TfrmConfig.btnFinalizarClick(Sender: TObject);
begin
  frmMenu.Show;
  frmConfig.Close;
  frmConfig.Free;
end;

procedure TfrmConfig.btnHomeClick(Sender: TObject);
begin
  frmConfig.Hide;
  frmMenu.Show;
end;

end.

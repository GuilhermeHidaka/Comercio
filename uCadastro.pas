unit uCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadastro = class(TForm)
    pnlCenter: TPanel;
    pnlMidTop: TPanel;
    pnlTop2: TPanel;
    pnlMidFooter: TPanel;
    btnHome: TBitBtn;
    btnFinalizar: TSpeedButton;
    lblNomeTela: TLabel;
    pnlMid: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

end.

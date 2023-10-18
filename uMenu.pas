unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmMenu = class(TForm)
    pnlCentral: TPanel;
    pnlButtons: TPanel;
    pnlLogo: TPanel;
    pnlTopCenter: TPanel;
    pnlTopFooter: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

end.

program PrjComercio;

uses
  Vcl.Forms,
  uMenu in 'uMenu.pas' {frmMenu},
  uCadastro in 'uCadastro.pas' {frmCadastro},
  uCompras in 'uCompras.pas' {frmCompras},
  uVendas in 'uVendas.pas' {frmVendas},
  uEstoque in 'uEstoque.pas' {frmEstoque},
  uRelatorios in 'uRelatorios.pas' {frmRelatorios},
  uConfig in 'uConfig.pas' {frmConfig},
  uCadastroProdutos in 'uCadastroProdutos.pas' {frmCadastroProdutos},
  uCadastroClientes in 'uCadastroClientes.pas' {frmCadastroClientes},
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.

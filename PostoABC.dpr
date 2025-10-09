program PostoABC;

uses
  Forms,
  unPrincipal in 'unPrincipal.pas' {fmPrincipal},
  unEntidadeTanque in 'Kernel\unEntidadeTanque.pas',
  unEntidadeBomba in 'Kernel\unEntidadeBomba.pas',
  unEntidadeAbastecimento in 'Kernel\unEntidadeAbastecimento.pas',
  dmConexao in 'Conexao\dmConexao.pas' {Conexao: TDataModule},
  unCadastroTanque in 'Cadastros\unCadastroTanque.pas' {fmCadastroTanque},
  unCadastroTanqueController in 'Cadastros\unCadastroTanqueController.pas',
  unTipos in 'Kernel\unTipos.pas',
  unCadastroDeBomba in 'Cadastros\unCadastroDeBomba.pas' {fmCadastroBomba},
  unCadastroDeBombaController in 'Cadastros\unCadastroDeBombaController.pas',
  unCadastroDeAbastecimento in 'Cadastros\unCadastroDeAbastecimento.pas' {fmCadastroAbastecimento},
  unCadastroDeAbastecimentoController in 'Cadastros\unCadastroDeAbastecimentoController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TConexao, Conexao);
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.CreateForm(TfmCadastroBomba, fmCadastroBomba);
  Application.CreateForm(TfmCadastroAbastecimento, fmCadastroAbastecimento);
  Application.Run;
end.

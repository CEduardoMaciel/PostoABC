program unTestesPostoABC;

uses
  Forms,
  GUITestRunner,
  unEntidadeAbastecimento in '..\Kernel\unEntidadeAbastecimento.pas',
  unEntidadeAbastecimentoTest in 'unEntidadeAbastecimentoTest.pas',
  dmConexao in '..\Conexao\dmConexao.pas' {Conexao: TDataModule},
  unEntidadeBomba in '..\Kernel\unEntidadeBomba.pas',
  unEntidadeBombaTest in 'unEntidadeBombaTest.pas',
  unEntidadeTanque in '..\Kernel\unEntidadeTanque.pas',
  unEntidadeTanqueTest in 'unEntidadeTanqueTest.pas',
  unTipos in '..\Kernel\unTipos.pas',
  unTiposTest in 'unTiposTest.pas';

{$R *.res}

begin
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
end.

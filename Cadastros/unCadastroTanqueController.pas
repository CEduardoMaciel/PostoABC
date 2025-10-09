unit unCadastroTanqueController;

interface

uses
  unEntidadeTanque, SqlExpr, SysUtils, dmConexao;

type
  TCadastroTanqueController = class
  private
  public
    function ExisteBombaVinculadaAEsseTanque(ACodigoTanque: Integer): Boolean;
    function TanqueExiste(ACodigoTanque: Integer): TTanque;
    function ExcluirTanque(Tanque: TTanque): Boolean;
  end;

implementation

{ TCadastroTanqueController }

function TCadastroTanqueController.ExcluirTanque(Tanque: TTanque): Boolean;
var
  Persistencia: TTanquePersitencia;
begin
  Persistencia := TTanquePersitencia.Create;
  try
    Result := Persistencia.Excluir(Tanque);
  finally
    FreeAndNil(Persistencia);
  end;
end;

function TCadastroTanqueController.ExisteBombaVinculadaAEsseTanque(
  ACodigoTanque: Integer): Boolean;
begin
  if Conexao.sqAuxiliar.Active then
    Conexao.sqAuxiliar.Close;

  Conexao.sqAuxiliar.SQL.Text := 'SELECT COUNT(*) FROM BOMBA WHERE CODIGO_TANQUE = ' +
    QuotedStr(IntToStr(ACodigoTanque));

  Conexao.sqAuxiliar.Open;
  Result := Conexao.sqAuxiliar.RecordCount > 0;
end;

function TCadastroTanqueController.TanqueExiste(
  ACodigoTanque: Integer): TTanque;
var
  Persistencia: TTanquePersitencia;
begin
  Persistencia := TTanquePersitencia.Create;
  try
    Result := Persistencia.Buscar(ACodigoTanque);
  finally
    FreeAndNil(Persistencia);
  end;
end;

end.

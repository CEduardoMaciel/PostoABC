unit unCadastroDeBombaController;

interface

uses
  unEntidadeBomba, SqlExpr, SysUtils, dmConexao, DBCLient;

type
  TCadastroBombaController = class
  public
    function BombaExiste(ACodigoBomba: Integer): TBomba;
    function QuantidadeDeBombasVinculadasAEsseTanqueEhPermitida(ACodigoTanque: Integer): Boolean;
    function ExcluirBomba(Bomba: TBomba): Boolean;
    function CarregarTanques: TClientDataSet;
  end;

implementation

{ TCadastroBombaController }

function TCadastroBombaController.BombaExiste(ACodigoBomba: Integer): TBomba;
var
  Persistencia: TBombaPersitencia;
begin
  Persistencia := TBombaPersitencia.Create;
  try
    Result := Persistencia.Buscar(ACodigoBomba);
  finally
    FreeAndNil(Persistencia);
  end;
end;

function TCadastroBombaController.CarregarTanques: TClientDataSet;
begin
  if Conexao.sqTanquesBomba.Active then
    Conexao.sqTanquesBomba.Close;
  Conexao.sqTanquesBomba.Open;

  Conexao.cdsTanquesBomba.Close;
  Conexao.cdsTanquesBomba.Open;
  Result := Conexao.cdsTanquesBomba;
end;

function TCadastroBombaController.ExcluirBomba(Bomba: TBomba): Boolean;
var
  Persistencia: TBombaPersitencia;
begin
  Persistencia := TBombaPersitencia.Create;
  try
    Result := Persistencia.Excluir(Bomba);
  finally
    FreeAndNil(Persistencia);
  end;
end;

function TCadastroBombaController.QuantidadeDeBombasVinculadasAEsseTanqueEhPermitida(
  ACodigoTanque: Integer): Boolean;
begin
  if Conexao.sqAuxiliar.Active then
    Conexao.sqAuxiliar.Close;

  Conexao.sqAuxiliar.SQL.Text := 'SELECT COUNT(*) FROM BOMBA WHERE CODIGO_TANQUE = ' +
    QuotedStr(IntToStr(ACodigoTanque));

  Conexao.sqAuxiliar.Open;
  Result := Conexao.sqAuxiliar.RecordCount < 2;
end;

end.

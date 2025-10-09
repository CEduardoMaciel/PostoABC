unit unCadastroTanqueController;

interface

uses
  unEntidadeTanque, DBXpress, SqlExpr, SysUtils, dmConexao;

type
  TCadastroTanqueController = class
  public
    function TanqueExiste(ACodigoTanque: Integer): TTanque;
  end;

implementation

{ TCadastroTanqueController }

function TCadastroTanqueController.TanqueExiste(
  ACodigoTanque: Integer): TTanque;
var
  Persistencia: TTanquePersitencia;
begin
  Persistencia := TTanquePersitencia.Create;
  try
    Result := Persistencia.Buscar(ACodigoTanque);
  finally
    Persistencia.Free;
  end;
end;

end.

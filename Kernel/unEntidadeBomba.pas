unit unEntidadeBomba;

interface

uses
   DBXpress, SqlExpr, SysUtils;

type
  TBomba = class
  private
    FCodigo: Integer;
    FDescricao: string;
    FCodigoTanque: Integer;
    function GetCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
    function GetDescricao: string;
    procedure SetDescricao(const Value: string);
    function GetCodigoTanque: Integer;
    procedure SetCodigoTanque(const Value: Integer);
  public
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
    property CodigoTanque: Integer read GetCodigoTanque write SetCodigoTanque;
  end;

  TBombaPersitencia = class
  public
    function Salvar(ABomba: TBomba): Boolean;
    function Atualizar(ABomba: TBomba): Boolean;
    function Excluir(ABomba: TBomba): Boolean;
    function QuantidadeBombasPorTanque(ACodigoTanque: Integer): Integer;
    function Buscar(ACodigo: Integer): TBomba;
  end;

implementation

uses
  dmConexao;

{ TBomba }

function TBomba.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

procedure TBomba.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

function TBomba.GetCodigoTanque: Integer;
begin
  Result := FCodigoTanque;
end;

procedure TBomba.SetCodigoTanque(const Value: Integer);
begin
  FCodigoTanque := Value;
end;

function TBomba.GetDescricao: string;
begin
  Result := FDescricao;
end;

procedure TBomba.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

{ TBombaPersitencia }

function TBombaPersitencia.Atualizar(ABomba: TBomba): Boolean;
var
  QueryBomba: TSQLQuery;
begin
  QueryBomba := TSQLQuery.Create(nil);
  try
    QueryBomba.SQLConnection := Conexao.FirebirdConnection;
    QueryBomba.SQL.Text := 'SELECT DESCRICAO_BOMBA, CODIGO_TANQUE FROM ' +
      'BOMBA WHERE CODIGO_BOMBA = ' + QuotedStr(IntToStr(ABomba.Codigo));
    QueryBomba.Open;
    
    if not QueryBomba.IsEmpty then
    begin
      QueryBomba.SQL.Text := 'UPDATE TANQUE SET DESCRICAO_BOMBA = :DESCRICAO_BOMBA, ' +
        'CODIGO_TANQUE = :CODIGO_TANQUE WHERE CODIGO_BOMBA = :CODIGO_BOMBA';
      QueryBomba.ParamByName('CODIGO_BOMBA').AsInteger := ABomba.Codigo;
      QueryBomba.ParamByName('DESCRICAO_BOMBA').AsString := ABomba.Descricao;
      QueryBomba.ParamByName('CODIGO_TANQUE').AsInteger := ABomba.CodigoTanque;
      QueryBomba.ExecSQL;
      Result := True;
    end
    else
      Result := False;
  finally
    FreeAndNil(QueryBomba);
  end;
end;

function TBombaPersitencia.Buscar(ACodigo: Integer): TBomba;
var
  QueryBomba: TSQLQuery;
  Bomba: TBomba;
begin
  Result := nil;
  QueryBomba := TSQLQuery.Create(nil);
  try
    QueryBomba.SQLConnection := Conexao.FirebirdConnection;
    QueryBomba.SQL.Text := 'SELECT CODIGO_BOMBA, DESCRICAO_BOMBA, CODIGO_TANQUE ' +
      'FROM BOMBA WHERE CODIGO_BOMBA = :CODIGO_BOMBA';
    QueryBomba.ParamByName('CODIGO_BOMBA').AsInteger := ACodigo;
    QueryBomba.Open;

    if not QueryBomba.IsEmpty then
    begin
      Bomba := TBomba.Create;
      Bomba.Codigo := QueryBomba.FieldByName('CODIGO_BOMBA').AsInteger;
      Bomba.Descricao := QueryBomba.FieldByName('DESCRICAO_BOMBA').AsString;
      Bomba.CodigoTanque := QueryBomba.FieldByName('CODIGO_TANQUE').AsInteger;
      Result := Bomba;
    end;
  finally
    FreeAndNil(QueryBomba);
  end;
end;

function TBombaPersitencia.Excluir(ABomba: TBomba): Boolean;
var
  QueryBomba: TSQLQuery;
begin
  QueryBomba := TSQLQuery.Create(nil);
  try
    QueryBomba.SQLConnection := Conexao.FirebirdConnection;
    QueryBomba.SQL.Text := 'DELETE FROM BOMBA WHERE CODIGO_BOMBA = :CODIGO_BOMBA';
    QueryBomba.ParamByName('CODIGO_BOMBA').AsInteger := ABomba.Codigo;
    QueryBomba.ExecSQL;
    Result := True;
  finally
    FreeAndNil(QueryBomba);
  end;
end;

function TBombaPersitencia.QuantidadeBombasPorTanque(
  ACodigoTanque: Integer): Integer;
var
  QueryBomba: TSQLQuery;
begin
  Result := 0;
  QueryBomba := TSQLQuery.Create(nil);
  try
    QueryBomba.SQLConnection := Conexao.FirebirdConnection;
    QueryBomba.SQL.Text := 'SELECT COUNT(*) AS TOTAL FROM BOMBA WHERE ID_TANQUE = :ID_TANQUE';
    QueryBomba.ParamByName('CODIGO_TANQUE').AsInteger := ACodigoTanque;
    QueryBomba.Open;
    Result := QueryBomba.FieldByName('TOTAL').AsInteger;
  finally
    FreeAndNil(QueryBomba);
  end;
end;

function TBombaPersitencia.Salvar(ABomba: TBomba): Boolean;
var
  QueryBomba: TSQLQuery;
begin
  QueryBomba := TSQLQuery.Create(nil);
  try
    QueryBomba.SQLConnection := Conexao.FirebirdConnection;
    QueryBomba.SQL.Text := 'SELECT COUNT(*) FROM BOMBA WHERE CODIGO_BOMBA = ' +
      QuotedStr(IntToStr(ABomba.Codigo));
    QueryBomba.ExecSQL;

    if QueryBomba.IsEmpty then
    begin
      QueryBomba.SQL.Text := 'INSERT INTO BOMBA (CODIGO_BOMBA, DESCRICAO_BOMBA, CODIGO_TANQUE) ' +
        ' VALUES (:CODIGO_TANQUE, :DESCRICAO_BOMBA, :CODIGO_TANQUE)';
      QueryBomba.ParamByName('CODIGO_BOMBA').AsInteger := ABomba.Codigo;
      QueryBomba.ParamByName('DESCRICAO_BOMBA').AsString := ABomba.Descricao;
      QueryBomba.ParamByName('CODIGO_TANQUE').AsInteger := ABomba.CodigoTanque;
      QueryBomba.ExecSQL;
      Result := True;
    end
    else
      Result := False;
  finally
    FreeAndNil(QueryBomba);
  end;
end;

end.


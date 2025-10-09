unit unEntidadeTanque;

interface

uses
  DBXpress, SqlExpr, SysUtils;

type
  TTanque = class
  private
    FCodigo: Integer;
    FDescricao: string;
    FTipoCombustivel: string;
    function GetCodigo: Integer;
    function GetDescricao: string;
    function GetTipoCombustivel: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetTipoCombustivel(const Value: string);
  public
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
    property TipoCombustivel: string read GetTipoCombustivel write SetTipoCombustivel;
  end;

  TTanquePersitencia = class
  public
    function Salvar(ATanque: TTanque): Boolean;
    function Atualizar(ATanque: TTanque): Boolean;
    function Excluir(ATanque: TTanque): Boolean;
    function Buscar(ACodigo: Integer): TTanque;
  end;

implementation

uses
  dmConexao;

{ TTanque }

function TTanque.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TTanque.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TTanque.GetTipoCombustivel: string;
begin
  Result := FTipoCombustivel;
end;

procedure TTanque.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TTanque.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TTanque.SetTipoCombustivel(const Value: string);
begin
  FTipoCombustivel := Value;
end;

{ TTanquePersitencia }

function TTanquePersitencia.Atualizar(ATanque: TTanque): Boolean;
var
  QueryTanque: TSQLQuery;
begin
  QueryTanque := TSQLQuery.Create(nil);
  try
    QueryTanque.SQLConnection := Conexao.FirebirdConnection;
    QueryTanque.SQL.Text := 'SELECT DESCRICAO, TIPO_COMBUSTIVEL FROM ' +
      'TANQUE WHERE CODIGO_TANQUE = ' + QuotedStr(IntToStr(ATanque.Codigo));
    QueryTanque.Open;
    
    if not QueryTanque.IsEmpty then
    begin
      QueryTanque.SQL.Text := 'UPDATE TANQUE SET DESCRICAO = :DESCRICAO, ' +
        'TIPO_COMBUSTIVEL = :TIPO_COMBUSTIVEL WHERE CODIGO_TANQUE = :CODIGO_TANQUE';
      QueryTanque.ParamByName('CODIGO_TANQUE').AsInteger := ATanque.Codigo;
      QueryTanque.ParamByName('DESCRICAO').AsString := ATanque.Descricao;
      QueryTanque.ParamByName('TIPO_COMBUSTIVEL').AsString := ATanque.TipoCombustivel;
      QueryTanque.ExecSQL;
      Result := True;
    end
    else
      Result := False;
  finally
    FreeAndNil(QueryTanque);
  end;
end;

function TTanquePersitencia.Buscar(ACodigo: Integer): TTanque;
var
  QueryTanque: TSQLQuery;
  Tanque: TTanque;
begin
  Result := nil;
  QueryTanque := TSQLQuery.Create(nil);
  try
    QueryTanque.SQLConnection := Conexao.FirebirdConnection; 
    QueryTanque.SQL.Text := 'SELECT CODIGO_TANQUE, DESCRICAO, TIPO_COMBUSTIVEL ' +
      'FROM TANQUE WHERE CODIGO_TANQUE = :CODIGO_TANQUE';
    QueryTanque.ParamByName('CODIGO_TANQUE').AsInteger := ACodigo;
    QueryTanque.Open;

    if not QueryTanque.IsEmpty then
    begin
      Tanque := TTanque.Create;
      Tanque.Codigo := QueryTanque.FieldByName('CODIGO_TANQUE').AsInteger;
      Tanque.Descricao := QueryTanque.FieldByName('DESCRICAO').AsString;
      Tanque.TipoCombustivel := QueryTanque.FieldByName('TIPO_COMBUSTIVEL').AsString;
      Result := Tanque;
    end;
  finally
    FreeAndNil(QueryTanque);
  end;
end;

function TTanquePersitencia.Excluir(ATanque: TTanque): Boolean;
var
  QueryTanque: TSQLQuery;
begin
  QueryTanque := TSQLQuery.Create(nil);
  try
    QueryTanque.SQLConnection := Conexao.FirebirdConnection;
    QueryTanque.SQL.Text := 'DELETE FROM TANQUE WHERE CODIGO_TANQUE = :CODIGO_TANQUE';
    QueryTanque.ParamByName('CODIGO_TANQUE').AsInteger := ATanque.Codigo;
    QueryTanque.ExecSQL;
    Result := True;
  finally
    FreeAndNil(QueryTanque);
  end;
end;

function TTanquePersitencia.Salvar(ATanque: TTanque): Boolean;
var
  QueryTanque: TSQLQuery;
begin
  QueryTanque := TSQLQuery.Create(nil);
  try
    QueryTanque.SQLConnection := Conexao.FirebirdConnection;
    QueryTanque.SQL.Text := 'SELECT COUNT(*) FROM TANQUE WHERE CODIGO_TANQUE = ' +
      QuotedStr(IntToStr(ATanque.Codigo));
    QueryTanque.Open;

    if QueryTanque.IsEmpty then
    begin
      QueryTanque.SQL.Text := 'INSERT INTO TANQUE (CODIGO_TANQUE, DESCRICAO, TIPO_COMBUSTIVEL) ' +
        ' VALUES (:CODIGO_TANQUE, :DESCRICAO, :TIPO_COMBUSTIVEL)';
      QueryTanque.ParamByName('CODIGO_TANQUE').AsInteger := ATanque.Codigo;
      QueryTanque.ParamByName('DESCRICAO').AsString := ATanque.Descricao;
      QueryTanque.ParamByName('TIPO_COMBUSTIVEL').AsString := ATanque.TipoCombustivel;
      QueryTanque.ExecSQL;
      Result := True;
    end
    else
      Result := False;
  finally
    FreeAndNil(QueryTanque);
  end;
end;

end.

unit unEntidadeBomba;

interface

uses unEntidadeTanque;

type
  TBomba = class
  private
    FCodigo: Integer;
    FDescricao: string;
    FCodigoTanque: Integer;
    FTanque: TTanque;
    function GetCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
    function GetDescricao: string;
    procedure SetDescricao(const Value: string);
    function GetTanque: TTanque;
    procedure SetTanque(const Value: TTanque);
    function GetCodigoTanque: Integer;
    procedure SetCodigoTanque(const Value: Integer);
  public
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
    property CodigoTanque: Integer read GetCodigoTanque write SetCodigoTanque;
    property Tanque: TTanque read GetTanque write SetTanque;
  end;

implementation

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

function TBomba.GetTanque: TTanque;
begin
  Result := FTanque;
end;

procedure TBomba.SetTanque(const Value: TTanque);
begin
  FTanque := Value;
end;

end.


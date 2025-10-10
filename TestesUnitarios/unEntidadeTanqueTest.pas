unit unEntidadeTanqueTest;

interface

uses
  TestFramework, SysUtils, unEntidadeTanque;

type
  TTestEntidadeTanque = class(TTestCase)
  private
    FTanque: TTanque;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestSetGetCodigo;
    procedure TestSetGetDescricao;
    procedure TestSetGetTipoCombustivel;
  end;

implementation

procedure TTestEntidadeTanque.SetUp;
begin
  FTanque := TTanque.Create;
end;

procedure TTestEntidadeTanque.TearDown;
begin
  FreeAndNil(FTanque);
end;

procedure TTestEntidadeTanque.TestSetGetCodigo;
begin
  FTanque.Codigo := 10;
  CheckEquals(10, FTanque.Codigo, 'Codigo não foi atribuído corretamente');
end;

procedure TTestEntidadeTanque.TestSetGetDescricao;
begin
  FTanque.Descricao := 'Tanque Principal';
  CheckEquals('Tanque Principal', FTanque.Descricao, 'Descricao não foi atribuída corretamente');
end;

procedure TTestEntidadeTanque.TestSetGetTipoCombustivel;
begin
  FTanque.TipoCombustivel := 'Diesel S10';
  CheckEquals('Diesel S10', FTanque.TipoCombustivel, 'TipoCombustivel não foi atribuído corretamente');
end;

initialization
  RegisterTest(TTestEntidadeTanque.Suite);

end.


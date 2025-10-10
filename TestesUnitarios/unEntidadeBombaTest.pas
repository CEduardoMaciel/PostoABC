unit unEntidadeBombaTest;

interface

uses
  TestFramework, SysUtils, unEntidadeBomba;

type
  TTestEntidadeBomba = class(TTestCase)
  private
    FBomba: TBomba;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestSetGetCodigo;
    procedure TestSetGetDescricao;
    procedure TestSetGetCodigoTanque;
  end;

implementation

procedure TTestEntidadeBomba.SetUp;
begin
  FBomba := TBomba.Create;
end;

procedure TTestEntidadeBomba.TearDown;
begin
  FreeAndNil(FBomba);
end;

procedure TTestEntidadeBomba.TestSetGetCodigo;
begin
  FBomba.Codigo := 1001;
  CheckEquals(1001, FBomba.Codigo, 'Codigo n�o foi atribu�do corretamente');
end;

procedure TTestEntidadeBomba.TestSetGetDescricao;
begin
  FBomba.Descricao := 'Bomba Diesel';
  CheckEquals('Bomba Diesel', FBomba.Descricao, 'Descricao n�o foi atribu�da corretamente');
end;

procedure TTestEntidadeBomba.TestSetGetCodigoTanque;
begin
  FBomba.CodigoTanque := 42;
  CheckEquals(42, FBomba.CodigoTanque, 'CodigoTanque n�o foi atribu�do corretamente');
end;

initialization
  RegisterTest(TTestEntidadeBomba.Suite);

end.


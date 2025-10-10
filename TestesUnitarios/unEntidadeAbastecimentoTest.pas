unit unEntidadeAbastecimentoTest;

interface

uses
  TestFramework, SysUtils, unEntidadeAbastecimento;

type
  TTestEntidadeAbastecimento = class(TTestCase)
  private
    FAbastecimento: TAbastecimento;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestSetGetCodigo;
    procedure TestSetGetCodigoBomba;
    procedure TestSetGetData;
    procedure TestSetGetLitros;
    procedure TestSetGetValor;
    procedure TestCalculoImposto;
  end;

implementation

procedure TTestEntidadeAbastecimento.SetUp;
begin
  FAbastecimento := TAbastecimento.Create;
end;

procedure TTestEntidadeAbastecimento.TearDown;
begin
  FreeAndNil(FAbastecimento);
end;

procedure TTestEntidadeAbastecimento.TestSetGetCodigo;
begin
  FAbastecimento.Codigo := 123;
  CheckEquals(123, FAbastecimento.Codigo, 'Codigo não foi atribuído corretamente');
end;

procedure TTestEntidadeAbastecimento.TestSetGetCodigoBomba;
begin
  FAbastecimento.CodigoBomba := 45;
  CheckEquals(45, FAbastecimento.CodigoBomba, 'CodigoBomba não foi atribuído corretamente');
end;

procedure TTestEntidadeAbastecimento.TestSetGetData;
var
  TestDate: TDateTime;
begin
  TestDate := EncodeDate(2023, 10, 10);
  FAbastecimento.Data := TestDate;
  CheckEquals(TestDate, FAbastecimento.Data, 'Data não foi atribuída corretamente');
end;

procedure TTestEntidadeAbastecimento.TestSetGetLitros;
begin
  FAbastecimento.Litros := 50.5;
  CheckEquals(50.5, FAbastecimento.Litros, 0.001, 'Litros não foi atribuído corretamente');
end;

procedure TTestEntidadeAbastecimento.TestSetGetValor;
begin
  FAbastecimento.Valor := 200.75;
  CheckEquals(200.75, FAbastecimento.Valor, 0.001, 'Valor não foi atribuído corretamente');
end;

procedure TTestEntidadeAbastecimento.TestCalculoImposto;
begin
  FAbastecimento.Valor := 100;
  CheckEquals(13.00, FAbastecimento.Imposto, 0.001, 'Imposto deveria ser 13% de 100');
end;

initialization
  RegisterTest(TTestEntidadeAbastecimento.Suite);

end.


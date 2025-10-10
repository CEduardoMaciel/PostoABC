unit unTiposTest;

interface

uses
  TestFramework, SysUtils, unTipos;

type
  TTiposTest = class(TTestCase)
  published
    procedure TestDataValida;
    procedure TestDataInvalida;
    procedure TestDataEmBranco;
    procedure TestDataFormatoErrado;
  end;

implementation

procedure TTiposTest.TestDataValida;
begin
  CheckTrue(DataValida('10/10/2025'), 'Data válida deveria retornar verdade');
end;

procedure TTiposTest.TestDataInvalida;
begin
  CheckFalse(DataValida('32/01/2025'), 'Dia inválido deveria retornar falso');
end;

procedure TTiposTest.TestDataEmBranco;
begin
  CheckFalse(DataValida(''), 'Data vazia deveria retornar falso');
end;

procedure TTiposTest.TestDataFormatoErrado;
begin
  CheckFalse(DataValida('2025-10-10'), 'Formato YYYY-MM-DD deveria retornar falso se for dd/mm/yyyy');
end;

initialization
  RegisterTest(TTiposTest.Suite);

end.


unit unEntidadeBase;

interface

type
  IEntidadeBase = Interface
    ['{D4B8B3B3-A375-4A4E-A316-1C78196D48F7}']
    FCodigo: Integer;
    FDescricao: string;
    function GetCodigo: Integer;
    function GetDescricao: string;
    property Codigo: Integer read GetCodigo write SetCodigo;
    property Descricao: string read GetDescricao write SetDescricao;
  end;

implementation

end.

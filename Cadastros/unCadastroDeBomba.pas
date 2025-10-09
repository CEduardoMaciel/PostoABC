unit unCadastroDeBomba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dblookup, ExtCtrls, StdCtrls, Mask, unCadastroDeBombaController,
  unTipos, DB, DBClient, DBCtrls;

type
  TfmCadastroBomba = class(TForm)
    edCodigoBomba: TMaskEdit;
    edDescricaoBomba: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btCancelar: TButton;
    Panel1: TPanel;
    Label4: TLabel;
    btExcluir: TButton;
    btEditar: TButton;
    btSalvar: TButton;
    dsTanquesBomba: TDataSource;
    lcTanques: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FEstado: TEstadosDaRotina;
    procedure AlterarEstadoDosControles;
  public
    { Public declarations }
  end;

var
  fmCadastroBomba: TfmCadastroBomba;
  Controller: TCadastroBombaController;

implementation

{$R *.dfm}

procedure TfmCadastroBomba.AlterarEstadoDosControles;
begin
  edCodigoBomba.Enabled := FEstado in [erNone, erCarregado];
  edDescricaoBomba.Enabled := FEstado in [erInclusao, erAlteracao];
  lcTanques.Enabled := FEstado in [erInclusao, erAlteracao];
  btSalvar.Enabled := FEstado in [erInclusao, erAlteracao];
  btCancelar.Enabled := FEstado in [erInclusao, erAlteracao];
  btEditar.Enabled := FEstado in [erCarregado];
  btExcluir.Enabled := FEstado in [erCarregado];
  if FEstado in [erNone, erCarregado] then
    edCodigoBomba.SetFocus
  else
    if FEstado = erAlteracao then
      edDescricaoBomba.SetFocus;
end;

procedure TfmCadastroBomba.FormActivate(Sender: TObject);
begin
  edCodigoBomba.SetFocus;
  FEstado := erNone;
end;

procedure TfmCadastroBomba.FormCreate(Sender: TObject);
begin
  Controller := TCadastroBombaController.Create;
end;

procedure TfmCadastroBomba.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Controller);
end;

procedure TfmCadastroBomba.FormShow(Sender: TObject);
begin
  dsTanquesBomba.DataSet := Controller.CarregarTanques;
  lcTanques.ListSource := dsTanquesBomba;
end;

end.

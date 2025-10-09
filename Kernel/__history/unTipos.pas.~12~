unit unTipos;

interface

uses
  Dialogs, Controls;

type
  TEstadosDaRotina = (erNone, erCarregado, erInclusao, erAlteracao);

function Pergunta(const Mensagem: string): Boolean;
procedure Mensagem(const Mensagem: string);

implementation

function Pergunta(const Mensagem: string): Boolean;
begin
  Result := MessageDlg(Mensagem, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

procedure Mensagem(const Mensagem: string);
begin
  MessageDlg(Mensagem, mtInformation, [mbOK], 0);
end;

end.

program Project1_Contatos;

uses
  Vcl.Forms,
  Unit_Contatos in 'Unit_Contatos.pas' {FORM_CONTATOS};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFORM_CONTATOS, FORM_CONTATOS);
  Application.Run;
end.

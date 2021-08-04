program Project2_GestaoContatos;

uses
  Vcl.Forms,
  Unit2_GestaoContatos in 'Unit2_GestaoContatos.pas' {form_CONTATOS},
  Unit1_Home in 'Unit1_Home.pas' {Form_Home};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Home, Form_Home);
  Application.CreateForm(Tform_CONTATOS, form_CONTATOS);
  Application.Run;
end.

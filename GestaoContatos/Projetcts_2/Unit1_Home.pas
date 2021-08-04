unit Unit1_Home;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Menus;

type
  TForm_Home = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Contatos1: TMenuItem;
    Sair1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Contatos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Home: TForm_Home;

implementation

{$R *.dfm}
uses Unit2_GestaoContatos;


procedure TForm_Home.Contatos1Click(Sender: TObject);
begin
  form_CONTATOS.Show;
end;

procedure TForm_Home.Sair1Click(Sender: TObject);
begin
 form_Home.Close;
end;

end.

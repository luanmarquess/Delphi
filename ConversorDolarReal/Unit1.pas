unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    dolar: TEdit;
    converter: TButton;
    real: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    comprar: TButton;
    msg: TLabel;
    procedure converterClick(Sender: TObject);
    procedure comprarClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  varReal : real;
  varNome : string;


implementation

{$R *.dfm}

procedure TForm1.converterClick(Sender: TObject);
begin
  comprar.Enabled := true;

  if (Dolar.Text = '') then
      showmessage('Digite o valor em dolar')
  else
    begin
    varReal := strtofloat(Dolar.Text) * 3.9;
    Real.Text := floattostr(varREAL);
    end;
end;

procedure TForm1.comprarClick(Sender: TObject);
begin
  varNome := inputbox('Nome', 'Digite seu nome:','');

  if (varNome <> '') and (Dolar.Text <> '0') then
    msg.Caption := varNome + ', compra efetuada com sucesso. Voce comprou: ' + Dolar.Text + ' Dolares.'
  else
    showmessage('Falta nome ou dolar deve ser MAIOR que 0.')
end;

end.

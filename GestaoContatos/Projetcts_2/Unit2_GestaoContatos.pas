unit Unit2_GestaoContatos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSAcc, FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  Tform_CONTATOS = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txt_ID: TEdit;
    txt_NOME: TEdit;
    txt_EMAIL: TEdit;
    txt_TELEFONE: TEdit;
    txt_OBS: TMemo;
    FDConnection1: TFDConnection;
    FDContatos: TFDTable;
    DataSource1: TDataSource;
    btn_NOVO: TButton;
    btn_Salvar: TButton;
    btn_SAIR: TButton;
    conexao: TLabel;
    btn_Prior: TButton;
    btn_Next: TButton;
    btn_EDITAR: TButton;
    btn_EXCLUIR: TButton;
    btn_CANCELAR: TButton;
    txt_PROCURAR: TEdit;
    Label6: TLabel;
    btn_PROCURAR: TSpeedButton;
    DBGrid1: TDBGrid;
    img_FOTO: TImage;
    btn_AdicionaImagem: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure btn_SAIRClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Carregar;
    procedure Bloqueia;
    procedure Limpa;
    procedure btn_PriorClick(Sender: TObject);
    procedure btn_NextClick(Sender: TObject);
    procedure btn_NOVOClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure FDContatosBeforePost(DataSet: TDataSet);
    procedure btn_EXCLUIRClick(Sender: TObject);
    procedure btn_EDITARClick(Sender: TObject);
    procedure btn_CANCELARClick(Sender: TObject);
    procedure btn_PROCURARClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btn_AdicionaImagemClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_CONTATOS: Tform_CONTATOS;
  estado : integer;

implementation
{$R *.dfm}
uses Unit1_Home;

procedure Tform_CONTATOS.Carregar;
begin
  txt_ID.Text := fdcontatos.FieldByName('id').Value;
  txt_NOME.Text := fdcontatos.FieldByName('nome').Value;
  txt_TELEFONE.Text := fdcontatos.FieldByName('telefone').Value;
  txt_EMAIL.Text := fdcontatos.FieldByName('email').Value;

  if fdcontatos.FieldByName('observacoes').Value = NULL then
    txt_OBS.Text := ''
  else
    txt_OBS.Text := fdcontatos.FieldByName('observacoes').Value;

  if fdContatos.FieldByName('foto').Value <> NULL then
    begin
      if fileexists(fdContatos.FieldByName('foto').Value)then // verifica se o caminho existe;
        img_FOTO.Picture.LoadFromFile(fdContatos.FieldByName('foto').Value)// carrega foto;
    end
  else
    img_FOTO.Picture := nil; // deixa sem valor;
end;


procedure Tform_CONTATOS.DBGrid1DblClick(Sender: TObject);
begin
 Carregar;
end;

procedure Tform_CONTATOS.FormCreate(Sender: TObject);
begin
  fdconnection1.Params.Database := GetCurrentDir+'\assets\contatos.mdb'; //Assume diretorio do db;
  fdconnection1.Connected := true;
  fdcontatos.TableName := 'contatos';// informa a tabla especifica;
  fdcontatos.Active := true;

  if fdconnection1.Connected <> true then
    conexao.Caption := 'Status: Indisponivel'
  else
  begin
    conexao.Caption := 'Status: Conectado';
    Carregar;
  end;

end;

procedure Tform_CONTATOS.btn_NOVOClick(Sender: TObject);
begin
  fdcontatos.Insert;
  Bloqueia;
  Limpa;
  estado := 1; // 1 = post
end;

procedure Tform_CONTATOS.btn_SalvarClick(Sender: TObject);
begin
//fdContatos tras os campos dos inputs para o banco;
  fdContatos.Post;
  Bloqueia;
  Showmessage('Contato Salvo com Sucesso!');
end;

procedure Tform_CONTATOS.FDContatosBeforePost(DataSet: TDataSet);
begin
    fdContatos.FieldByName('nome').Value := txt_NOME.Text;
    fdContatos.FieldByName('telefone').Value := txt_TELEFONE.Text;
    fdContatos.FieldByName('email').Value := txt_EMAIL.Text;
    fdContatos.FieldByName('observacoes').Value := txt_OBS.Text;
end;

procedure Tform_CONTATOS.Limpa;
begin
  txt_ID.text := '';
  txt_NOME.text := '';
  txt_TELEFONE.text := '';
  txt_EMAIL.text := '';
  txt_OBS.text := '';
  img_FOTO.Picture := nil;
  txt_NOME.SetFocus;
end;


procedure Tform_CONTATOS.btn_AdicionaImagemClick(Sender: TObject);
begin
  opendialog1.Execute();  // abre caixa de pesquisa;
  img_FOTO.Picture.LoadFromFile(opendialog1.FileName); // carrega no objeto foto, foto caminho do capturado opendialog1.FileName

  fdContatos.Edit;
  fdContatos.FieldByName('foto').Value := opendialog1.FileName;
  fdContatos.Post;
  end;

procedure Tform_CONTATOS.Bloqueia;
begin
// padrao e bloqueado. Funcao desbloqueia o campo tornando o enabel que e false, true;
  txt_NOME.Enabled := not txt_NOME.Enabled;
  txt_TELEFONE.Enabled :=  not txt_TELEFONE.Enabled;
  txt_EMAIL.Enabled := not txt_EMAIL.Enabled;
  txt_OBS.Enabled := not txt_OBS.Enabled;
end;

procedure Tform_CONTATOS.btn_CANCELARClick(Sender: TObject);
begin
  if estado = 1 then
    fdContatos.Prior;

  limpa;
  Carregar;
  bloqueia;
  estado := 0;

end;

procedure Tform_CONTATOS.btn_EDITARClick(Sender: TObject);
begin
  bloqueia;
  fdContatos.Edit;
end;

procedure Tform_CONTATOS.btn_EXCLUIRClick(Sender: TObject);
begin
  fdContatos.Delete;
  Carregar;
end;

procedure Tform_CONTATOS.btn_NextClick(Sender: TObject);
begin
  fdcontatos.Next;
  Carregar;
end;

procedure Tform_CONTATOS.btn_PriorClick(Sender: TObject);
begin
  fdcontatos.Prior;
  Carregar;
end;

procedure Tform_CONTATOS.btn_PROCURARClick(Sender: TObject);
begin
  if fdContatos.FindKey([txt_PROCURAR.Text]) then
    Carregar
  else
    ShowMessage('Nao encontrado');

end;

procedure Tform_CONTATOS.btn_SAIRClick(Sender: TObject);
begin
  form_CONTATOS.Hide;
  Form_Home.Show;
end;

end.

unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit2: TEdit;
    Edit20: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: char);
    procedure Edit12KeyPress(Sender: TObject; var Key: char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: char);
    procedure Edit4Change(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: char);
    procedure Edit5Change(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: char);
    procedure Edit6Change(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: char);
    procedure Edit7Change(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: char);
    procedure Edit8Change(Sender: TObject);
    procedure Edit8KeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation
// добавим доступ к главной форме 1
uses unit1;
{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);

// Зададим метку для обхода
Label exit_loop2, exit_loop3;

begin

   // При повторном открытии окна 2 оно сохранит предыдущее местоположение
   // Первоначальное место расположения окна -
   // в центре экрана (Form2.Position:=poDesktopCenter)
   Form2.Position:=poDesigned;


   // Знак УИН не введен -> Выход
if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') or
   (Edit4.Text = '') or (Edit5.Text = '') or (Edit6.Text = '') or
   (Edit7.Text = '') or (Edit8.Text = '') then goto exit_loop2;

// Проверяем поле знака УИН на наличие цифр
// Если не только цифры -> Выход
if (Edit1.Text[1] <> '0') and
   (Edit1.Text[1] <> '1') and
   (Edit1.Text[1] <> '2') and
   (Edit1.Text[1] <> '3') and
   (Edit1.Text[1] <> '4') and
   (Edit1.Text[1] <> '5') and
   (Edit1.Text[1] <> '6') and
   (Edit1.Text[1] <> '7') and
   (Edit1.Text[1] <> '8') and
   (Edit1.Text[1] <> '9') then goto exit_loop2;

if (Edit2.Text[1] <> '0') and
   (Edit2.Text[1] <> '1') and
   (Edit2.Text[1] <> '2') and
   (Edit2.Text[1] <> '3') and
   (Edit2.Text[1] <> '4') and
   (Edit2.Text[1] <> '5') and
   (Edit2.Text[1] <> '6') and
   (Edit2.Text[1] <> '7') and
   (Edit2.Text[1] <> '8') and
   (Edit2.Text[1] <> '9') then goto exit_loop2;

if (Edit3.Text[1] <> '0') and
   (Edit3.Text[1] <> '1') and
   (Edit3.Text[1] <> '2') and
   (Edit3.Text[1] <> '3') and
   (Edit3.Text[1] <> '4') and
   (Edit3.Text[1] <> '5') and
   (Edit3.Text[1] <> '6') and
   (Edit3.Text[1] <> '7') and
   (Edit3.Text[1] <> '8') and
   (Edit3.Text[1] <> '9') then goto exit_loop2;

if (Edit4.Text[1] <> '0') and
   (Edit4.Text[1] <> '1') and
   (Edit4.Text[1] <> '2') and
   (Edit4.Text[1] <> '3') and
   (Edit4.Text[1] <> '4') and
   (Edit4.Text[1] <> '5') and
   (Edit4.Text[1] <> '6') and
   (Edit4.Text[1] <> '7') and
   (Edit4.Text[1] <> '8') and
   (Edit4.Text[1] <> '9') then goto exit_loop2;

if (Edit5.Text[1] <> '0') and
   (Edit5.Text[1] <> '1') and
   (Edit5.Text[1] <> '2') and
   (Edit5.Text[1] <> '3') and
   (Edit5.Text[1] <> '4') and
   (Edit5.Text[1] <> '5') and
   (Edit5.Text[1] <> '6') and
   (Edit5.Text[1] <> '7') and
   (Edit5.Text[1] <> '8') and
   (Edit5.Text[1] <> '9') then goto exit_loop2;

if (Edit6.Text[1] <> '0') and
   (Edit6.Text[1] <> '1') and
   (Edit6.Text[1] <> '2') and
   (Edit6.Text[1] <> '3') and
   (Edit6.Text[1] <> '4') and
   (Edit6.Text[1] <> '5') and
   (Edit6.Text[1] <> '6') and
   (Edit6.Text[1] <> '7') and
   (Edit6.Text[1] <> '8') and
   (Edit6.Text[1] <> '9') then goto exit_loop2;

if (Edit7.Text[1] <> '0') and
   (Edit7.Text[1] <> '1') and
   (Edit7.Text[1] <> '2') and
   (Edit7.Text[1] <> '3') and
   (Edit7.Text[1] <> '4') and
   (Edit7.Text[1] <> '5') and
   (Edit7.Text[1] <> '6') and
   (Edit7.Text[1] <> '7') and
   (Edit7.Text[1] <> '8') and
   (Edit7.Text[1] <> '9') then goto exit_loop2;

if (Edit8.Text[1] <> '0') and
   (Edit8.Text[1] <> '1') and
   (Edit8.Text[1] <> '2') and
   (Edit8.Text[1] <> '3') and
   (Edit8.Text[1] <> '4') and
   (Edit8.Text[1] <> '5') and
   (Edit8.Text[1] <> '6') and
   (Edit8.Text[1] <> '7') and
   (Edit8.Text[1] <> '8') and
   (Edit8.Text[1] <> '9') then goto exit_loop2;

   // Изменяем постоянные значения разрядов УИН  и код источника дохода
   // Код КБК
   val(Edit1.Text[1], nomer_uin[1]);
   val(Edit2.Text[1], nomer_uin[2]);
   val(Edit3.Text[1], nomer_uin[3]);

   // Код территории
   val(Edit4.Text[1], nomer_uin[4]);
   val(Edit5.Text[1], nomer_uin[5]);

   // Код источника дохода
   val(Edit6.Text[1], nomer_uin[6]);
   val(Edit7.Text[1], nomer_uin[7]);

   // Код принадлежности к отраслевому управлению
   val(Edit8.Text[1], nomer_uin[8]);

   Form2.Close;
   goto exit_loop3;

exit_loop2:
    Form2.Edit20.Text := 'X';
    ShowMessage('Знаки УИН должны состоять из цифр');
exit_loop3:
end;


procedure TForm2.Edit11KeyPress(Sender: TObject; var Key: char);
begin
   // Разрешаем вводить знак УИН только цифрами
   Edit11.ReadOnly:= not (Key in ['0'..'9',#8]);
end;

procedure TForm2.Edit12KeyPress(Sender: TObject; var Key: char);
begin
   // Разрешаем вводить знак УИН только цифрами
   Edit12.ReadOnly:= not (Key in ['0'..'9',#8]);
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
  Form1.Edit2.Enabled := False;
 Form1.Edit3.Text := '';
  val(Edit1.Text, nomer_uin[1]);
end;

procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  // Разрешаем вводить знак УИН только цифрами
   Edit1.ReadOnly:= not (Key in ['0'..'9',#8]);
   Form2.Edit20.Text := 'X';
end;


procedure TForm2.Edit2Change(Sender: TObject);
begin
  Form1.Edit2.Enabled := False;
  Form1.Edit3.Text := '';
  val(Edit2.Text, nomer_uin[2]);
end;

procedure TForm2.Edit2KeyPress(Sender: TObject; var Key: char);
begin
    // Разрешаем вводить знак УИН только цифрами
   Edit2.ReadOnly:= not (Key in ['0'..'9',#8]);
   Form2.Edit20.Text := 'X';
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin
  Form1.Edit2.Enabled := False;
  Form1.Edit3.Text := '';
  val(Edit3.Text, nomer_uin[3]);
end;

procedure TForm2.Edit3KeyPress(Sender: TObject; var Key: char);
begin
    // Разрешаем вводить знак УИН только цифрами
   Edit3.ReadOnly:= not (Key in ['0'..'9',#8]);
   Form2.Edit20.Text := 'X';
end;

procedure TForm2.Edit4Change(Sender: TObject);
begin
  Form1.Edit2.Enabled := False;
  Form1.Edit3.Text := '';
  val(Edit4.Text, nomer_uin[4]);
end;

procedure TForm2.Edit4KeyPress(Sender: TObject; var Key: char);
begin
    // Разрешаем вводить знак УИН только цифрами
   Edit4.ReadOnly:= not (Key in ['0'..'9',#8]);
   Form2.Edit20.Text := 'X';
end;

procedure TForm2.Edit5Change(Sender: TObject);
begin
  Form1.Edit2.Enabled := False;
  Form1.Edit3.Text := '';
  val(Edit5.Text, nomer_uin[5]);
end;

procedure TForm2.Edit5KeyPress(Sender: TObject; var Key: char);
begin
    // Разрешаем вводить знак УИН только цифрами
   Edit5.ReadOnly:= not (Key in ['0'..'9',#8]);
   Form2.Edit20.Text := 'X';
end;

procedure TForm2.Edit6Change(Sender: TObject);
begin
  Form1.Edit2.Enabled := False;
  Form1.Edit3.Text := '';
  val(Edit6.Text, nomer_uin[6]);
end;

procedure TForm2.Edit6KeyPress(Sender: TObject; var Key: char);
begin
      // Разрешаем вводить знак УИН только цифрами
   Edit6.ReadOnly:= not (Key in ['0'..'9',#8]);
   Form2.Edit20.Text := 'X';
end;

procedure TForm2.Edit7Change(Sender: TObject);
begin
  Form1.Edit2.Enabled := False;
  Form1.Edit3.Text := '';
  val(Edit7.Text, nomer_uin[7]);
end;

procedure TForm2.Edit7KeyPress(Sender: TObject; var Key: char);
begin
      // Разрешаем вводить знак УИН только цифрами
   Edit7.ReadOnly:= not (Key in ['0'..'9',#8]);
   Form2.Edit20.Text := 'X';
end;

procedure TForm2.Edit8Change(Sender: TObject);
begin
  Form1.Edit2.Enabled := False;
  Form1.Edit3.Text := '';
  val(Edit8.Text, nomer_uin[8]);
end;


procedure TForm2.Edit8KeyPress(Sender: TObject; var Key: char);
begin
    // Разрешаем вводить знак УИН только цифрами
   Edit8.ReadOnly:= not (Key in ['0'..'9',#8]);
   Form2.Edit20.Text := 'X';
end;

procedure TForm2.FormClose(Sender: TObject);
begin
   // При повторном открытии окна 2 оно сохранит предыидущее местоположение
   // Первоначальное место расположения окна -
   // в центре экрана (Form2.Position:=poDesktopCenter)
   Form2.Position:=poDesigned;
   Form1.ComboBox2.Enabled:=True;

   // Если выбран вариант - 'ст. КоАП';
   if Form1.ComboBox2.Itemindex=0 then
   begin
     nomer_uin[6] := 0; nomer_uin[7] := 0;
   end;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  // Окно - в центр экрана
  Form2.Position:=poDesktopCenter;
end;


procedure TForm2.RadioButton1Change(Sender: TObject);
begin

  Label8.Caption:='06'; Label9.Caption:='07';

  Edit6.Enabled:=False;
  Edit7.Enabled:=False;

  if  Form2.Visible=True then Form1.ComboBox2.Enabled:=True;

end;

procedure TForm2.RadioButton2Change(Sender: TObject);
begin

  Label8.Caption:='06->'; Label9.Caption:='07->';

  // Код источника доходов открыт для редактирования
  Edit6.Enabled:=True;
  Edit7.Enabled:=True;

  if  Form2.Visible=True then
  begin
    Form1.ComboBox2.Enabled:=False;
    Form1.ComboBox2.Text:='ст. КоАП';
    Form1.Edit2.Enabled := False;
    Form1.Edit2.Text := '';
    Form1.Edit3.Text := '';
  end;

end;


end.


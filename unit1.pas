unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Menus, ComCtrls,
  // Добавляем возможность обращаться к форме 2
  Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    StatusBar1: TStatusBar;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: char);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure StaticText4Click(Sender: TObject);

  private
    { private declarations }

  public
    { public declarations }
  end;

var

 Form1: TForm1;
 // Задаем нужные переменные
 nomer_post_mass: array[1..9] of integer;
 nomer_post_stroka: string[9];
 nomer_uin: array[1..20] of integer;
 Flag_okno: integer;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.Button2Click(Sender: TObject);
begin

  // Выход из программы
  Close;

end;

procedure TForm1.Button3Click(Sender: TObject);
Label exit_loop4;
begin


// Если один раз уже ответили на вопрос положительно, больше не спрашиваем
// Flag_okno=0, если ранее согласия на изменение знаков не давали
 if Flag_okno=1 then  goto exit_loop4;
     if MessageDlg('Изменить знаки УИН? После выхода из программы знаки снова примут значения по умолчанию.',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
// Если один раз уже ответили на вопрос положительно,
// то запоминаем это в переменной Flag_okno=1;
        Flag_okno:=1;
exit_loop4:

          if Form2.RadioButton1.Checked=False then
             begin
               Form1.ComboBox2.Enabled:=False;
               Form1.ComboBox2.Text:='ст. КоАП';
               Form1.Edit2.Enabled := False;
               Form1.Edit2.Text := '';
             end;

          Form2.Edit1.Text := FloatToStr(nomer_uin[1]);
          Form2.Edit2.Text := FloatToStr(nomer_uin[2]);
          Form2.Edit3.Text := FloatToStr(nomer_uin[3]);
          Form2.Edit4.Text := FloatToStr(nomer_uin[4]);
          Form2.Edit5.Text := FloatToStr(nomer_uin[5]);
          Form2.Edit6.Text := FloatToStr(nomer_uin[6]);
          Form2.Edit7.Text := FloatToStr(nomer_uin[7]);
          Form2.Edit8.Text := FloatToStr(nomer_uin[8]);
          Form2.Edit9.Text := FloatToStr(nomer_uin[9]);
          Form2.Edit10.Text := FloatToStr(nomer_uin[10]);
          Form2.Edit11.Text := FloatToStr(nomer_uin[11]);
          Form2.Edit12.Text := FloatToStr(nomer_uin[12]);
          Form2.Edit13.Text := FloatToStr(nomer_uin[13]);
          Form2.Edit14.Text := FloatToStr(nomer_uin[14]);
          Form2.Edit15.Text := FloatToStr(nomer_uin[15]);
          Form2.Edit16.Text := FloatToStr(nomer_uin[16]);
          Form2.Edit17.Text := FloatToStr(nomer_uin[17]);
          Form2.Edit18.Text := FloatToStr(nomer_uin[18]);
          Form2.Edit19.Text := FloatToStr(nomer_uin[19]);
          Form2.Show;
      end;
 end;


procedure TForm1.ComboBox1Change(Sender: TObject);
begin

   Form1.Edit2.Enabled := False;
   Form1.Edit3.Text := '';

  // Задаем код года выдачи постановления - это две последние цифры года
   nomer_uin[10] :=  StrToInt(ComboBox1.Text) mod 10;
   nomer_uin[9] :=  (StrToInt(ComboBox1.Text) div 10) mod 10;

   Form2.Edit9.Text := FloatToStr(nomer_uin[9]);
   Form2.Edit10.Text := FloatToStr(nomer_uin[10]);
   Form2.Edit20.Text := 'X';

end;


procedure TForm1.ComboBox2Change(Sender: TObject);
begin

   Form1.Edit2.Enabled := False;
   Form1.Edit3.Text := '';

   // В зависиомсти от ст.КоАП присваиваем код источника дохода

   //Выбран вариант - 'ст. КоАП';
   if ComboBox2.Itemindex=0 then
   begin
     Form1.Edit2.Text := 'КБК';
     nomer_uin[6] := 0; nomer_uin[7] := 0;
   end;

   if ComboBox2.Text= 'ст. 6.24' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 90040 04 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 4;
   end;

   if ComboBox2.Text= 'ст. 6.25' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 90040 04 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 4;
   end;

   if ComboBox2.Text= 'ст. 8.22' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 25050 01 6000 140';
        nomer_uin[6] := 3; nomer_uin[7] := 5;
   end;

   if ComboBox2.Text= 'ст. 8.23' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 25050 01 6000 140';
        nomer_uin[6] := 3; nomer_uin[7] := 5;
   end;

   if ComboBox2.Text = 'ст. 11.14.2' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 30020 01 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 0;
   end;

   if ComboBox2.Text = 'ст. 11.22' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 90010 01 6000 140';
        nomer_uin[6] := 3; nomer_uin[7] := 2;
   end;

      if ComboBox2.Text = 'ст. 11.23' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 29000 01 6000 140';
        nomer_uin[6] := 2; nomer_uin[7] := 8;
   end;

   if ComboBox2.Text = 'ст. 11.29' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 29000 01 6000 140';
        nomer_uin[6] := 2; nomer_uin[7] := 8;
   end;

   if ComboBox2.Text = 'ст. 11.31' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 48000 01 6000 140';
        nomer_uin[6] := 3; nomer_uin[7] := 3;
   end;

   if ComboBox2.Text = 'ст. 11.33' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 30020 01 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 0;
   end;

   if ComboBox2.Text = 'ст. 12.21.1' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 30011 01 6000 140';
        nomer_uin[6] := 2; nomer_uin[7] := 9;
   end;

   if ComboBox2.Text = 'ст. 12.21.2' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 29000 01 6000 140';
        nomer_uin[6] := 2; nomer_uin[7] := 8;
   end;

   if ComboBox2.Text = 'ст. 12.23' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 30020 01 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 0;
   end;

   if ComboBox2.Text = 'ст. 12.31.1' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 30020 01 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 0;
   end;

   if ComboBox2.Text = 'ст. 14.1' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 90040 04 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 4;
   end;

   if ComboBox2.Text = 'ст. 14.1.2' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 90040 04 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 4;
   end;

   if ComboBox2.Text= 'ст. 14.43' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 01000 01 6000 140';
        nomer_uin[6] := 2; nomer_uin[7] := 3;
   end;

   if ComboBox2.Text = 'ст. 19.4' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 90040 04 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 4;
   end;

   if ComboBox2.Text = 'ст. 19.5' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 90040 04 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 4;
   end;

   if ComboBox2.Text = 'ст. 19.7' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 90040 04 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 4;
   end;

   if ComboBox2.Text = 'ст. 19.7.5-1' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 90040 04 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 4;
   end;

   if ComboBox2.Text = 'ст. 19.20' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 90040 04 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 4;
   end;

   if ComboBox2.Text = 'ст. 20.25' then
   begin
        Form1.Edit2.Text := 'КБК 106 1 16 43000 01 6000 140';
        nomer_uin[6] := 4; nomer_uin[7] := 2;
   end;

  Form2.Edit6.Text := FloatToStr(nomer_uin[6]);
  Form2.Edit7.Text := FloatToStr(nomer_uin[7]);
  Form2.Edit20.Text := 'X';
end;


procedure TForm1.ComboBox2KeyPress(Sender: TObject; var Key: char);
begin

 // Проверяем нажатую клавишу
 // и запрещаем ввод с клавиатуры
 case Key of
    #0: key:=#0;
   else key:=#0;
 end;

end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
   Form1.Edit2.Enabled := False;
   Form1.Edit3.Text := '';
   if ComboBox3.Text= 'Гражданин / водитель' then
   begin
        nomer_uin[13] := 1;
   end;
   if ComboBox3.Text= 'Индивидуальный предприниматель' then
   begin
        nomer_uin[13] := 2;
   end;
   if ComboBox3.Text= 'Должностное лицо' then
   begin
        nomer_uin[13] := 3;
   end;
   if ComboBox3.Text= 'Юридическое лицо' then
   begin
        nomer_uin[13] := 4;
   end;

   Form1.Label1.Caption := '№ :  '+FloatToStr(nomer_uin[11])+'0'+FloatToStr(nomer_uin[13]);
   Form2.Edit13.Text := FloatToStr(nomer_uin[13]);
   Form2.Edit20.Text := 'X';

end;

procedure TForm1.ComboBox4Change(Sender: TObject);
begin
 Form1.Edit2.Enabled := False;
 Form1.Edit3.Text := '';
 if ComboBox4.Text= 'Постановление' then
 begin
        nomer_uin[11] := 6;
  end;
 if ComboBox4.Text= 'Протокол' then
 begin
        nomer_uin[11] :=  7;
 end;

 Form1.Label1.Caption := '№ :  '+FloatToStr(nomer_uin[11])+'0'+FloatToStr(nomer_uin[13]);
 Form2.Edit11.Text := FloatToStr(nomer_uin[11]);
 Form2.Edit20.Text := 'X';

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
   Form1.Edit2.Enabled := False;
   Form1.Edit3.Text := '';
   // Form2.Edit11.Text := 'X';
   // Form2.Edit12.Text := 'X';
   // Form2.Edit13.Text := 'X';
   Form2.Edit14.Text := 'X';
   Form2.Edit15.Text := 'X';
   Form2.Edit16.Text := 'X';
   Form2.Edit17.Text := 'X';
   Form2.Edit18.Text := 'X';
   Form2.Edit19.Text := 'X';
   Form2.Edit20.Text := 'X';
end;


procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin

 // Разрешаем вводить номер постановления только цифрами
 // Проверяем нажатую клавишу
 Edit1.ReadOnly:= not (Key in ['0'..'9',#8]);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

 // Задаем место расположения окна - в центре экрана
 Form1.Position:=poDesktopCenter;

 // Признак открытия второго окна устанавливаем равным нулю.
 // Это будет означать, что второе окно не открывалось, а значит
 // просим разрешение на его открытие
 Flag_okno:=0;

 // Задаем значения разрядам УИН по умолчанию для УГАДН по Тверской области
 // Код КБК Ространснадзора: 106
 nomer_uin[1] := 1; nomer_uin[2] := 0; nomer_uin[3] := 6;
 // Код территории, для Тверской области: 36
 nomer_uin[4] := 3; nomer_uin[5] := 6;
 // Код принадлежности к отраслевому управлению, для Госавтодорнадзора: 2
 nomer_uin[8] := 2;

 nomer_uin[11] := 6; nomer_uin[12] := 0; nomer_uin[13] := 1;

 // Запретим редактировать поле Год
 ComboBox1.ReadOnly:=True;
 ComboBox1.Style := csDropDownList;

  // Запретим редактировать поле ст. КоАП РФ
 ComboBox2.ReadOnly:=True;
 ComboBox2.Style := csDropDownList;
 ComboBox2.Text:='ст. КоАП';

 // Запретим редактировать поле Субъект
 ComboBox3.ReadOnly:=True;
 ComboBox3.Style := csDropDownList;
 ComboBox3.Text:='Гражданин / водитель';

  // Запретим редактировать поле Постановление/Протокол
 ComboBox4.ReadOnly:=True;
 ComboBox4.Style := csDropDownList;
 ComboBox4.Text:='Постановление';

 // При открытии главного окна по умолчанию отобразим текущий год
 // в окне выбора года
 ComboBox1.Text:=FloatToStr(CurrentYear);

 // Задаем код года выдачи постановления - это две последние цифры года
 nomer_uin[10] :=  CurrentYear mod 10;
 nomer_uin[9] :=  (CurrentYear div 10) mod 10;

end;

procedure TForm1.Label5Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);

var i: integer;
Label exit_loop4, exit_loop5;

begin

// Если один раз уже ответили на вопрос положительно, больше не спрашиваем
// Flag_okno=0, если ранее согласия на изменение знаков не давали
 if Flag_okno=1 then  goto exit_loop4;
     if MessageDlg('Изменить знаки УИН? После выхода из программы знаки снова примут значения по умолчанию.',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
// Если один раз уже ответили на вопрос положительно,
// то запоминаем это в переменной Flag_okno=1;
        Flag_okno:=1;
exit_loop4:

        // Последние 6 знаков массива, который должен содержать 9 цифр постановления,
        // изначально заполняем нулями
        nomer_post_mass[1] := nomer_uin[11];
        nomer_post_mass[2] := nomer_uin[12];
        nomer_post_mass[3] := nomer_uin[13];
        nomer_post_mass[4] := 0;
        nomer_post_mass[5] := 0;
        nomer_post_mass[6] := 0;
        nomer_post_mass[7] := 0;
        nomer_post_mass[8] := 0;
        nomer_post_mass[9] := 0;

        if Edit1.Text <> '' then
        begin
             // Заносим в массив, содержащий цифры постановления, введенный номер постановления
             for i := 1 to length(Edit1.Text) do begin
                 // Проверяем поле номера постановления на наличие символов, отличных от цифр
                 if (Edit1.Text[i] <> '0') and
                 (Edit1.Text[i] <> '1') and
                 (Edit1.Text[i] <> '2') and
                 (Edit1.Text[i] <> '3') and
                 (Edit1.Text[i] <> '4') and
                 (Edit1.Text[i] <> '5') and
                 (Edit1.Text[i] <> '6') and
                 (Edit1.Text[i] <> '7') and
                 (Edit1.Text[i] <> '8') and
                 (Edit1.Text[i] <> '9') then
                 begin
                      ShowMessage('Номер постановления или протокола должен состоять только из цифр');
                goto exit_loop5;
                end;
                val(Edit1.Text[i], nomer_post_mass[i+9-length(Edit1.Text)]);
             end;
        end;

        for i := 11 to 19 do begin
            nomer_uin[i]:= nomer_post_mass[i-10];
        end;

//////////////////////////////////////////////////////////////////////
        if Form2.RadioButton1.Checked=False then
            begin
               Form1.ComboBox2.Enabled:=False;
               Form1.ComboBox2.Text:='ст. КоАП';
               Form1.Edit2.Enabled := False;
               Form1.Edit2.Text := '';
            end;

         Form2.Edit1.Text := FloatToStr(nomer_uin[1]);
         Form2.Edit2.Text := FloatToStr(nomer_uin[2]);
         Form2.Edit3.Text := FloatToStr(nomer_uin[3]);
         Form2.Edit4.Text := FloatToStr(nomer_uin[4]);
         Form2.Edit5.Text := FloatToStr(nomer_uin[5]);
         Form2.Edit6.Text := FloatToStr(nomer_uin[6]);
         Form2.Edit7.Text := FloatToStr(nomer_uin[7]);
         Form2.Edit8.Text := FloatToStr(nomer_uin[8]);
         Form2.Edit9.Text := FloatToStr(nomer_uin[9]);
         Form2.Edit10.Text := FloatToStr(nomer_uin[10]);

        if Edit1.Text <> '' then
         begin
           Form2.Edit11.Text := FloatToStr(nomer_uin[11]);
           Form2.Edit12.Text := FloatToStr(nomer_uin[12]);
           Form2.Edit13.Text := FloatToStr(nomer_uin[13]);
           Form2.Edit14.Text := FloatToStr(nomer_uin[14]);
           Form2.Edit15.Text := FloatToStr(nomer_uin[15]);
           Form2.Edit16.Text := FloatToStr(nomer_uin[16]);
           Form2.Edit17.Text := FloatToStr(nomer_uin[17]);
           Form2.Edit18.Text := FloatToStr(nomer_uin[18]);
           Form2.Edit19.Text := FloatToStr(nomer_uin[19]);
         end
           else
         begin
           //Form2.Edit11.Text := 'X';
           //Form2.Edit12.Text := 'X';
           //Form2.Edit13.Text := 'X';
           Form2.Edit14.Text := 'X';
           Form2.Edit15.Text := 'X';
           Form2.Edit16.Text := 'X';
           Form2.Edit17.Text := 'X';
           Form2.Edit18.Text := 'X';
           Form2.Edit19.Text := 'X';
         end;
         Form2.Show;
         // Фокус на кнопку ОК
         Form2.Button1.SetFocus;
     end;
 exit_loop5:
 end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
    // Выход из программы
  Close;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin

 // Вернуть значения знаков УИН по умолчанию

 // Задаем значения разрядам УИН по умолчанию для УГАДН по Тверской области
 // Код КБК Ространснадзора: 106
 nomer_uin[1] := 1; nomer_uin[2] := 0; nomer_uin[3] := 6;
 // Код территории, для Тверской области: 36
 nomer_uin[4] := 3; nomer_uin[5] := 6;

 // Код принадлежности к отраслевому управлению, для Госавтодорнадзора: 2
 nomer_uin[8] := 2;

 // При открытии главного окна по умолчанию отобразим текущий год
 // в окне выбора года
 ComboBox1.Text:=FloatToStr(CurrentYear);

 ComboBox2.Text:='ст. КоАП';

 ComboBox3.Text:='Гражданин / водитель';
 nomer_uin[11] := 6; nomer_uin[12] := 0; nomer_uin[13] := 1;
 Form1.Label1.Caption := '№ :  '+FloatToStr(nomer_uin[11])+'0'+FloatToStr(nomer_uin[13]);
 ComboBox4.Text:='Постановление';

 Form2.Edit11.Text := FloatToStr(nomer_uin[11]);
 Form2.Edit12.Text := FloatToStr(nomer_uin[12]);
 Form2.Edit13.Text := FloatToStr(nomer_uin[13]);

 // Задаем код года выдачи постановления - это две последние цифры года
 nomer_uin[10] :=  CurrentYear mod 10;
 nomer_uin[9] :=  (CurrentYear div 10) mod 10;

 Form2.Edit1.Text := FloatToStr(nomer_uin[1]);
 Form2.Edit2.Text := FloatToStr(nomer_uin[2]);
 Form2.Edit3.Text := FloatToStr(nomer_uin[3]);
 Form2.Edit4.Text := FloatToStr(nomer_uin[4]);
 Form2.Edit5.Text := FloatToStr(nomer_uin[5]);
 Form2.Edit8.Text := FloatToStr(nomer_uin[8]);
 Form2.Edit9.Text := FloatToStr(nomer_uin[9]);
 Form2.Edit10.Text := FloatToStr(nomer_uin[10]);

 // Очищаем поля ввода
 Form1.Edit1.Caption := '';
 Form1.Edit2.Caption := 'КБК';
 Form1.Edit3.Caption := '';
 Form2.Edit20.Text := 'X';

 // Поля ст.КоАП по умолчанию
 Form2.RadioButton1.Checked:=True;
 nomer_uin[6] := 0; nomer_uin[7] := 0;
 Form2.Edit6.Text := '0';
 Form2.Edit7.Text := '0';

end;

procedure TForm1.StaticText4Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);

var i, summ_proisv: integer;
// Зададим метку для обхода процедуры определения УИН
Label exit_loop;

begin

 // Очищаем поле с УИН
 // Делаем поле с УИН недоступным для копирования
 Form1.Edit3.Caption:='';
 Form2.Edit20.Text := 'X';

 // Если открыта 2-я форма, проверяем наличие в ней пустых полей знаков
 // Если поле знака пустое -> Выход
  if Form2.Visible = True then
  begin
    // Знак УИН не введен -> Выход
    if (Form2.Edit1.Text = '') or (Form2.Edit2.Text = '') or (Form2.Edit3.Text = '') or
       (Form2.Edit4.Text = '') or (Form2.Edit5.Text = '') or (Form2.Edit6.Text = '') or
       (Form2.Edit7.Text = '') or (Form2.Edit8.Text = '') then
       begin
         ShowMessage('Знаки УИН должны состоять из цифр');
         goto exit_loop;
       end;
    end;

 // Номер постановления не введен
 if Edit1.Text = '' then
 begin
   ShowMessage('Введите номер постановления или протокола');
   // Выход с обходом процедуры определения УИН
   goto exit_loop;
 end;

 // Массив, который должен содержать 9 цифр постановления, изначально заполняем нулями
 nomer_post_mass[1] := nomer_uin[11];
 nomer_post_mass[2] := nomer_uin[12];
 nomer_post_mass[3] := nomer_uin[13];
 nomer_post_mass[4] := 0;
 nomer_post_mass[5] := 0;
 nomer_post_mass[6] := 0;
 nomer_post_mass[7] := 0;
 nomer_post_mass[8] := 0;
 nomer_post_mass[9] := 0;

 // Заносим в массив, содержащий цифры постановления, введенный номер постановления
 for i := 1 to length(Edit1.Text) do begin
 // Проверяем поле номера постановления на наличие символов, отличных от цифр
  if (Edit1.Text[i] <> '0') and
     (Edit1.Text[i] <> '1') and
     (Edit1.Text[i] <> '2') and
     (Edit1.Text[i] <> '3') and
     (Edit1.Text[i] <> '4') and
     (Edit1.Text[i] <> '5') and
     (Edit1.Text[i] <> '6') and
     (Edit1.Text[i] <> '7') and
     (Edit1.Text[i] <> '8') and
     (Edit1.Text[i] <> '9') then
     begin
         ShowMessage('Номер постановления или протокола должен состоять только из цифр');
         // Выход с обходом процедуры определения УИН
         goto exit_loop;
     end;
     val(Edit1.Text[i], nomer_post_mass[i+9-length(Edit1.Text)]);
 end;

 // Номер ст. КоАП не выбран
 if (ComboBox2.Itemindex=0) and (ComboBox2.Enabled=True) then
 begin
   Form2.Edit6.Text := '0'; Form2.Edit7.Text := '0';
   ShowMessage('Выберите ст. КоАП');
   // Выход с обходом процедуры определения УИН
   goto exit_loop;
 end;

 if ComboBox2.Itemindex<>0 then Form2.RadioButton1.Checked:=True;

 for i := 11 to 19 do begin
  nomer_uin[i]:= nomer_post_mass[i-10];
 end;

  // Рассчитываем сумму произведений значений разрядов УИН
  // на весовые параметры от 1 до 10, начиная с 1.
  summ_proisv := nomer_uin[1] * 1 + nomer_uin[2] * 2 + nomer_uin[3] * 3;
  summ_proisv := summ_proisv + nomer_uin[4] * 4 + nomer_uin[5] * 5;
  summ_proisv := summ_proisv + nomer_uin[6] * 6 + nomer_uin[7] * 7;
  summ_proisv := summ_proisv + nomer_uin[8] * 8 + nomer_uin[9] * 9 + nomer_uin[10] * 10;
  summ_proisv := summ_proisv + nomer_uin[11] * 1 + nomer_uin[12] * 2;
  summ_proisv := summ_proisv + nomer_uin[13] * 3 + nomer_uin[14] * 4;
  summ_proisv := summ_proisv + nomer_uin[15] * 5 + nomer_uin[16] * 6;
  summ_proisv := summ_proisv + nomer_uin[17] * 7 + nomer_uin[18] * 8;
  summ_proisv := summ_proisv + nomer_uin[19] * 9;

  // Рассчитываем контрольный разряд УИН
  nomer_uin[20] :=  summ_proisv mod 11;

  // Если контрольный разряд УИН равен 10, заново
  // рассчитываем сумму произведений значений разрядов УИН
  // на весовые параметры от 1 до 10, но уже начиная с 3.
  if nomer_uin[20] = 10 then
  begin
    summ_proisv := nomer_uin[1] * 3 + nomer_uin[2] * 4 + nomer_uin[3] * 5;
    summ_proisv := summ_proisv + nomer_uin[4] * 6 + nomer_uin[5] * 7;
    summ_proisv := summ_proisv + nomer_uin[6] * 8 + nomer_uin[7] * 9;
    summ_proisv := summ_proisv + nomer_uin[8] * 10 + nomer_uin[9] * 1 + nomer_uin[10] * 2;
    summ_proisv := summ_proisv + nomer_uin[11] * 3 + nomer_uin[12] * 4;
    summ_proisv := summ_proisv + nomer_uin[13] * 5 + nomer_uin[14] * 6;
    summ_proisv := summ_proisv + nomer_uin[15] * 7 + nomer_uin[16] * 8;
    summ_proisv := summ_proisv + nomer_uin[17] * 9 + nomer_uin[18] * 10;
    summ_proisv := summ_proisv + nomer_uin[19] * 1;
    // Заново рассчитываем контрольный разряд УИН
    nomer_uin[20] :=  summ_proisv mod 11;
  end;

  // Если контрольный разряд УИН снова равен 10, присваеваем ему значение 0
  if nomer_uin[20] = 10 then nomer_uin[20] := 0;

 // Выводим номер УИН с 20-м контрольным разрядом
  Form1.Edit3.Caption:=FloatToStr(nomer_uin[1])+FloatToStr(nomer_uin[2])+
  FloatToStr(nomer_uin[3])+' '+FloatToStr(nomer_uin[4])+FloatToStr(nomer_uin[5])+' '+
  FloatToStr(nomer_uin[6])+FloatToStr(nomer_uin[7])+' '+FloatToStr(nomer_uin[8])+
  FloatToStr(nomer_uin[9])+FloatToStr(nomer_uin[10])+' '+FloatToStr(nomer_uin[11])+
  FloatToStr(nomer_uin[12])+FloatToStr(nomer_uin[13])+FloatToStr(nomer_uin[14])+
  FloatToStr(nomer_uin[15])+FloatToStr(nomer_uin[16])+FloatToStr(nomer_uin[17])+
  FloatToStr(nomer_uin[18])+FloatToStr(nomer_uin[19])+' '+FloatToStr(nomer_uin[20]);

  // Делаем поле вывода УИН доступным для копирования
  Form1.Edit3.Enabled:=True;

  if Form2.RadioButton1.Checked=True then Edit2.Enabled:=True;

   Form2.Edit11.Text := FloatToStr(nomer_uin[11]);
   Form2.Edit12.Text := FloatToStr(nomer_uin[12]);
   Form2.Edit13.Text := FloatToStr(nomer_uin[13]);
   Form2.Edit14.Text := FloatToStr(nomer_uin[14]);
   Form2.Edit15.Text := FloatToStr(nomer_uin[15]);
   Form2.Edit16.Text := FloatToStr(nomer_uin[16]);
   Form2.Edit17.Text := FloatToStr(nomer_uin[17]);
   Form2.Edit18.Text := FloatToStr(nomer_uin[18]);
   Form2.Edit19.Text := FloatToStr(nomer_uin[19]);
   Form2.Edit20.Text := FloatToStr(nomer_uin[20]);

   if Flag_okno=0 then
   begin
        Form2.Edit1.Text := FloatToStr(nomer_uin[1]);
        Form2.Edit2.Text := FloatToStr(nomer_uin[2]);
        Form2.Edit3.Text := FloatToStr(nomer_uin[3]);
        Form2.Edit4.Text := FloatToStr(nomer_uin[4]);
        Form2.Edit5.Text := FloatToStr(nomer_uin[5]);
        Form2.Edit6.Text := FloatToStr(nomer_uin[6]);
        Form2.Edit7.Text := FloatToStr(nomer_uin[7]);
        Form2.Edit8.Text := FloatToStr(nomer_uin[8]);
        Form2.Edit9.Text := FloatToStr(nomer_uin[9]);
        Form2.Edit10.Text := FloatToStr(nomer_uin[10]);

   end;

   // Метка для обхода определения УИН в случае,
   // если не выбрана ст. КоАП, не введен номер постановления
   // или номер постановления или знаки УИН не содержат только цифры
   exit_loop:

end;


end.


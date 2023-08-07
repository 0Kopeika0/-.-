unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.Menus,ShellAPI,
  Vcl.OleCtrls, SHDocVw;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    RadioButton1: TRadioButton;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Label4: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Button3: TButton;
    Button4: TButton;
    Label11: TLabel;
    Label12: TLabel;
    Edit3: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    N4: TMenuItem;
    procedure Button8Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure SringGrid(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  {���������� ����� �����}
  massiv = array of integer;
  BmassivB = array of byte;
  Pmassiv = ^massiv;
  PPmassiv = ^BmassivB;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// ������ ���������� ���������� ���������
// ----------------------------------------------------------------------------//
procedure sort1(memoryA: Pmassiv; n:integer); stdcall;
external 'C:\Users\����\Desktop\���� � � ������\��������\���������\����������\Win32\Debug\Project1.dll';
// ----------------------------------------------------------------------------//

// ������ ���������� ���������� ������� ������� �������
// ----------------------------------------------------------------------------//
procedure sort2(memoryB,memoryC: Pmassiv; n:integer); stdcall;
external 'C:\Users\����\Desktop\���� � � ������\��������\���������\����������\Win32\Debug\Project1.dll';
// ----------------------------------------------------------------------------//

// ������ ���������� ���������� ��������
// ----------------------------------------------------------------------------//
procedure sort3(memoryD: Pmassiv; last, n:integer); stdcall;
external 'C:\Users\����\Desktop\���� � � ������\��������\���������\����������\Win32\Debug\Project1.dll';

// ������ ���������� ������� ����������
// ----------------------------------------------------------------------------//
procedure sort4(memoryE: Pmassiv; fist,last:integer); stdcall;
external 'C:\Users\����\Desktop\���� � � ������\��������\���������\����������\Win32\Debug\Project1.dll';
// ----------------------------------------------------------------------------//

// ������ ���������� ���������� ���������
// ----------------------------------------------------------------------------//
procedure sort5(memoryF,memoryH: PPmassiv; n:integer); stdcall;
external 'C:\Users\����\Desktop\���� � � ������\��������\���������\����������\Win32\Debug\Project1.dll';
// ----------------------------------------------------------------------------//

// �������� �� ���������� ���������� ��������� � ������� ������� �� ���� LABLE
// ----------------------------------------------------------------------------//
procedure TForm1.Button8Click(Sender: TObject);
var
  n: integer;
begin
  n := StrToInt(Edit1.Text);
  StringGrid1.ColCount := n + 1;
end;
// ----------------------------------------------------------------------------//

// �������� �� ���������� ������� ���������� ���������
// ----------------------------------------------------------------------------//
procedure TForm1.Button2Click(Sender: TObject);
var
  n, i: integer;
begin
  n := StrToInt(Edit1.Text);
  for i := 1 to n do
    StringGrid1.Cells[i, 0] := IntToStr(random(100));
  Button3.Enabled:=false;
end;
// ----------------------------------------------------------------------------//

// �������� �� ���������� ������� ���������� �� �����
// ----------------------------------------------------------------------------//
procedure TForm1.Button5Click(Sender: TObject);
var
  f: TextFile;
  name, element: string;
  count: integer;
begin
  count:=0;
  name:= Edit2.Text ;
  AssignFile(f,name);
  Reset(f);
  while (not EOF(f)) do begin
    count:=count+1;
    Readln(f,element);
    StringGrid1.Cells[count, 0] := element;
    Button2.Enabled:=false;
  end;
  CloseFile(f);
end;
// ----------------------------------------------------------------------------//

// �������� �� ���������� ������� ���������� � ����
// ----------------------------------------------------------------------------//
procedure TForm1.Button4Click(Sender: TObject);
var
  f: TextFile;
  name, element: string;
  count,i,n: integer;
begin
  count:=0;
  n:=StrToInt(Edit1.Text);
  name:= Edit3.Text ;
  AssignFile(f,name);
  Rewrite(f);
  for i := 1 to n do begin
    count:=count+1;
    element:=StringGrid1.Cells[count, 0];
    Writeln(f,element);
  end;
  CloseFile(f);
end;
// ----------------------------------------------------------------------------//

// �������� �� ������ � MainMenu1
// ----------------------------------------------------------------------------//
procedure TForm1.N2Click(Sender: TObject);
begin
  if OpenDialog1.Execute()=true then
    begin
      Edit2.Text:=OpenDialog1.FileName;
    end;
end;
// ----------------------------------------------------------------------------//

// �������� �� ������ � MainMenu2
// ----------------------------------------------------------------------------//
procedure TForm1.N3Click(Sender: TObject);
begin
  if OpenDialog1.Execute()=true then
    begin
      Edit3.Text:=OpenDialog1.FileName;
    end;
end;
// ---------------------------------------------------------------------------//

// �������� �� �������� ����� ������
// ----------------------------------------------------------------------------//
procedure TForm1.N4Click(Sender: TObject);
var name:string;
begin
  name:='C:\Users\����\Desktop\���� � � ������\��������\���������\������.docx';
  ShellExecute(0, 'open', PChar(name), nil, nil, SW_SHOWNORMAL);
end;
// ----------------------------------------------------------------------------//

// ���������� ���������
// ----------------------------------------------------------------------------//
procedure TForm1.RadioButton1Click(Sender: TObject);
var
  A: massiv;
  memoryA:Pmassiv;
  n, i, j, p: integer;
  Start, Stop: cardinal;
  Elapsed: cardinal;
begin
  n:= StrToInt(Edit1.Text);
  SetLength(A,n);
  { ����������� ������� ������� A (N) � ��� ���������� }
  for i := 1 to n do
    A[i] := StrToInt(StringGrid1.Cells[i, 0]);

  Start:=GetTickCount; // ������� ������ ���������� ��������
  memoryA:=@A; // ������ � ���������� ����� ������� �
  sort1(memoryA,n);  // ������ ��������� � ���������� ����������

  // ������� ��������� ���������� ��������
  Stop:=GetTickCount; //������� ��������� ���������� ��������
  Elapsed:=Stop-Start;//����� � �������������
  Label10.Caption := IntToStr(Elapsed)+' ��';

  { ����� ���������������� ������� A }
  for i := 1 to n do
    StringGrid1.Cells[i, 0] := IntToStr(A[i]);

  Button2.Enabled:=true;
  Button3.Enabled:=true;
end;
// ----------------------------------------------------------------------------//

// ���������� ������� ������� �������
// ----------------------------------------------------------------------------//
procedure TForm1.RadioButton2Click(Sender: TObject);
var
  B, C: massiv;
  memoryB,memoryC:Pmassiv;
  n, i, j, p: integer;
  Start, Stop: cardinal;
  Elapsed: cardinal;
begin
  n:= StrToInt(Edit1.Text);
  SetLength(C,n);
  { ����������� ������� ������� B (N) � ��� ���������� }
  SetLength(B,n);
  for i := 1 to n do
    B[i] := StrToInt(StringGrid1.Cells[i, 0]);

  Start:=GetTickCount; // ������� ������ ���������� ��������

  memoryB:=@B; // ������ � ���������� ����� ������� B
  memoryC:=@C; // ������ � ���������� ����� ������� C
  sort2(memoryB,memoryC,n);  // ������ ��������� � ���������� ����������

  // ������� ��������� ���������� ��������
  Stop:=GetTickCount; //������� ��������� ���������� ��������
  Elapsed:=Stop-Start;//����� � �������������
  Label8.Caption := IntToStr(Elapsed)+' ��';

  { ����� ���������������� ������� C }
  for i := 1 to n do
    StringGrid1.Cells[i, 0] := IntToStr(C[i]);

  Button2.Enabled:=true;
  Button3.Enabled:=true;
end;
// ----------------------------------------------------------------------------//

// ���������� ��������
// ----------------------------------------------------------------------------//
procedure TForm1.RadioButton3Click(Sender: TObject);
var
  D: massiv;
  memoryD:Pmassiv;
  n, i: integer;
  Start, Stop: cardinal;
  Elapsed: cardinal;
begin
  { ����������� ������� ������� D (N) � ��� ���������� }
  n := StrToInt(Edit1.Text);
  SetLength(D,n);
  for i := 1 to n do
    D[i] := StrToInt(StringGrid1.Cells[i, 0]);

  Start:=GetTickCount; // ������� ������ ���������� ��������

  memoryD:=@D; // ������ � ���������� ����� ������� D
  sort3(memoryD,1,n);  // ������ ��������� � ���������� ����������

  // ������� ��������� ���������� ��������
  Stop:=GetTickCount; //������� ��������� ���������� ��������
  Elapsed:=Stop-Start;//����� � �������������
  Label7.Caption := IntToStr(Elapsed)+' ��';

  { ����� ���������������� ������� D }
  for i := 1 to n do
    StringGrid1.Cells[i, 0] := IntToStr(D[i]);
  Button2.Enabled:=true;
  Button3.Enabled:=true;
end;
// ----------------------------------------------------------------------------//

// ������� ����������
// ----------------------------------------------------------------------------//
procedure TForm1.RadioButton4Click(Sender: TObject);
var
  E: massiv;
  memoryE: Pmassiv;
  first, last, i, n: integer;
  Start, Stop: cardinal;
  Elapsed: cardinal;
begin
  { ����������� ������� ������� E � ��� ���������� }
  n := StrToInt(Edit1.Text);
  SetLength(E,n);
  for i := 1 to n do
    E[i] := StrToInt(StringGrid1.Cells[i, 0]);

  Start:=GetTickCount; // ������� ������ ���������� ��������

  memoryE:=@E; // ������ � ���������� ����� ������� E
  sort4(memoryE, 1, n);  // ������ ��������� � ���������� ����������

  // ������� ��������� ���������� ��������
  Stop:=GetTickCount; //������� ��������� ���������� ��������
  Elapsed:=Stop-Start;//����� � �������������
  Label6.Caption := IntToStr(Elapsed)+' ��';

  { ����� ���������������� ������� E }
  for i := 1 to n do
    StringGrid1.Cells[i, 0] := IntToStr(E[i]);
  Button2.Enabled:=true;
  Button3.Enabled:=true;
end;
// ----------------------------------------------------------------------------//

// ���������� ���������
// ----------------------------------------------------------------------------//
procedure TForm1.RadioButton5Click(Sender: TObject);
var
  F, H: BmassivB;
  memoryF,memoryH:PPmassiv;
  CC: massiv;
  n, i: integer;
  Start, Stop: cardinal;
  Elapsed: cardinal;
Begin
  n := StrToInt(Edit1.Text);
  SetLength(H,n);
  SetLength(CC,n);
  { ����������� ������� ������� F(N) � ��� ���������� }
  SetLength(F,n);
  for i := 1 to n do
    F[i] := StrToInt(StringGrid1.Cells[i, 0]);

  Start:=GetTickCount; // ������� ������ ���������� ��������

  memoryF:=@F; // ������ � ���������� ����� ������� F
  memoryH:=@H; // ������ � ���������� ����� ������� H
  sort5(memoryF,memoryH,n);  // ������ ��������� � ���������� ����������

  // ������� ��������� ���������� ��������
  Stop:=GetTickCount; //������� ��������� ���������� ��������
  Elapsed:=Stop-Start;//����� � �������������
  Label9.Caption := IntToStr(Elapsed)+' ��';

  { ����� ������� H }
  for i := 1 to n do
    StringGrid1.Cells[i, 0] := IntToStr(H[i]);
  Button1.Enabled:=true;
  Button2.Enabled:=true;
  Button3.Enabled:=true;
end;
// ----------------------------------------------------------------------------//

// ��������� �� ������ � ������ � ������ �������
// ----------------------------------------------------------------------------//
procedure TForm1.SringGrid(Sender: TObject);
begin
  StringGrid1.Cells[0, 0] := '��������'; //������ � ������� �������� � �������� 0
  BorderStyle:=bsSingle; //������ �� ���������� �����
end;
// ----------------------------------------------------------------------------//

end.

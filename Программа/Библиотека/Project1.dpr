library Project1;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes;

{$R *.res}

type
  massiv = array of integer;
  BmassivB = array of byte;
  Pmassiv = ^massiv;
  PPmassiv = ^BmassivB;
// ----------------------------------------------------------------------------//

// ���������� ���������
// ----------------------------------------------------------------------------//
procedure sort1(memoryA: Pmassiv; n:integer); stdcall;
var
  i,p,j:integer;
begin
  for i := 1 to n do
    for j := 1 to n - i do
      if memoryA^[j] > memoryA^[j + 1] then
        begin { ����� ��������� }
          p := memoryA^[j];
          memoryA^[j] := memoryA^[j + 1];
          memoryA^[j + 1] := p;
        end;
end;
// ----------------------------------------------------------------------------//

// ���������� ������� ������� �������
// ----------------------------------------------------------------------------//
procedure sort2(memoryB,memoryC: Pmassiv; n:integer); stdcall;
var
  i,j:integer;
begin
  for i := 1 to n do
  begin
    j := i;
    while (j > 1) and (memoryC^[j - 1] > memoryB^[i]) do
      begin
        memoryC^[j] := memoryC^[j - 1];
        j := j - 1;
      end;
      memoryC^[j] := memoryB^[i];
  end;
end;
// ----------------------------------------------------------------------------//

// ���������� ��������
// ----------------------------------------------------------------------------//
procedure Merge(var AA: massiv; first, last: integer);
var
  middle, Start, final, i: integer;
  BB: massiv;
begin
  SetLength(BB,1000000);
  middle := (first + last) div 2; { ���������� �������� �������� }
  Start := first; { ������ ����� ����� }
  final := middle + 1; { ������ ������ ����� }
  for i := first to last do { ��������� �� ������ �� ����� }
    if (Start <= middle) and ((final > last) or (AA[Start] < AA[final])) then
      begin
        BB[i] := AA[Start];
        inc(Start);
      end
    else
      begin
        BB[i] := AA[final];
        inc(final);
      end;
  { ����������� ���������� � ������ }
  for i := first to last do
    AA[i] := BB[i];
end;

procedure MergeSort(var AA: massiv; first, last: integer);
begin
  if first < last then
  begin
    MergeSort(AA, first, (first + last) div 2); { ���������� ����� ����� }
    MergeSort(AA, (first + last) div 2 + 1, last); { ���������� ������ ����� }
    Merge(AA, first, last); { ������� ���� ������ }
  end;
end;

procedure sort3(memoryD: Pmassiv; last, n:integer); stdcall;
begin
  {����� ����������� ���������}
  MergeSort(memoryD^, 1, n);
end;
// ----------------------------------------------------------------------------//

// ������� ����������
// ----------------------------------------------------------------------------//
procedure quicksort(var mas: massiv; first, last: integer);
var
  f, l, mid, count: integer;
begin
  f := first;
  l := last;
  mid := mas[(f + l) div 2]; { ���������� �������� �������� }
  repeat
    while mas[f] < mid do
      inc(f);
    while mas[l] > mid do
      dec(l);
    if f <= l then { ������������ ��������� }
    begin
      count := mas[f];
      mas[f] := mas[l];
      mas[l] := count;
      inc(f);
      dec(l);
    end;
  until f > l;
  if first < l then
    quicksort(mas, first, l);
  if f < last then
    quicksort(mas, f, last);
end;

procedure sort4(memoryE: Pmassiv; first, last: integer);
begin
  {����� ����������� ���������}
  quicksort(memoryE^,1,last);
end;
// ----------------------------------------------------------------------------//

// ���������� ���������
// ----------------------------------------------------------------------------//
procedure sort5(memoryF,memoryH: PPmassiv; n:integer); stdcall;
var
  CC: massiv;
  i: integer;
begin
  { ���������� ������ }
  SetLength(CC,n);
  for i := 0 to 255 do
    CC[i] := 0;
  for i := 1 to n do
    CC[memoryF^[i]] := CC[memoryF^[i]] + 1;
  for i := 1 to 255 do
    CC[i] := CC[i - 1] + CC[i];
  for i := n downto 1 do
    begin
      memoryH^[CC[memoryF^[i]]] := memoryF^[i];
      CC[memoryF^[i]] := CC[memoryF^[i]]-1;
      { ����� �� �������� ����������� ������ ���� ���������� ����� � ���� ������ }
    end;
end;
// ----------------------------------------------------------------------------//

Exports sort1, sort2, sort3, sort4, sort5;

begin
end.

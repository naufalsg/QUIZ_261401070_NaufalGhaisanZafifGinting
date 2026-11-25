program MatriksNilai;

const
  MAXB = 10;
  MAXK = 10;

type
  TMatriks = array[1..MAXB, 1..MAXK] of integer;

var
  m      : TMatriks;
  baris, kolom : integer;

procedure InputMatriks(var a: TMatriks; b, k: integer);
var
  i, j: integer;
begin
  for i := 1 to b do
    for j := 1 to k do
    begin
      write('Elemen [', i, ',', j, ']: ');
      readln(a[i, j]);
    end;
end;

procedure TampilMatriks(a: TMatriks; b, k: integer);
var
  i, j: integer;
begin
  for i := 1 to b do
  begin
    for j := 1 to k do
      write(a[i, j]:5);
    writeln;
  end;
end;

procedure Transpose(a: TMatriks; b, k: integer; var hasil: TMatriks);
var
  i, j: integer;
begin
  for i := 1 to b do
    for j := 1 to k do
      hasil[j, i] := a[i, j];
end;

function TotalBaris(a: TMatriks; r, k: integer): integer;
var
  j, total: integer;
begin
  total := 0;
  for j := 1 to k do
    total := total + a[r, j];
  TotalBaris := total;
end;

function TotalSemua(a: TMatriks; b, k: integer): integer;
var
  i, total: integer;
begin
  total := 0;
  for i := 1 to b do
    total := total + TotalBaris(a, i, k);
  TotalSemua := total;
end;

var
  t : TMatriks;
  i : integer;

begin
  write('Jumlah baris (1-', MAXB, ')  : '); readln(baris);
  write('Jumlah kolom (1-', MAXK, ')  : '); readln(kolom);
  writeln;

  InputMatriks(m, baris, kolom);

  writeln;
  writeln('Matriks:');
  TampilMatriks(m, baris, kolom);

  writeln;
  for i := 1 to baris do
    writeln('Total baris ', i, ': ', TotalBaris(m, i, kolom));
  writeln('Total semua  : ', TotalSemua(m, baris, kolom));

  Transpose(m, baris, kolom, t);
  writeln;
  writeln('Transpose:');
  TampilMatriks(t, kolom, baris);
  readln;
end.
program DataNilaiMahasiswa;

type
  TMhs = record
    nama  : string[30];
    tugas : real;
    uts   : real;
    uas   : real;
  end;
  TDataMhs = array[1..50] of TMhs;

var
  data : TDataMhs;
  n    : integer;

function HitungAkhir(m: TMhs): real;
begin
  HitungAkhir := 0.3 * m.tugas + 0.3 * m.uts + 0.4 * m.uas;
end;

function Grade(nilai: real): char;
begin
  if nilai >= 85 then
    Grade := 'A'
  else if nilai >= 70 then
    Grade := 'B'
  else if nilai >= 55 then
    Grade := 'C'
  else if nilai >= 40 then
    Grade := 'D'
  else
    Grade := 'E';
end;

procedure InputData(var d: TDataMhs; var n: integer);
var
  lagi: char;
begin
  n := 0;
  repeat
    n := n + 1;
    writeln('Jumlah mahasiswa ke-', n);
    write('Nama  : '); readln(d[n].nama);
    write('Tugas : '); readln(d[n].tugas);
    write('UTS   : '); readln(d[n].uts);
    write('UAS   : '); readln(d[n].uas);
    write('Tambah lagi? (y/n): '); readln(lagi);
    writeln;
  until (lagi = 'n') or (lagi = 'N') or (n = 50);
end;

procedure TampilData(d: TDataMhs; n: integer);
var
  i     : integer;
  akhir : real;
begin
  writeln('=== HASIL NILAI ===');
  for i := 1 to n do
  begin
    akhir := HitungAkhir(d[i]);
    writeln('   Nilai akhir: ', akhir:0:2, ' | Grade: ', Grade(akhir));
    if Grade(akhir) in ['A', 'B', 'C'] then
      writeln('   Status: Lulus')
    else
      writeln('   Status: Tidak lulus');
  end;
end;

begin
  InputData(data, n);
  TampilData(data, n);
  readln;
end.
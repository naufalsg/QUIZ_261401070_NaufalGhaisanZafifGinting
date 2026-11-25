program DataNilaiMahasiswa;

type
  Tblnj = record
    kode  : integer;
    namabarang: char;
    harga : real;
    jumlah : integer;
    
  end;
  TData = array[1..50] of Tblnj;

var
  data : TData;
  n    : integer;

function TotalBelanja(m: Tblnj): real;
begin
  TotalBelanja := jumlahharga * jumlahbarang;
end;

function Diskon(total: real): real;
begin

  if total > 500000 then
    Diskon := total * 0.15
  else if total > 200000 then
    Diskon := total * 0.10
  else if total > 100000 then
    Diskon := total * 0.05
  else
    writeln('Tidak ada diskon');
end;

procedure InputData(var d: TData; var n: integer);
var
  lagi: char;
begin
  n := 0;
  repeat
    n := n + 1;
    writeln('Data ke-', n);
    write('KodeBarang  : '); readln(d[n].kode);
    write('Nama barang  : '); readln(d[n].namabarang);
    write('Harga: '); readln(d[n].harga);
    write('Jumlah : '); readln(d[n].jumlah);
    
    write('Tambah lagi? (y/n): '); readln(lagi);
    writeln;
  until (lagi = 'n') or (lagi = 'N') or (n = 50);
end;
begin
    jumlahharga(data, n);
    jumlahbarang(data, n);
    readln;
end.
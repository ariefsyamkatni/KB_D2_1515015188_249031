DOMAINS
 
    nama,jender,pekerjaan,benda,alasan,zat = symbol
    umur = integer

PREDICATES
  nondeterm orang(nama,umur,jender,pekerjaan)
  nondeterm selingkuh(nama,nama)
  terbunuh_dengan(nama,benda)
  terbunuh(nama)
  nondeterm pembunuh(nama)
  motif(alasan)
  ternodai(nama,zat)
  milik(nama,benda)
  nondeterm cara_kerja_mirip(benda,benda)
  nondeterm kemungkinan_milik(nama,benda)
  nondeterm dicurigai(nama)
*
ClAUSES
  orang(budi,55,m,tukang_kayu).
  orang(aldi,25,m,pemain_sepak_bola).
  orang(aldi,25,m,tukang_jagal).
  orang(joni,25,m,pencopet).

  selingkuh(ina,joni).
  selingkuh(ina,budi).
  selingkuh(siti,joni).

  terbunuh_dengan(siti,pentungan).
  terbunuh(siti).

  motif(uang).
  motif(cemburu).
  motif(dendam).

  ternodai(budi,darah).
  ternodai(siti,darah).
  ternodai(aldi,lumpur).
  ternodai(joni,coklat).
  ternodai(ina,coklat).

  milik(budi,kaki_palsu).
  milik(joni,pistol).

  cara_kerja_mirip(kaki_palsu,pentungan).
  cara_kerja_mirip(balok,pentungan).
  cara_kerja_mirip(gunting,pisau).
  cara_kerja_mirip(sepak_bola,pentungan).

  kemungkinan_milik(X,sepatu_bola):- orang(X,_,_,pemain_sepak_bola).
  kemungkinan_milik(X,gunting):- orang(X,_,_,pekerja_salon).
  kemungkinan_milik(X,Benda):- milik(X,Benda).

  dicurigai(X):- 
  terbunuh_dengan(siti,Senjata),
  cara_kerja_mirip(Benda,Senjata),
  kemungkinan_milik(X,Benda).

  dicurigai(X):-
  motif(cemburu),
  orang(X,_,m,_),
  selingkuh(siti,X).

  dicurigai(X):-
  motif(cemburu),
  orang(X,_,f,_),
  selingkuh(X,
   Lakilaki),
  selingkuh(siti,Lakilaki).

  dicurigai(X):-
  motif(uang),
  orang(X,_,_,pencopet).

  pembunuh(Pembunuh):- %ini sebagai unifikasi argumen
  orang(Pembunuh,_,_,_),%ini sebagai sub goal kepertama 
  terbunuh(Terbunuh),%ini sebagai sub goal kedua
  Terbunuh <> Pembunuh,
  dicurigai(Pembunuh),%ini sebagai sub goal ketiga
  ternodai(Pembunuh,Zat),
  ternodai(Terbunuh,Zat).

GOAL
  pembunuh(X).% x ini sebagai variabel bebas dapat di unifikasikan karena pembunuh juga variabel bebas dapat di unifikasi maka x=pembunuh
  %analisis
  %pertama program akan melacak data data yang cocok dengan goal maka di temukan pembunuh(Pembunuh):- sebagai unifikasi argument
  %lalu akan di panggil subgoal pertama maka ditemukan orang(Pembunuh,_,_,_), di temukan variable anonim ("_") berada di argumen "usia,jender,perkerjaan"  lalu prolog akan mencari kecocokan denga n argumen terebut
  %diawalin dari terbunuh(terbunuh) maka prolog mencari argumen yang cocok dengan terbunuh karena yang di temukan bahwa yg terbunuh(siti) 
  %lalu prolog akan mencoba ke sub berikutnya yaitu dicurigai(pembunuh) selanjutnya memanggil dicurigai(x) karena 
  %sub berikutnya  terbunuh_dengan(siti,Senjata) lalu prolog akan memanggi  terbunuh_dengan(siti,Senjata) kemudian menemukan bahwa siti terbunuh oleh pentungan
  %lalu  ke sub berikunya cara_kerja_mirip(Benda,Senjata) lalu prolog akan mengecek semua yang bernilai sama dengan pentungan
  % dan ditemuka bahwa balok, sepak_bola dan kaki palsu dapat dijadikan pentungan
  %lalu lanjut ke sub berikutnya kemungkinan_milik(X,Benda) karena yang ditemukan bahwa kaki palsu milik budi 
  %karena sudah ditemukan beberapa fakta yang di curigai 
  %lalu lanjut ke sub berikutnya ternodai(Pembunuh,Zat) prolog memulai pencarian dan di temukan bahwa budi ternodai zat berupah darah
 %lalu lanjut ke ternodai(Terbunuh,Zat) dan ditemukan bahwa siti juga ternodai oleh darah
 %jadi ditemukan bahwa  budi pembunuhnya
  
  
DOMAINS
pelajaran, nama, nilai = symbol

PREDICATES
nondeterm matakuliah(pelajaran , nama, nilai)

CLAUSES
 matakuliah(intelijensi,irfan,a).
 matakuliah(intelijensi,ikomeng,d).
 matakuliah(intelijensi,dati,c).
 matakuliah(intelijensi,fatima,b).
 matakuliah(intelijensi,maspio,c).
 matakuliah(intelijensi,ricky,e).
 matakuliah(pde,embang,a).
 matakuliah(pde,salmin,e).
 matakuliah(pde,vina,e).
 matakuliah(pde,sodang,e).
 matakuliah(pde,pamuji,e).
 matakuliah(so,luki,e).
 matakuliah(so,sadek,e).
 matakuliah(so,eka,e).
 matakuliah(so,yusida,e) . 

 Goal 
 matakuliah(intelijensi,Nama,_);nl,
 matakuliah(_,Lulus,a);matakuliah(_,Lulus,b);matakuliah(_,Lulus,c);nl,
 matakuliah(_,Tidaklulus,d);matakuliah(_,Tidaklulus,e);nl,
 matakuliah(Pelajaran,_,_);nl,
 matakuliah(_,Nama,_).
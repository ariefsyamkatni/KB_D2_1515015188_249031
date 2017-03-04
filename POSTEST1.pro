predicates % yang terlibat dalam fakta
  membeli(symbol,symbol,symbol) - nondeterm (o,o,i) 	% prefikat dari membeli adalah symbol,symbol,symbol   berfungsi untuk memberi tahu compiler bahwa predikat tersebut mempunyai lebih dari satu kemungkinan jawaban (non-deterministik)
  person(symbol) - nondeterm (o) 	% person dari person adalah symbol nondeterm  berfungsi untuk memberi tahu compiler bahwa predikat tersebut mempunyai lebih dari satu kemungkinan jawaban (non-deterministik)
  makanan(symbol) - nondeterm (o)	% prefikat dari makanan adalah symbol nondeterm berfungsi untuk memberi tahu compiler bahwa predikat tersebut mempunyai lebih dari satu kemungkinan jawaban (non-deterministik)
  minuman(symbol) - nondeterm (i)	%prefikat dari minuman adalah symbol nondeterm berfungsi untuk memberi tahu compiler bahwa predikat tersebut mempunyai lebih dari satu kemungkinan jawaban (non-deterministik)
  suka(symbol,symbol,symbol) - nondeterm (i,i,i) %prefikat dari suka adalah symbol symbol symbol nondeterm berfungsi untuk memberi tahu compiler bahwa predikat tersebut mempunyai lebih dari satu kemungkinan jawaban (non-deterministik)

  
clauses
  membeli(X,Y,I,E):- person(X), makanan(Y), minuman(I), suka(X,Y,I,E). % ini adalah fakta akan dilakukan orang membeli makanan dan minuman yang di suka
  person(kelly).	%kelly adalah orang
  person(judy).		%judy adalah orang

  makanan(bakso).		%bakso adalah makanan
  makanan(soto).		%soto adalah makanan
  
  minuman(tea).		%tea adalah minuman
  minuman(softdrink).	%softdrink adalah minuman

  suka(kelly,bakso,tea).  % kelly suka bakso dan tea
  suka(judy,soto,softdrink).  % judy suka soto dan softdrink
  
goal
  membeli(Nama,Makanan,tea,Harga).  %goal ini adalah hasil dari clauses 
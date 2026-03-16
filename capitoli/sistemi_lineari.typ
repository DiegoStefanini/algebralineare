#import "../template.typ": *

= Rango e Sistemi Lineari

Nello studio degli spazi vettoriali abbiamo visto come le matrici offrano uno strumento per rappresentare le applicazioni lineari e i sistemi di generatori. In questo capitolo introduciamo uno degli invarianti fondamentali di una matrice, il suo rango, per poi applicarlo alla teoria dei sistemi di equazioni lineari. Questo approccio ci permetterà di tradurre il problema geometrico delle intersezioni di iperpiani e il problema algebrico di trovare le coordinate in un linguaggio unificato e calcolabile in modo algoritmico.

== Il Rango di una Matrice

Quando consideriamo le righe di una matrice come vettori, queste generano un sottospazio vettoriale. La dimensione di questo sottospazio ci dice quante informazioni "indipendenti" sono contenute nella matrice.

#definizione("Rango di una matrice")[
  Sia $A in M_(m times n)(KK)$ una matrice. Si definisce *rango per righe* di $A$ la dimensione dello spazio generato dai vettori riga di $A$. Analogamente, si definisce *rango per colonne* la dimensione dello spazio generato dai vettori colonna di $A$.
  Un teorema fondamentale dell'algebra lineare garantisce che il rango per righe e il rango per colonne coincidono sempre. Questo numero si chiama semplicemente *rango* della matrice e si indica con $r(A)$ (oppure $rho(A)$ o $"rk"(A)$).
]

#esempio(titolo: "Calcolo diretto del rango")[
  Consideriamo la matrice:
  $ A = mat(1, 2; 2, 4) $
  Le sue due righe sono $v_1 = (1, 2)$ e $v_2 = (2, 4)$. Poiché $v_2 = 2 v_1$, lo spazio generato da queste righe ha dimensione 1. Pertanto, il rango di $A$ è $r(A) = 1$. Lo stesso vale per le colonne: la seconda colonna è il doppio della prima.
]

#esempio(titolo: "Rango massimo e matrice identità")[
  La matrice identica $I_n$ di dimensione $n times n$:
  $ I_n = mat(1, 0, dots, 0; 0, 1, dots, 0; dots.v, dots.v, dots.down, dots.v; 0, 0, dots, 1) $
  ha come righe i vettori della base standard di $KK^n$. Questi sono linearmente indipendenti, quindi lo spazio da essi generato ha dimensione $n$. Pertanto, $r(I_n) = n$.
]

#osservazione[
  Poiché le righe di $A$ sono vettori in $KK^n$ e le colonne sono vettori in $KK^m$, il rango di $A$ non può superare né il numero di righe né il numero di colonne. In formule: $r(A) lt.eq min(m, n)$. Se $r(A) = min(m, n)$, si dice che la matrice ha *rango massimo*.
]

Il metodo più pratico per calcolare il rango è utilizzare l'algoritmo di Gauss (riduzione a scala).

#teorema("Invarianza del rango per operazioni elementari")[
  Sia $A$ una matrice e sia $B$ una matrice ottenuta da $A$ applicando un numero finito di operazioni elementari sulle righe. Allora $r(A) = r(B)$. In particolare, se $B$ è in forma a scala, il rango di $A$ è uguale al numero di righe non nulle di $B$ (ovvero al numero di pivot).
]

#dimostrazione(stile: "costruttiva")[
  Le operazioni elementari sulle righe sono tre: scambiare due righe, moltiplicare una riga per uno scalare non nullo, o sommare a una riga un multiplo di un'altra. In ogni caso, i vettori riga della nuova matrice sono combinazioni lineari dei vettori riga della matrice originale. Quindi lo spazio generato dalle righe (detto spazio delle righe) non si ingrandisce. Poiché le operazioni elementari sono invertibili, possiamo applicare le operazioni inverse per tornare alla matrice originale, dimostrando che lo spazio delle righe della prima matrice è contenuto in quello della seconda. Quindi i due spazi generati coincidono esattamente. 
  Essendo lo stesso spazio, la sua dimensione (il rango) rimane invariata. In una matrice a scala, le righe non nulle sono linearmente indipendenti, quindi formano una base dello spazio delle righe, e il loro numero è proprio la dimensione di tale spazio.
]

== Sistemi di Equazioni Lineari

Un sistema di equazioni lineari è un insieme di equazioni di primo grado nelle stesse incognite. L'algebra lineare fornisce il linguaggio ideale per trattare questi sistemi.

#definizione("Sistema Lineare e Rappresentazione Matriciale")[
  Un *sistema lineare* di $m$ equazioni in $n$ incognite su un campo $KK$ si scrive come:
  $ cases(a_(1 1) x_1 + a_(1 2) x_2 + dots + a_(1 n) x_n = b_1, a_(2 1) x_1 + a_(2 2) x_2 + dots + a_(2 n) x_n = b_2, dots.v, a_(m 1) x_1 + a_(m 2) x_2 + dots + a_(m n) x_n = b_m) $
  Questo sistema può essere scritto in forma compatta matriciale come:
  $ A x = b $
  dove $A in M_(m times n)(KK)$ è la *matrice dei coefficienti* (o incompleta), $x$ è il vettore colonna delle incognite, e $b in KK^m$ è il *vettore dei termini noti*.
  La matrice $(A | b)$ di dimensioni $m times (n+1)$, ottenuta affiancando la colonna $b$ ad $A$, si chiama *matrice completa* del sistema.
]

#esempio(titolo: "Sistema e matrice completa")[
  Dato il sistema:
  $ cases(x_1 + 2 x_2 = 5, 3 x_1 - x_2 = 1) $
  La matrice dei coefficienti $A$ e la matrice completa $(A|b)$ sono:
  $ A = mat(1, 2; 3, -1), quad (A|b) = mat(1, 2, 5; 3, -1, 1) $
]

#esempio(titolo: "Sistema omogeneo")[
  Se il vettore dei termini noti è nullo ($b = 0_m$), il sistema è detto *omogeneo* e si scrive $A x = 0$. Un sistema omogeneo ammette sempre almeno una soluzione, la soluzione *banale* o *nulla* $x = 0_n$.
]

#osservazione[
  Risolvere un sistema $A x = b$ equivale a cercare se e come il vettore $b$ possa essere scritto come combinazione lineare delle colonne di $A$. I coefficienti incogniti $x_i$ sono proprio i pesi di tale combinazione lineare.
]

== Il Teorema di Rouché-Capelli

Il problema di determinare se un sistema lineare ammette soluzioni è completamente risolto da un celebre teorema che sfrutta il concetto di rango.

#teorema("Rouché-Capelli")[
  Un sistema lineare $A x = b$ ammette almeno una soluzione se e solo se il rango della matrice incompleta è uguale al rango della matrice completa:
  $ r(A) = r(A|b) $
]

#dimostrazione(stile: "formale")[
  Siano $C_1, C_2, dots, C_n$ i vettori colonna della matrice $A$. Come osservato, il sistema $A x = b$ equivale all'equazione vettoriale $x_1 C_1 + dots + x_n C_n = b$. 
  
  ($arrow.r.double$) Se il sistema ha soluzione, allora $b$ è combinazione lineare delle colonne di $A$. Questo significa che lo spazio generato dalle colonne di $A$ è lo stesso spazio generato dalle colonne di $A$ insieme al vettore $b$. Poiché le dimensioni di questi due spazi sono rispettivamente $r(A)$ e $r(A|b)$, si ha $r(A) = r(A|b)$.
  
  ($arrow.l.double$) Se $r(A) = r(A|b)$, significa che aggiungendo la colonna $b$ alle colonne di $A$ lo spazio generato non aumenta di dimensione. Questo è possibile solo se $b$ è già contenuto nello spazio generato dalle colonne di $A$, ovvero se può essere scritto come combinazione lineare di queste ultime, il che significa che il sistema ammette soluzione.
]

#osservazione[
  Quando un sistema ha soluzione, si dice *compatibile* (o risolubile). Se $r(A) eq.not r(A|b)$, allora necessariamente $r(A|b) = r(A) + 1$, e il sistema si dice *incompatibile* (o impossibile, nessuna soluzione).
]

== Struttura delle Soluzioni e Sistemi Omogenei

Una volta stabilito che un sistema ammette soluzioni, vogliamo capire "quante" sono e come sono fatte. L'insieme delle soluzioni di un sistema lineare ha una struttura geometrica ben precisa.

#teorema("Struttura delle soluzioni e Teorema Rango-Nullità per i sistemi")[
  Sia $A x = b$ un sistema compatibile (cioè $r(A) = r(A|b) = r$) in $n$ incognite. Allora:
  1. L'insieme delle soluzioni del sistema omogeneo associato $A x = 0$ è un sottospazio vettoriale di $KK^n$ di dimensione $n - r$. Questo coincide con il nucleo dell'applicazione lineare associata ad $A$.
  2. L'insieme delle soluzioni del sistema completo $A x = b$ si ottiene sommando a una soluzione *particolare* $x_p$ del sistema completo tutte le soluzioni del sistema omogeneo associato. Ovvero, la soluzione generale è della forma:
     $ x = x_p + x_h $
     dove $A x_p = b$ e $A x_h = 0$.
]

#dimostrazione(stile: "algebrica")[
  Per la parte 1, definiamo l'applicazione lineare $L_A(x) = A x$. L'insieme delle soluzioni di $A x = 0$ è per definizione $ker(L_A)$. Per il Teorema della dimensione (Rango-Nullità), $dim(KK^n) = dim(ker(L_A)) + dim(Im(L_A))$. Poiché l'immagine di $L_A$ è generata dalle colonne di $A$, la sua dimensione è proprio $r(A) = r$. Ne segue che $dim(ker(L_A)) = n - r$.
  
  Per la parte 2, se $x_p$ è una soluzione particolare ($A x_p = b$) e $x$ è un'altra soluzione qualsiasi ($A x = b$), consideriamo la loro differenza $x_h = x - x_p$. Moltiplicando per $A$ otteniamo:
  $ A x_h = A (x - x_p) = A x - A x_p = b - b = 0 $
  Dunque $x_h$ è soluzione del sistema omogeneo associato. Quindi ogni soluzione $x$ si può scrivere come $x_p + x_h$.
]

#osservazione[
  Il numero di "gradi di libertà" (o parametri liberi) di un sistema lineare compatibile è esattamente pari alla dimensione dello spazio delle soluzioni del sistema omogeneo, ovvero $n - r(A)$.
  - Se $r = n$, il sistema ammette un'*unica soluzione* (zero parametri liberi). In particolare, se la matrice $A$ è quadrata ($m=n$), il sistema ha un'unica soluzione per ogni scelta di $b$ ed è risolvibile, ad esempio, con la Regola di Cramer o calcolando la matrice inversa.
  - Se $r < n$, il sistema ammette infinite soluzioni, che dipendono da $n - r$ parametri liberi (si dice che ha $oo^(n-r)$ soluzioni).
]

== Esercizi

#esercizio(tipo: "Calcolo")[
  Determinare, al variare del parametro $k in RR$, il rango della seguente matrice:
  $ M_k = mat(1, k, 1; 2, 4, 2; 1, 2, k) $
]

#esercizio(tipo: "Discussione")[
  Discutere e risolvere, se possibile, il seguente sistema lineare al variare del parametro reale $h$:
  $ cases(x + y + z = 1, 2x + h y + z = 2, x + y + h z = 1) $
]

#esercizio(tipo: "Dimostrazione")[
  Dimostrare che se $A x = b$ ha due soluzioni distinte $x_1$ e $x_2$, allora ne ha infinite.
  _(Suggerimento: usare il segmento che unisce le due soluzioni $lambda x_1 + (1-lambda)x_2$)_
]

#esercizio(tipo: "Vero/Falso")[
  Stabilire se le seguenti affermazioni sono vere o false, giustificando la risposta:
  1. Un sistema omogeneo di $m$ equazioni in $n$ incognite con $m < n$ ha sempre infinite soluzioni.
  2. Se $A$ è una matrice $3 times 4$, allora il rango di $A$ può essere 4.
]

#esercizio(tipo: "Controesempio")[
  Costruire, se possibile, un sistema di tre equazioni in tre incognite che sia incompatibile, ma tale che rimuovendo una qualsiasi delle sue equazioni si ottenga un sistema compatibile.
]

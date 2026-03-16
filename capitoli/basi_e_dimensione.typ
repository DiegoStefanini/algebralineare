#import "../template.typ": *

= Basi e Dimensione

Nel capitolo precedente abbiamo introdotto i concetti di sistema di generatori e di indipendenza lineare. Un sistema di generatori permette di rappresentare ogni vettore dello spazio, ma potrebbe essere ridondante. Un insieme linearmente indipendente non ha ridondanze, ma potrebbe non generare tutto lo spazio. Unendo queste due proprietà, arriviamo al concetto fondamentale di *base*, che fornisce un sistema di riferimento ottimale per lo spazio vettoriale.

== Basi di uno Spazio Vettoriale

#definizione("Base")[
  Sia $V$ uno spazio vettoriale su un campo $KK$. Un insieme ordinato di vettori $B = (v_1, v_2, dots, v_n)$ si dice *base* di $V$ se:
  1. $B$ è un *sistema di generatori* per $V$ (ovvero $"Span"(v_1, dots, v_n) = V$)
  2. I vettori $v_1, dots, v_n$ sono *linearmente indipendenti*.
]

#osservazione[
  Una base è un sistema di generatori "economico": non contiene vettori superflui. Nessun vettore di una base può essere espresso come combinazione lineare dei rimanenti. In particolare, una base non può mai contenere il vettore nullo $0_V$.
]

=== Basi Standard

Molti spazi vettoriali di uso comune possiedono una base naturale, detta *base standard* o *canonica*.

#esempio(titolo: "Base standard di $KK^n$")[
  In $KK^n$, la base standard è formata dai vettori:
  $
  e_1 = (1, 0, dots, 0), quad e_2 = (0, 1, dots, 0), quad dots, quad e_n = (0, 0, dots, 1)
  $
  Si verifica facilmente che generano tutto lo spazio e sono linearmente indipendenti.
]

#esempio(titolo: "Base standard delle matrici")[
  Nello spazio vettoriale $M_(m times n)(KK)$, la base standard è costituita dalle matrici $E_(i j)$, che hanno $1$ nella posizione $(i,j)$ e $0$ in tutte le altre posizioni. Questa base contiene esattamente $m dot n$ matrici.
]

#esempio(titolo: "Base standard dei polinomi")[
  Nello spazio $KK[x]_(lt.eq n)$ dei polinomi di grado al più $n$, la base standard è data dai monomi:
  $
  1, x, x^2, dots, x^n
  $
  Questa base è formata da $n+1$ vettori.
]

=== Coordinate di un Vettore

La scelta di una base permette di tradurre i vettori astratti in enuple di numeri.

#teorema("Unicità delle Coordinate")[
  Sia $V$ uno spazio vettoriale e sia $B = (v_1, v_2, dots, v_n)$ una sua base ordinata. Allora per ogni vettore $v in V$ esiste un'*unica* $n$-upla di scalari $(x_1, x_2, dots, x_n) in KK^n$ tale che:
  $
  v = x_1 v_1 + x_2 v_2 + dots + x_n v_n
  $
]

#dimostrazione(stile: "per assurdo")[
  L'esistenza degli scalari è garantita dal fatto che $B$ è un sistema di generatori. Per dimostrare l'unicità, supponiamo per assurdo che vi siano due scritture diverse per lo stesso vettore $v$:
  $ v = x_1 v_1 + dots + x_n v_n $
  $ v = x'_1 v_1 + dots + x'_n v_n $
  Sottraendo membro a membro otteniamo:
  $ 0_V = (x_1 - x'_1)v_1 + dots + (x_n - x'_n)v_n $
  Poiché i vettori $v_1, dots, v_n$ sono linearmente indipendenti, l'unica combinazione lineare che dà il vettore nullo è quella con tutti i coefficienti nulli. Pertanto:
  $ x_i - x'_i = 0 quad arrow.r.double quad x_i = x'_i quad forall i $
  Questo contraddice l'ipotesi che le due scritture fossero diverse, provando così l'unicità.
]

#definizione("Coordinate")[
  Gli unici scalari $(x_1, x_2, dots, x_n)$ determinati dal teorema precedente si chiamano *coordinate* del vettore $v$ rispetto alla base $B$.
]

#osservazione[
  Le coordinate dipendono strettamente dalla base scelta. Cambiando base, le coordinate dello stesso vettore cambieranno.
]

#esempio(titolo: "Coordinate rispetto alla base standard e non")[
  In $RR^2$, consideriamo il vettore $v = (3, 2)$. Rispetto alla base standard $E = (e_1, e_2)$, le sue coordinate sono chiaramente $(3, 2)$. Se invece scegliamo la base $B = (v_1, v_2)$ con $v_1 = (1, 1)$ e $v_2 = (1, -1)$, dobbiamo risolvere $v = x_1 v_1 + x_2 v_2$, ovvero $(3, 2) = x_1(1, 1) + x_2(1, -1)$. Risolvendo il sistema otteniamo $x_1 = 5/2$ e $x_2 = 1/2$. Dunque le coordinate di $v$ rispetto a $B$ sono $(5/2, 1/2)$.
]

#esempio(titolo: "Coordinate nello spazio dei polinomi")[
  Nello spazio $RR[x]_(lt.eq 2)$, consideriamo il polinomio $p(x) = 2 + 3x - x^2$. Rispetto alla base standard $B = (1, x, x^2)$, le coordinate di $p(x)$ sono $(2, 3, -1)$.
]

== Dimensione di uno Spazio Vettoriale

#definizione("Spazio finitamente generato")[
  Uno spazio vettoriale si dice *finitamente generato* se ammette un sistema di generatori formato da un numero finito di vettori.
]

#esempio[
  Lo spazio $RR^3$ è finitamente generato, poiché l'insieme di tre vettori ${(1,0,0), (0,1,0), (0,0,1)}$ ne è un sistema di generatori.
]

#esempio(titolo: "Spazio non finitamente generato")[
  Lo spazio $RR[x]$ di tutti i polinomi a coefficienti reali (di grado arbitrario) non è finitamente generato. Infatti, nessun insieme finito di polinomi può generare polinomi di grado superiore al massimo grado presente nell'insieme.
]

#attenzione[
  In questo corso ci concentreremo quasi esclusivamente sugli spazi finitamente generati. Tuttavia, è importante ricordare che non tutti gli spazi vettoriali rientrano in questa categoria (come visto per le successioni reali o lo spazio $RR[x]$).
]

#teorema("Esistenza della base")[
  Ogni spazio vettoriale finitamente generato ammette almeno una base.
]

#dimostrazione(stile: "costruttiva")[
  Sia $V$ uno spazio finitamente generato. Allora esiste un sistema di generatori finito $S = {v_1, dots, v_p}$. Se $S$ è linearmente indipendente, allora $S$ è una base. Se non lo è, uno dei vettori può essere scritto come combinazione lineare dei rimanenti. Rimuovendo questo vettore, l'insieme ridotto genera ancora $V$. Si ripete il procedimento: poiché l'insieme di partenza è finito, in un numero finito di passi si arriverà a un sistema di generatori linearmente indipendente, ovvero a una base.
]

#teorema("Equicardinalità delle basi")[
  Tutte le basi di uno spazio vettoriale finitamente generato hanno lo stesso numero di elementi.
]

La dimostrazione di questo teorema richiede il *lemma di Steinitz*, che verrà presentato dopo lo studio delle applicazioni lineari, seguendo l'ordine della trattazione in classe.

Questo risultato fondamentale permette di definire il concetto di dimensione.

#definizione("Dimensione")[
  La *dimensione* di uno spazio vettoriale finitamente generato $V$, denotata con $dim(V)$, è il numero di elementi di una sua qualsiasi base.
]

#esempio[
  - $dim(KK^n) = n$
  - $dim(M_(m times n)(KK)) = m dot n$
  - $dim(KK[x]_(lt.eq n)) = n + 1$
]

#nota[
  Lo spazio vettoriale banale $V = {0_V}$, contenente solo il vettore nullo, ammette come base l'insieme vuoto $emptyset$. Pertanto, la sua dimensione è convenzionalmente definita come $0$.
]

== Sottospazi Vettoriali

Spesso è utile studiare sottoinsiemi di uno spazio vettoriale che mantengono la struttura di spazio vettoriale.

#definizione("Sottospazio Vettoriale")[
  Un sottoinsieme non vuoto $U$ di uno spazio vettoriale $V$ su $KK$ si dice *sottospazio vettoriale* se è esso stesso uno spazio vettoriale rispetto alle operazioni ereditate da $V$. In pratica, è sufficiente verificare due condizioni:
  1. *Chiusura rispetto alla somma:* per ogni $u_1, u_2 in U$, si ha $u_1 + u_2 in U$.
  2. *Chiusura rispetto al prodotto per scalare:* per ogni $u in U$ e $lambda in KK$, si ha $lambda u in U$.
]

#esempio[
  In $RR^3$, l'insieme $U = {(x, y, z) in RR^3 : x + y + z = 0}$ è un sottospazio vettoriale. Infatti, presi due vettori in $U$ la somma delle loro coordinate resta zero, e moltiplicando un vettore di $U$ per uno scalare, la somma delle coordinate resta zero.
]

#esempio(titolo: "Non-esempio: circonferenza")[
  In $RR^2$, l'insieme dei punti che formano la circonferenza unitaria $C = {(x, y) in RR^2 : x^2 + y^2 = 1}$ *non* è un sottospazio vettoriale. Per verificarlo è sufficiente notare che il vettore nullo $(0,0)$ non vi appartiene, poiché $0^2 + 0^2 = 0 eq.not 1$.
]

#attenzione[
  Un sottospazio vettoriale deve *sempre* contenere il vettore nullo (si ottiene moltiplicando un qualsiasi vettore per lo scalare $0$). Verificare se $0_V in U$ è il test più rapido per escludere che un sottoinsieme sia un sottospazio.
]

#teorema("Chiusura Lineare come Sottospazio")[
  Siano $v_1, dots, v_p$ vettori di $V$. L'insieme generato (o chiusura lineare) $"Span"(v_1, dots, v_p)$ è un sottospazio vettoriale di $V$.
]

== Determinazione di una Base ed Estrazione

In $KK^n$, per determinare se un insieme di vettori è linearmente indipendente o per estrarne una base, si ricorre alla riduzione per righe di matrici. Questo metodo si basa su due proprietà fondamentali delle operazioni elementari:

#proposizione("Proprietà delle trasformazioni per righe")[
  Sia $A$ una matrice e sia $B$ una matrice ottenuta da $A$ tramite operazioni elementari per righe. Allora:
  1. Le righe di $A$ e le righe di $B$ generano lo stesso spazio vettoriale.
  2. Le righe non nulle di $B$ (se $B$ è in forma a scala) sono linearmente indipendenti.
]

#corollario("Algoritmo per l'estrazione di una base")[
  Dato un insieme di vettori $S = {v_1, dots, v_k} subset.eq KK^n$, per trovare una base dello spazio generato da $S$:
  1. Si costruisce la matrice $A$ avente come righe i vettori $v_1, dots, v_k$.
  2. Si riduce la matrice $A$ in forma a scala (o completamente ridotta) ottenendo la matrice $R$.
  3. Le righe non nulle di $R$ formano una base per $"Span"(v_1, dots, v_k)$.
]

#esempio[
  Si determini una base per lo spazio generato dai vettori $v_1=(1, 0, 2, 3)$, $v_2=(1, 1, 1, 1)$, $v_3=(3, 2, 4, 5)$.
  Costruiamo la matrice per righe:
  $
  A = mat(1, 0, 2, 3; 1, 1, 1, 1; 3, 2, 4, 5)
  $
  Riduciamo: $R_2 arrow.r R_2 - R_1$, $R_3 arrow.r R_3 - 3R_1$:
  $
  mat(1, 0, 2, 3; 0, 1, -1, -2; 0, 2, -2, -4)
  $
  $R_3 arrow.r R_3 - 2R_2$:
  $
  mat(1, 0, 2, 3; 0, 1, -1, -2; 0, 0, 0, 0)
  $
  Le prime due righe non nulle formano una base: $B = ((1, 0, 2, 3), (0, 1, -1, -2))$. L'insieme iniziale era linearmente dipendente.
]

== Esercizi

#esercizio(tipo: "Dimostrazione")[
  Dimostrare che se $U_1$ e $U_2$ sono sottospazi vettoriali di $V$, allora anche la loro intersezione $U_1 inter U_2$ è un sottospazio vettoriale.
]

#esercizio(tipo: "Controesempio")[
  Mostrare con un esempio che l'unione di due sottospazi vettoriali $U_1 union U_2$ non è necessariamente un sottospazio vettoriale. (Suggerimento: pensare a due rette distinte in $RR^2$ passanti per l'origine).
]

#esercizio(tipo: "Calcolo")[
  Determinare se il vettore $v = (3, 3, 2)$ appartiene al sottospazio di $RR^3$ generato dai vettori $v_1 = (1, 1, 1)$, $v_2 = (1, 2, 3)$, $v_3 = (2, 3, 4)$.
]

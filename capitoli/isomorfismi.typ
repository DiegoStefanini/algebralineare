#import "../template.typ": *

= Applicazioni Lineari e Isomorfismi

Dopo aver studiato gli spazi vettoriali come insiemi statici, passiamo ad analizzare le trasformazioni che "rispettano" la loro struttura algebrica. Queste trasformazioni, dette applicazioni lineari o omomorfismi, permettono di mappare vettori di uno spazio in vettori di un altro conservando le operazioni di somma e prodotto per scalare. Lungo il percorso, dimostreremo i risultati fondamentali rimasti in sospeso sulla dimensione --- in particolare, che tutte le basi hanno lo stesso numero di elementi --- e arriveremo al concetto di isomorfismo, che ci permette di identificare spazi vettoriali apparentemente diversi.

== Applicazioni Lineari

#definizione("Applicazione Lineare (Omomorfismo)")[
  Siano $V$ e $W$ due spazi vettoriali sul campo $KK$. Una funzione $F : V arrow.r W$ si dice *applicazione lineare* (o *omomorfismo*) se soddisfa le seguenti due proprietà:
  1. *Additività:* $F(v_1 + v_2) = F(v_1) + F(v_2)$ per ogni $v_1, v_2 in V$.
  2. *Omogeneità:* $F(lambda v) = lambda F(v)$ per ogni $lambda in KK$ e $v in V$.

  Equivalentemente, $F$ preserva le combinazioni lineari: $F(lambda_1 v_1 + lambda_2 v_2) = lambda_1 F(v_1) + lambda_2 F(v_2)$.
]

#osservazione[
  Ogni applicazione lineare mappa il vettore nullo del dominio nel vettore nullo del codominio: $F(0_V) = 0_W$. Infatti, $F(0_V) = F(0 dot 0_V) = 0 dot F(0_V) = 0_W$. Se una funzione non mappa lo zero nello zero, non può essere lineare.
]

#esempio(titolo: "Applicazione associata a una matrice")[
  Sia $A in M_(m times n)(KK)$. La funzione $L_A : KK^n arrow.r KK^m$ definita dal prodotto matriciale:
  $ L_A (x) = A x $
  è un'applicazione lineare. Le proprietà di linearità derivano direttamente dalle proprietà del prodotto matriciale: $A(x + y) = A x + A y$ e $A(lambda x) = lambda(A x)$.
]

#esempio(titolo: "Derivazione")[
  Sia $V = RR[x]_(lt.eq n)$ lo spazio dei polinomi di grado al più $n$. L'operatore derivata $D : RR[x]_(lt.eq n) arrow.r RR[x]_(lt.eq n-1)$ definito da $D(p(x)) = p'(x)$ è un'applicazione lineare, poiché la derivata della somma è la somma delle derivate e lo scalare "esce" dall'operatore.
]

#esempio(titolo: "Proiezione")[
  La proiezione sul piano $x y$ definita come $pi : RR^3 arrow.r RR^3$, $pi(x,y,z) = (x,y,0)$ è un'applicazione lineare. Si verifica direttamente: $pi(v_1 + v_2) = pi(v_1) + pi(v_2)$ e $pi(lambda v) = lambda pi(v)$.
]

#attenzione[
  Non tutte le funzioni tra spazi vettoriali sono lineari. Ad esempio, $f : RR arrow.r RR$ definita da $f(x) = x^2$ non è lineare: $f(1 + 1) = 4 eq.not 2 = f(1) + f(1)$. Analogamente, $g(x) = x + 1$ non è lineare perché $g(0) = 1 eq.not 0$.
]

== Matrice Associata a un'Applicazione Lineare

Una delle scoperte più potenti dell'algebra lineare è che ogni applicazione lineare tra spazi di dimensione finita può essere interamente "codificata" da una matrice, una volta fissate le basi.

Sia $F : V arrow.r W$ un'applicazione lineare.
Fissiamo una base $B_V = (v_1, dots, v_n)$ per $V$ e una base $B_W = (w_1, dots, w_m)$ per $W$.

#definizione("Matrice Associata")[
  La *matrice associata* a $F$ rispetto alle basi $B_V$ e $B_W$, indicata con $M_(B_V, B_W)(F)$, è la matrice $m times n$ in cui la colonna $j$-esima è formata dalle coordinate del vettore $F(v_j)$ rispetto alla base $B_W$.
]

In pratica, si procede così:
1. Si calcola l'immagine di ciascun vettore della base di $V$: $F(v_1), F(v_2), dots, F(v_n)$.
2. Si esprimono questi vettori immagini come combinazione lineare della base di $W$:
   $ F(v_j) = a_(1 j) w_1 + a_(2 j) w_2 + dots + a_(m j) w_m $
3. I coefficienti $a_(i j)$ formano la colonna $j$-esima della matrice $A$.

#esempio(titolo: "Matrice associata a una rotazione")[
  Sia $F : RR^2 arrow.r RR^2$ la rotazione in senso antiorario di un angolo $theta$ attorno all'origine. Rispetto alla base standard $B = (e_1, e_2)$, calcoliamo le immagini:
  - $F(e_1) = F(1,0) = (cos theta, sin theta)$
  - $F(e_2) = F(0,1) = (-sin theta, cos theta)$
  I vettori colonna formano la matrice associata:
  $ M_(B, B)(F) = mat(cos theta, -sin theta; sin theta, cos theta) $
]

#esempio(titolo: "Matrice associata alla derivata")[
  Consideriamo l'operatore di derivata $D : RR[x]_(lt.eq 2) arrow.r RR[x]_(lt.eq 1)$ e scegliamo le basi standard $B_V = (1, x, x^2)$ e $B_W = (1, x)$. Calcoliamo le immagini dei vettori di $B_V$:
  - $D(1) = 0 = 0 dot 1 + 0 dot x$ $arrow.r$ colonna $(0, 0)^T$
  - $D(x) = 1 = 1 dot 1 + 0 dot x$ $arrow.r$ colonna $(1, 0)^T$
  - $D(x^2) = 2x = 0 dot 1 + 2 dot x$ $arrow.r$ colonna $(0, 2)^T$
  La matrice associata è quindi:
  $ M_(B_V, B_W)(D) = mat(0, 1, 0; 0, 0, 2) $
]

Questa matrice è lo strumento computazionale per eccellenza, grazie al seguente teorema:

#teorema("Calcolo delle immagini tramite matrice")[
  Sia $x$ il vettore colonna delle coordinate di $v in V$ rispetto alla base $B_V$, e sia $y$ il vettore colonna delle coordinate di $F(v)$ rispetto alla base $B_W$. Allora:
  $ y = M_(B_V, B_W)(F) dot x $
]

#osservazione[
  Il rango della matrice associata $A = M_(B_V, B_W)(F)$ corrisponde esattamente alla dimensione dell'immagine di $F$. Infatti, lo spazio delle colonne di $A$ è generato dai vettori colonna che rappresentano le immagini dei vettori della base di $V$, le quali a loro volta generano $Im(F)$.
]

== Lemma di Steinitz e Completamento della Base

Con gli strumenti delle applicazioni lineari a disposizione, possiamo ora dimostrare i risultati fondamentali sulla dimensione che avevamo enunciato nel capitolo sulle basi. Il risultato chiave è il lemma di Steinitz, che stabilisce un vincolo rigido tra la cardinalità degli insiemi indipendenti e quella dei sistemi di generatori.

#lemma("Lemma di Steinitz")[
  Sia $V$ uno spazio vettoriale su $KK$. Se ${v_1, dots, v_p}$ è un insieme di vettori linearmente indipendenti e ${w_1, dots, w_q}$ è un sistema di generatori di $V$, allora $p lt.eq q$.
]

#dimostrazione(stile: "per assurdo")[
  Supponiamo per assurdo che $p > q$. Procediamo per sostituzione progressiva.

  *Passo 1.* Il vettore $v_1$ è non nullo (perché appartiene a un insieme indipendente) e si può scrivere come combinazione lineare dei generatori:
  $ v_1 = alpha_1 w_1 + dots + alpha_q w_q $
  Almeno un coefficiente $alpha_j$ è non nullo (altrimenti $v_1 = 0_V$). Riordinando, possiamo supporre $alpha_1 eq.not 0$. Allora $w_1$ si esprime in funzione di $v_1, w_2, dots, w_q$, e dunque ${v_1, w_2, dots, w_q}$ è ancora un sistema di generatori di $V$.

  *Passo generale.* Dopo $k$ passi, l'insieme ${v_1, dots, v_k, w_(k+1), dots, w_q}$ è un sistema di generatori di $V$. Al passo $k+1$, scriviamo $v_(k+1)$ come combinazione lineare di questi generatori:
  $ v_(k+1) = beta_1 v_1 + dots + beta_k v_k + gamma_(k+1) w_(k+1) + dots + gamma_q w_q $
  Se tutti i $gamma_j$ fossero nulli, avremmo $v_(k+1) = beta_1 v_1 + dots + beta_k v_k$, contraddicendo l'indipendenza lineare di $v_1, dots, v_(k+1)$. Dunque almeno un $gamma_j eq.not 0$; riordinando, possiamo sostituire il corrispondente $w_j$ con $v_(k+1)$.

  *Conclusione.* Dopo $q$ passi, abbiamo sostituito tutti i $w_j$ e ottenuto che ${v_1, dots, v_q}$ genera $V$. Ma $p > q$, e allora $v_(q+1)$ è combinazione lineare di $v_1, dots, v_q$, contraddicendo l'indipendenza di ${v_1, dots, v_p}$. L'assurdo dimostra che $p lt.eq q$.
]

#osservazione[
  Il lemma di Steinitz ha un significato intuitivo profondo: in uno spazio vettoriale, un insieme di vettori linearmente indipendenti non può mai essere "più numeroso" di un sistema di generatori. Questo è il motivo per cui la dimensione è un concetto ben definito.
]

Con il lemma di Steinitz possiamo finalmente dimostrare l'equicardinalità delle basi, enunciata nel capitolo precedente.

#teorema("Equicardinalità delle basi --- dimostrazione")[
  Tutte le basi di uno spazio vettoriale finitamente generato hanno lo stesso numero di elementi.
]

#dimostrazione(stile: "formale")[
  Siano $B = {v_1, dots, v_n}$ e $B' = {w_1, dots, w_m}$ due basi di $V$. Poiché $B$ è un insieme indipendente e $B'$ è un sistema di generatori, il lemma di Steinitz dà $n lt.eq m$. Scambiando i ruoli (poiché $B'$ è indipendente e $B$ è un sistema di generatori), si ottiene $m lt.eq n$. Quindi $n = m$.
]

Dal lemma seguono anche due conseguenze pratiche fondamentali.

#teorema("Completamento della base")[
  Sia $V$ uno spazio vettoriale di dimensione $n$ e sia ${v_1, dots, v_k}$ un insieme di vettori linearmente indipendenti con $k lt.eq n$. Allora esistono vettori $v_(k+1), dots, v_n in V$ tali che ${v_1, dots, v_k, v_(k+1), dots, v_n}$ è una base di $V$.
]

#dimostrazione(stile: "costruttiva")[
  Se $k = n$, i vettori $v_1, dots, v_n$ sono un insieme indipendente di $n$ elementi in uno spazio di dimensione $n$: per il lemma di Steinitz, un insieme indipendente non può avere più elementi di un sistema di generatori, e un sistema di generatori non può averne meno di $n$ (la dimensione). Dunque ${v_1, dots, v_n}$ è già una base.

  Se $k < n$, allora ${v_1, dots, v_k}$ non genera $V$ (altrimenti sarebbe una base con meno di $n$ elementi, contraddicendo l'equicardinalità). Dunque esiste un vettore $v_(k+1) in V$ che non è combinazione lineare di $v_1, dots, v_k$. L'insieme ${v_1, dots, v_k, v_(k+1)}$ è linearmente indipendente: se una combinazione lineare desse il vettore nullo con un coefficiente non nullo per $v_(k+1)$, questo sarebbe combinazione lineare dei precedenti, assurdo.

  Si ripete il procedimento. Poiché a ogni passo il numero di vettori indipendenti aumenta di uno e non può superare $n$ (per il lemma di Steinitz), dopo al più $n - k$ passi si ottiene una base di $V$.
]

#esempio(titolo: [Completamento in $RR^3$])[
  Si voglia completare l'insieme indipendente ${v_1 = (1, 0, 1)}$ a una base di $RR^3$.

  Si cerca un vettore $v_2$ non multiplo di $v_1$. Scegliamo $v_2 = (0, 1, 0)$, che chiaramente non è multiplo di $v_1$. L'insieme ${v_1, v_2}$ è indipendente ma non genera $RR^3$ (servono 3 vettori). Si cerca un terzo vettore $v_3$ non appartenente a $"Span"(v_1, v_2)$: ad esempio $v_3 = (0, 0, 1)$. Si verifica che la matrice con queste righe ha rango 3:
  $ mat(1, 0, 1; 0, 1, 0; 0, 0, 1) $
  Dunque ${(1, 0, 1), (0, 1, 0), (0, 0, 1)}$ è una base di $RR^3$.
]

#corollario("Estrazione di una base da un sistema di generatori")[
  Sia ${w_1, dots, w_p}$ un sistema di generatori di $V$, con $dim(V) = n$. Allora da questo sistema si possono estrarre $n$ vettori che formano una base di $V$.
]

#proposizione("Caratterizzazioni della dimensione")[
  Sia $V$ uno spazio vettoriale di dimensione $n$. Allora:
  + Ogni insieme di $n$ vettori linearmente indipendenti è una base di $V$
  + Ogni sistema di generatori formato da $n$ vettori è una base di $V$
  + Ogni insieme di più di $n$ vettori è linearmente dipendente
]

#dimostrazione[
  (1) Se ${v_1, dots, v_n}$ è indipendente e non genera $V$, si potrebbe completare a una base con più di $n$ elementi, contraddicendo l'equicardinalità.

  (2) Se ${v_1, dots, v_n}$ genera $V$ ma è dipendente, si potrebbe estrarne una base con meno di $n$ elementi, contraddicendo l'equicardinalità.

  (3) Conseguenza diretta del lemma di Steinitz: un insieme indipendente ha al più $n$ elementi.
]

== Nucleo e Immagine

Ad ogni applicazione lineare si associano due importanti sottospazi vettoriali: uno nel dominio (il nucleo) e uno nel codominio (l'immagine).

#definizione("Nucleo e Immagine")[
  Sia $F : V arrow.r W$ un'applicazione lineare.
  - Il *nucleo* (o kernel) di $F$ è l'insieme dei vettori del dominio mappati nel vettore nullo del codominio:
    $ ker(F) = {v in V : F(v) = 0_W} $
  - L'*immagine* di $F$ è l'insieme dei vettori del codominio che sono immagine di almeno un vettore del dominio:
    $ Im(F) = {w in W : exists v in V "tale che" F(v) = w} = F(V) $
]

#proposizione("Sottospazi vettoriali")[
  $ker(F)$ è un sottospazio vettoriale di $V$, e $Im(F)$ è un sottospazio vettoriale di $W$.
]

#dimostrazione[
  *Nucleo.* Il nucleo contiene $0_V$ (poiché $F(0_V) = 0_W$), quindi non è vuoto. Se $u, v in ker(F)$, allora $F(u + v) = F(u) + F(v) = 0_W + 0_W = 0_W$, quindi $u + v in ker(F)$. Se $u in ker(F)$ e $lambda in KK$, allora $F(lambda u) = lambda F(u) = lambda dot 0_W = 0_W$, quindi $lambda u in ker(F)$.

  *Immagine.* L'immagine contiene $0_W = F(0_V)$. Se $w_1, w_2 in Im(F)$, esistono $v_1, v_2$ con $F(v_i) = w_i$, dunque $F(v_1 + v_2) = w_1 + w_2 in Im(F)$. Analogamente per il prodotto per scalare.
]

#esempio(titolo: "Nucleo e Immagine della proiezione")[
  Consideriamo la proiezione $pi : RR^3 arrow.r RR^3$, $pi(x,y,z) = (x,y,0)$.
  - Il nucleo $ker(pi)$ è l'insieme dei vettori mappati in $(0,0,0)$, ovvero tutti i vettori della forma $(0,0,z)$. Rappresenta l'asse $z$.
  - L'immagine $Im(pi)$ è l'insieme di tutti i possibili risultati, cioè l'intero piano $x y$, formato dai vettori $(x,y,0)$.
]

#esempio(titolo: "Nucleo e Immagine della mappa nulla")[
  L'applicazione lineare nulla $F : V arrow.r W$ definita da $F(v) = 0_W$ per ogni $v in V$ ha come nucleo l'intero spazio dominio ($ker(F) = V$) e come immagine il solo vettore nullo del codominio ($Im(F) = {0_W}$).
]

Il nucleo è intimamente legato all'iniettività dell'applicazione lineare.

#teorema("Criterio di iniettività")[
  Un'applicazione lineare $F : V arrow.r W$ è iniettiva se e solo se il suo nucleo contiene solo il vettore nullo:
  $ F "è iniettiva" quad arrow.l.r.double quad ker(F) = {0_V} $
]

#dimostrazione(stile: "formale")[
  ($arrow.r.double$) Se $F$ è iniettiva, poiché sappiamo già che $F(0_V) = 0_W$, nessun altro vettore può essere mappato in $0_W$. Pertanto, $ker(F) = {0_V}$.

  ($arrow.l.double$) Supponiamo $ker(F) = {0_V}$. Se $F(v_1) = F(v_2)$, per la linearità si ha $F(v_1) - F(v_2) = 0_W$, da cui $F(v_1 - v_2) = 0_W$. Questo significa che $v_1 - v_2 in ker(F)$. Essendo il nucleo banale, si deve avere $v_1 - v_2 = 0_V$, ovvero $v_1 = v_2$. Dunque $F$ è iniettiva.
]

== L'Equazione Dimensionale (Teorema Rango-Nullità)

Uno dei teoremi più importanti dell'algebra lineare mette in relazione le dimensioni del dominio, del nucleo e dell'immagine di un'applicazione lineare.

#teorema("Equazione Dimensionale")[
  Sia $F : V arrow.r W$ un'applicazione lineare con $V$ spazio vettoriale finitamente generato. Allora:
  $ dim(V) = dim(ker(F)) + dim(Im(F)) $
]

#dimostrazione(stile: "costruttiva")[
  Sia $n = dim(V)$ e $k = dim(ker(F))$. Sia ${u_1, dots, u_k}$ una base del nucleo $ker(F)$.
  Per il teorema di completamento della base, possiamo aggiungere $n - k$ vettori $v_1, dots, v_(n-k)$ in modo che l'insieme
  $ {u_1, dots, u_k, v_1, dots, v_(n-k)} $
  sia una base di $V$.

  Vogliamo mostrare che i vettori ${F(v_1), dots, F(v_(n-k))}$ formano una base di $Im(F)$, provando così che $dim(Im(F)) = n - k$.

  *Generazione:* Un elemento generico $w in Im(F)$ è della forma $w = F(v)$ per un certo $v in V$. Scriviamo $v$ rispetto alla base di $V$:
  $ v = a_1 u_1 + dots + a_k u_k + b_1 v_1 + dots + b_(n-k) v_(n-k) $
  Applicando $F$ e usando la linearità, e sapendo che $F(u_i) = 0_W$ (poiché sono nel nucleo):
  $ w = F(v) = b_1 F(v_1) + dots + b_(n-k) F(v_(n-k)) $
  Quindi ${F(v_1), dots, F(v_(n-k))}$ generano l'immagine.

  *Indipendenza lineare:* Poniamo una combinazione lineare nulla:
  $ c_1 F(v_1) + dots + c_(n-k) F(v_(n-k)) = 0_W $
  Per linearità, $F(c_1 v_1 + dots + c_(n-k) v_(n-k)) = 0_W$. Questo implica che il vettore $c_1 v_1 + dots + c_(n-k) v_(n-k)$ appartiene al nucleo, e quindi si può esprimere come combinazione lineare della base del nucleo:
  $ c_1 v_1 + dots + c_(n-k) v_(n-k) = d_1 u_1 + dots + d_k u_k $
  Riordinando i termini:
  $ c_1 v_1 + dots + c_(n-k) v_(n-k) - d_1 u_1 - dots - d_k u_k = 0_V $
  Ma i vettori $u_1, dots, u_k, v_1, dots, v_(n-k)$ sono una base di $V$, quindi linearmente indipendenti. Ne segue che tutti i coefficienti devono essere nulli, in particolare $c_1 = dots = c_(n-k) = 0$. Questo prova l'indipendenza lineare.
]

Un corollario fondamentale di questo teorema si ottiene quando dominio e codominio hanno la stessa dimensione:

#corollario("Iniettività e Suriettività")[
  Sia $F : V arrow.r W$ un'applicazione lineare tra spazi vettoriali della stessa dimensione ($dim V = dim W = n$). Allora le seguenti affermazioni sono equivalenti:
  1. $F$ è iniettiva
  2. $F$ è suriettiva
  3. $F$ è biunivoca (isomorfismo)
]

#dimostrazione[
  (1 $arrow.r.double$ 2): Se $F$ è iniettiva, $dim(ker(F)) = 0$. Per l'equazione dimensionale, $dim(Im(F)) = n - 0 = n$. Poiché $Im(F)$ è un sottospazio di $W$ e hanno la stessa dimensione, si ha $Im(F) = W$, cioè $F$ è suriettiva.

  (2 $arrow.r.double$ 1): Se $F$ è suriettiva, $dim(Im(F)) = n$. Dall'equazione dimensionale ricaviamo $n = dim(ker(F)) + n$, da cui $dim(ker(F)) = 0$. Quindi il nucleo è banale e $F$ è iniettiva.
]

== Isomorfismi

#definizione("Isomorfismo")[
  Un *isomorfismo* è un'applicazione lineare biunivoca (ovvero iniettiva e suriettiva). Se esiste un isomorfismo tra due spazi vettoriali $V$ e $W$, si dice che sono *isomorfi*, e si scrive $V tilde.eq W$.
]

Due spazi isomorfi sono, dal punto di vista dell'algebra lineare, "lo stesso spazio", solo con nomi diversi per i loro elementi.

#esempio(titolo: "Isomorfismo tra vettori e matrici riga")[
  L'applicazione $F : RR^n arrow.r M_(1 times n)(RR)$ definita da $F(x_1, dots, x_n) = mat(x_1, dots, x_n)$ è banalmente lineare, iniettiva (il nucleo contiene solo il vettore nullo) e suriettiva (ogni matrice riga ha una controimmagine). Quindi $RR^n$ e $M_(1 times n)(RR)$ sono isomorfi.
]

#esempio(titolo: "Isomorfismo canonico con le coordinate")[
  Sia $V$ uno spazio vettoriale di dimensione $n$ su $KK$ e sia $B$ una sua base. L'applicazione $F_B : V arrow.r KK^n$ che associa a ogni vettore $v in V$ il vettore delle sue coordinate rispetto a $B$ è un isomorfismo. Questo ci garantisce che ogni spazio vettoriale di dimensione $n$ si comporta esattamente come $KK^n$.
]

#teorema("Isomorfismo e Dimensione")[
  Due spazi vettoriali finitamente generati $V$ e $W$ sullo stesso campo $KK$ sono isomorfi se e solo se hanno la stessa dimensione.
]

In particolare, ogni spazio vettoriale $V$ su $KK$ di dimensione $n$ è isomorfo a $KK^n$. L'isomorfismo "canonico" (una volta scelta una base) è proprio l'applicazione che associa a ogni vettore il vettore colonna delle sue coordinate.

#osservazione[
  Se $F: V arrow.r W$ è un isomorfismo, la matrice associata $M_(B_V, B_W)(F)$ è una matrice quadrata invertibile. L'inversa dell'applicazione lineare $F^(-1)$ è a sua volta lineare, e la sua matrice associata è esattamente l'inversa della matrice associata a $F$.
]

== Cambio di Base

Abbiamo visto che le coordinate di un vettore dipendono dalla base scelta, e che la matrice associata a un'applicazione lineare dipende dalle basi di dominio e codominio. Sorge allora una domanda naturale: come si trasformano le coordinate quando si passa da una base a un'altra? E come cambia la matrice associata?

#definizione("Matrice di Cambio di Base")[
  Siano $B = (v_1, dots, v_n)$ e $B' = (w_1, dots, w_n)$ due basi di uno spazio vettoriale $V$. La *matrice di cambio di base* da $B$ a $B'$, denotata $P_(B arrow.r B')$, è la matrice $n times n$ la cui colonna $j$-esima contiene le coordinate del vettore $v_j$ (della vecchia base) rispetto alla nuova base $B'$.

  Equivalentemente, $P_(B arrow.r B')$ è la matrice associata all'applicazione identità $"id"_V : V arrow.r V$ rispetto alle basi $B$ (nel dominio) e $B'$ (nel codominio):
  $ P_(B arrow.r B') = M_(B, B')("id"_V) $
]

#osservazione[
  La matrice di cambio di base è sempre invertibile, e la sua inversa è la matrice di cambio nella direzione opposta:
  $ (P_(B arrow.r B'))^(-1) = P_(B' arrow.r B) $
]

#teorema("Trasformazione delle coordinate")[
  Se $x_B$ è il vettore delle coordinate di $v in V$ rispetto alla base $B$, e $x_(B')$ è il vettore delle coordinate dello stesso $v$ rispetto alla base $B'$, allora:
  $ x_(B') = P_(B arrow.r B') dot x_B = (P_(B' arrow.r B))^(-1) dot x_B $
]

#dimostrazione[
  Scriviamo $x_B = (x_1, dots, x_n)$. Allora
  $
  v = x_1 v_1 + dots + x_n v_n.
  $
  Poiché la colonna $j$-esima di $P_(B arrow.r B')$ contiene le coordinate di $v_j$ rispetto a $B'$, moltiplicare $P_(B arrow.r B')$ per $x_B$ equivale a combinare tali colonne con coefficienti $x_1, dots, x_n$. Si ottiene quindi esattamente il vettore delle coordinate di $v$ rispetto a $B'$:
  $
  x_(B') = P_(B arrow.r B') dot x_B.
  $
  Usando l'osservazione precedente, si ha anche $(P_(B' arrow.r B))^(-1) = P_(B arrow.r B')$, da cui la seconda uguaglianza.
]

#esempio(titolo: [Cambio di base in $RR^2$])[
  Consideriamo le basi $B = (e_1, e_2)$ (standard) e $B' = ((1, 1), (1, -1))$ di $RR^2$.

  Per trovare $P_(B arrow.r B')$, esprimiamo i vettori di $B$ come combinazione lineare di $B'$:
  $ e_1 = (1, 0) = 1/2 (1, 1) + 1/2 (1, -1) $
  $ e_2 = (0, 1) = 1/2 (1, 1) - 1/2 (1, -1) $

  Dunque:
  $ P_(B arrow.r B') = mat(1/2, 1/2; 1/2, -1/2) $

  Se $v = (3, 2)$ ha coordinate $x_B = (3, 2)$ nella base standard, le sue coordinate nella base $B'$ sono:
  $ x_(B') = P_(B arrow.r B') dot x_B = mat(1/2, 1/2; 1/2, -1/2) mat(3; 2) = mat(5/2; 1/2) $

  Verifica: $5/2 dot (1, 1) + 1/2 dot (1, -1) = (5/2, 5/2) + (1/2, -1/2) = (3, 2)$ $checkmark$.

  Si noti che $P_(B' arrow.r B)$ è la matrice le cui colonne sono i vettori di $B'$ espressi nella base standard: $P_(B' arrow.r B) = mat(1, 1; 1, -1)$, e si ha $P_(B arrow.r B') = P_(B' arrow.r B)^(-1) = mat(1/2, 1/2; 1/2, -1/2)$, coerentemente con quanto calcolato sopra.
]

#teorema("Cambio di base per la matrice associata")[
  Sia $F : V arrow.r V$ un endomorfismo (applicazione lineare da $V$ in sé) e siano $B$, $B'$ due basi di $V$. Se $A = M_(B,B)(F)$ è la matrice associata rispetto a $B$ e $A' = M_(B',B')(F)$ è la matrice associata rispetto a $B'$, allora:
  $ A' = P^(-1) A P $
  dove $P = P_(B' arrow.r B)$ è la matrice di cambio di base da $B'$ a $B$.
]

#dimostrazione[
  L'applicazione $F$ agisce su un vettore $v$ le cui coordinate in $B$ sono $x_B$ producendo $F(v)$ con coordinate $A x_B$ in $B$. Le coordinate in $B'$ di $v$ sono $x_(B') = P^(-1) x_B$, cioè $x_B = P x_(B')$. Le coordinate in $B'$ di $F(v)$ sono $P^(-1)(A x_B) = P^(-1) A P x_(B')$. Dunque la matrice che manda le coordinate in $B'$ di $v$ nelle coordinate in $B'$ di $F(v)$ è $P^(-1) A P$.
]

#definizione("Matrici Simili")[
  Due matrici $A, A' in M_(n times n)(KK)$ si dicono *simili* se esiste una matrice invertibile $P$ tale che $A' = P^(-1) A P$. Matrici simili rappresentano lo stesso endomorfismo in basi diverse.
]

#osservazione[
  La similitudine è una relazione di equivalenza: è riflessiva ($A = I^(-1) A I$), simmetrica (se $A' = P^(-1) A P$, allora $A = P A' P^(-1)$) e transitiva. Due matrici simili hanno lo stesso rango, lo stesso determinante (quando lo definiremo), e gli stessi autovalori.
]

== Esercizi

#esercizio(tipo: "Calcolo")[
  Sia $F: RR^2 arrow.r RR^2$ l'applicazione lineare definita da $F(x, y) = (x + y, x - y)$.
  1. Scrivere la matrice associata a $F$ rispetto alla base canonica.
  2. Verificare se $F$ è un isomorfismo calcolando il rango della matrice associata.
]

#esercizio(tipo: "Dimostrazione")[
  Sia $F: V arrow.r W$ un'applicazione lineare. Dimostrare che se $F$ è iniettiva e $v_1, dots, v_k$ sono vettori linearmente indipendenti in $V$, allora $F(v_1), dots, F(v_k)$ sono linearmente indipendenti in $W$.
]

#esercizio(tipo: "Calcolo")[
  Un'applicazione lineare $F: RR^3 arrow.r RR^2$ è rappresentata, rispetto alle basi canoniche, dalla matrice:
  $ A = mat(1, -1, 2; 2, -2, 4) $
  Calcolare una base per $ker(F)$ e una base per $Im(F)$. Verificare l'equazione dimensionale.
]

#esercizio(tipo: "Calcolo")[
  In $RR^3$, sia $B = (e_1, e_2, e_3)$ la base canonica e $B' = ((1, 1, 0), (0, 1, 1), (1, 0, 1))$.
  1. Calcolare la matrice di cambio di base $P_(B' arrow.r B)$.
  2. Trovare le coordinate del vettore $v = (3, 5, 4)$ rispetto alla base $B'$.
]

#esercizio(tipo: "Calcolo")[
  Sia $F : RR^2 arrow.r RR^2$ la rotazione di $pi/2$ (base canonica: $A = mat(0, -1; 1, 0)$). Scrivere la matrice associata a $F$ rispetto alla base $B' = ((1, 1), (1, -1))$.
]

#esercizio(tipo: "Vero/Falso")[
  Stabilire se le seguenti affermazioni sono vere o false, giustificando la risposta:
  + Due matrici simili hanno lo stesso rango.
  + Se $F : V arrow.r W$ è lineare e suriettiva con $dim V = dim W$, allora $F$ è iniettiva.
  + Se $ker(F) = {0_V}$, allora $F$ è suriettiva.
]

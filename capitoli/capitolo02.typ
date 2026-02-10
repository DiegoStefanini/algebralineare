#import "../template.typ": *

= Spazi Vettoriali

Nel Capitolo 1 abbiamo lavorato con oggetti concreti --- matrici, vettori colonna, sistemi lineari --- e abbiamo osservato che su di essi si possono compiere operazioni di somma e prodotto per scalare che soddisfano proprietà familiari: la matrice nulla funge da elemento neutro per la somma, il prodotto per scalare è distributivo, e così via.

Queste stesse proprietà si ritrovano in contesti molto diversi: i polinomi si possono sommare e moltiplicare per costanti, le funzioni continue si possono combinare tra loro, e persino le successioni reali ammettono operazioni analoghe. Il concetto di *spazio vettoriale* nasce dall'osservazione che tutti questi oggetti condividono una struttura algebrica comune. Formalizzando questa struttura in modo assiomatico, possiamo dimostrare risultati generali che si applicano simultaneamente a tutti i casi concreti.

Il passaggio dal concreto all'astratto è il cuore dell'algebra lineare: d'ora in poi, studieremo non tanto i singoli oggetti, ma le *proprietà strutturali* che li accomunano. I vettori non saranno più necessariamente colonne di numeri, ma elementi di un qualsiasi insieme su cui siano definite operazioni che soddisfano gli assiomi appropriati.

== Definizione di Spazio Vettoriale

#definizione("Spazio Vettoriale")[
  Sia $KK$ un campo. Uno *spazio vettoriale* su $KK$ (o $KK$-spazio vettoriale) è un insieme non vuoto $V$, dotato di un'operazione di *addizione* $+ : V times V arrow.r V$ e di un'operazione di *prodotto per scalare* $dot : KK times V arrow.r V$, che soddisfano i seguenti assiomi.

  *Proprietà dell'addizione:*
  + *Associatività:* $(u + v) + w = u + (v + w)$ per ogni $u, v, w in V$
  + *Commutatività:* $u + v = v + u$ per ogni $u, v in V$
  + *Elemento neutro:* esiste un elemento $0_V in V$ tale che $v + 0_V = v$ per ogni $v in V$
  + *Opposto:* per ogni $v in V$ esiste un elemento $-v in V$ tale che $v + (-v) = 0_V$

  *Proprietà del prodotto per scalare:*
  + *Elemento unità:* $1 dot v = v$ per ogni $v in V$
  + *Associatività:* $(lambda mu) dot v = lambda dot (mu dot v)$ per ogni $lambda, mu in KK$ e $v in V$
  + *Distributività rispetto ai vettori:* $lambda dot (u + v) = lambda dot u + lambda dot v$ per ogni $lambda in KK$ e $u, v in V$
  + *Distributività rispetto agli scalari:* $(lambda + mu) dot v = lambda dot v + mu dot v$ per ogni $lambda, mu in KK$ e $v in V$
]

Gli elementi di $V$ si chiamano *vettori*; gli elementi di $KK$ si chiamano *scalari*. L'elemento $0_V$ si chiama *vettore nullo* dello spazio.

#osservazione[
  Gli assiomi non si dimostrano: sono le *regole del gioco*. Per stabilire che un dato insieme con certe operazioni è uno spazio vettoriale, si devono verificare tutti e otto gli assiomi sulle operazioni concrete dell'insieme in questione. Se anche un solo assioma non è soddisfatto, non si ha uno spazio vettoriale.
]

Dagli assiomi si deducono alcune proprietà che useremo costantemente, spesso senza menzionarle esplicitamente.

#proposizione("Conseguenze degli assiomi")[
  In ogni spazio vettoriale $V$ su $KK$:
  + Il vettore nullo $0_V$ è *unico*
  + L'opposto di ogni vettore è *unico*
  + $0 dot v = 0_V$ per ogni $v in V$
  + $lambda dot 0_V = 0_V$ per ogni $lambda in KK$
  + $(-1) dot v = -v$ per ogni $v in V$
  + Se $lambda dot v = 0_V$, allora $lambda = 0$ oppure $v = 0_V$
]

#dimostrazione[
  Dimostriamo la proprietà (3). Per ogni $v in V$:
  $
  0 dot v = (0 + 0) dot v = 0 dot v + 0 dot v
  $
  dove il primo passaggio usa $0 = 0 + 0$ in $KK$ e il secondo la distributività (assioma 8). Sommando $-(0 dot v)$ a entrambi i membri si ottiene $0_V = 0 dot v$. Le restanti proprietà si dimostrano con argomenti analoghi.
]

#attenzione[
  Non confondere lo scalare $0 in KK$ con il vettore nullo $0_V in V$: sono oggetti di natura diversa che vivono in insiemi diversi. Nella pratica, il contesto rende la distinzione chiara e si usa lo stesso simbolo $0$ per entrambi, ma nelle dimostrazioni è essenziale sapere a quale dei due ci si riferisce.
]

== Esempi di Spazi Vettoriali

La potenza della definizione assiomatica sta nella sua generalità: oggetti matematici di natura molto diversa rientrano nella stessa struttura.

#esempio(titolo: [$KK^n$])[
  L'insieme delle $n$-uple ordinate a coefficienti in $KK$:
  $
  KK^n = {(a_1, a_2, dots, a_n) : a_i in KK}
  $
  con le operazioni componente per componente
  $
  (a_1, dots, a_n) + (b_1, dots, b_n) = (a_1 + b_1, dots, a_n + b_n), quad lambda(a_1, dots, a_n) = (lambda a_1, dots, lambda a_n)
  $
  è uno spazio vettoriale su $KK$. Il vettore nullo è $(0, dots, 0)$. I casi $KK = RR$ e $KK = CC$ danno gli spazi $RR^n$ e $CC^n$. Lo spazio $RR^2$ corrisponde al piano cartesiano e $RR^3$ allo spazio ordinario della geometria.
]

#esempio(titolo: [$M_(m times n)(KK)$])[
  L'insieme delle matrici $m times n$ a coefficienti in $KK$, con la somma e il prodotto per scalare definiti nel Capitolo 1, è uno spazio vettoriale su $KK$. Il vettore nullo è la matrice nulla.
]

#osservazione[
  Lo spazio $KK^n$ può essere identificato con lo spazio delle matrici colonna $M_(n times 1)(KK)$. Questa identificazione è coerente con la notazione $A x = b$ del Capitolo 1, dove $x$ e $b$ sono vettori colonna. Si noti inoltre che il prodotto matriciale *non* fa parte della struttura di spazio vettoriale su $M_(m times n)(KK)$: la struttura riguarda esclusivamente somma e prodotto per scalare.
]

#esempio(titolo: [$KK[x]_(lt.eq m)$])[
  L'insieme dei polinomi a coefficienti in $KK$ di grado *al più* $m$:
  $
  KK[x]_(lt.eq m) = {a_0 + a_1 x + a_2 x^2 + dots + a_m x^m : a_i in KK}
  $
  con la somma e il prodotto per scalare usuali tra polinomi, è uno spazio vettoriale su $KK$. Il vettore nullo è il polinomio nullo (tutti i coefficienti uguali a zero), che è incluso per convenzione.
]

#esempio(titolo: "Spazi di funzioni")[
  L'insieme delle funzioni continue su un intervallo $[a, b]$:
  $
  C([a, b]) = {f : [a, b] arrow.r RR : f "è continua"}
  $
  con le operazioni definite puntualmente, $(f + g)(x) = f(x) + g(x)$ e $(lambda f)(x) = lambda dot f(x)$, è uno spazio vettoriale su $RR$. Il vettore nullo è la funzione identicamente nulla $f(x) = 0$. La verifica degli assiomi è garantita dai teoremi di analisi: somma e multiplo scalare di funzioni continue sono funzioni continue.

  Analogamente sono spazi vettoriali su $RR$:
  - l'insieme $C^1([a, b])$ delle funzioni derivabili con derivata continua,
  - l'insieme delle funzioni $f : RR arrow.r RR$ per cui esiste $lim_(x arrow.r +infinity) f(x)$,
  - l'insieme di *tutte* le funzioni $f : S arrow.r RR$ su un insieme $S$ qualsiasi.
]

#esempio(titolo: "Il campo come spazio su sé stesso")[
  Il campo $KK$ è uno spazio vettoriale su sé stesso: i vettori e gli scalari coincidono, e le operazioni sono quelle del campo. Più in generale, $CC$ è uno spazio vettoriale su $RR$, dove i vettori sono i numeri complessi e gli scalari sono i numeri reali.
]

#nota[
  In questo corso lavoreremo esclusivamente con i campi $RR$ e $CC$. Esistono anche spazi vettoriali su campi finiti (come $ZZ slash p ZZ$ con $p$ primo), che hanno applicazioni nella teoria dei codici e nella crittografia, ma esulano dal programma.
]

== Combinazioni Lineari

L'operazione fondamentale in uno spazio vettoriale è la *combinazione lineare*: prendere un numero finito di vettori, moltiplicarli per scalari e sommarne i risultati. Questa operazione è il mattone su cui si costruiscono tutti i concetti successivi.

#definizione("Combinazione Lineare")[
  Sia $V$ uno spazio vettoriale su $KK$ e siano $v_1, v_2, dots, v_k in V$. Un vettore $v in V$ si dice *combinazione lineare* di $v_1, dots, v_k$ se esistono scalari $lambda_1, lambda_2, dots, lambda_k in KK$ tali che:
  $
  v = lambda_1 v_1 + lambda_2 v_2 + dots + lambda_k v_k = sum_(i=1)^k lambda_i v_i
  $
  Gli scalari $lambda_1, dots, lambda_k$ si chiamano *coefficienti* della combinazione lineare.
]

#esempio[
  In $RR^3$, il vettore $(7, 1, 5)$ è combinazione lineare di $(1, 0, 1)$ e $(2, 1, 0)$ con coefficienti $5$ e $1$:
  $
  5(1, 0, 1) + 1(2, 1, 0) = (5, 0, 5) + (2, 1, 0) = (7, 1, 5)
  $
]

#esempio[
  In $RR[x]_(lt.eq 2)$, il polinomio $3 + 5x + x^2$ è combinazione lineare di $1 + x$, $x + x^2$ e $1$:
  $
  4(1 + x) + 1(x + x^2) + (-1)(1) = 4 + 4x + x + x^2 - 1 = 3 + 5x + x^2
  $
]

#osservazione[
  Il vettore nullo $0_V$ è sempre combinazione lineare di qualsiasi insieme di vettori: basta prendere tutti i coefficienti uguali a zero. Questa combinazione lineare si dice *banale* (o *triviale*).
]

== Dipendenza e Indipendenza Lineare

La nozione di indipendenza lineare cattura l'idea di assenza di ridondanza in un insieme di vettori: un vettore è ridondante quando si può esprimere come combinazione lineare degli altri.

#definizione("Dipendenza Lineare")[
  I vettori $v_1, v_2, dots, v_k in V$ si dicono *linearmente dipendenti* se esistono scalari $lambda_1, lambda_2, dots, lambda_k in KK$, *non tutti nulli*, tali che:
  $
  lambda_1 v_1 + lambda_2 v_2 + dots + lambda_k v_k = 0_V
  $
]

#definizione("Indipendenza Lineare")[
  I vettori $v_1, v_2, dots, v_k in V$ si dicono *linearmente indipendenti* se l'unica combinazione lineare che produce il vettore nullo è quella banale:
  $
  lambda_1 v_1 + lambda_2 v_2 + dots + lambda_k v_k = 0_V quad arrow.r.double quad lambda_1 = lambda_2 = dots = lambda_k = 0
  $
]

#osservazione[
  Le due definizioni sono complementari: un insieme di vettori è dipendente se e solo se non è indipendente. La terminologia riflette il significato intuitivo: vettori "dipendenti" sono tali che almeno uno di essi *dipende* dagli altri, nel senso che ne è combinazione lineare.
]

#esempio(titolo: "Vettori indipendenti in $RR^3$")[
  I vettori $e_1 = (1, 0, 0)$, $e_2 = (0, 1, 0)$, $e_3 = (0, 0, 1)$ sono linearmente indipendenti. Infatti, se
  $
  lambda_1 (1, 0, 0) + lambda_2 (0, 1, 0) + lambda_3 (0, 0, 1) = (0, 0, 0)
  $
  allora $(lambda_1, lambda_2, lambda_3) = (0, 0, 0)$.
]

#esempio(titolo: "Vettori dipendenti in $RR^3$")[
  I vettori $v_1 = (1, 2, 3)$, $v_2 = (4, 5, 6)$, $v_3 = (5, 7, 9)$ sono linearmente dipendenti, perché $v_3 = v_1 + v_2$, ovvero:
  $
  1 dot v_1 + 1 dot v_2 + (-1) dot v_3 = 0
  $
  con coefficienti $1, 1, -1$ non tutti nulli.
]

La seguente caratterizzazione chiarisce il significato concreto della dipendenza lineare.

#proposizione("Caratterizzazione della dipendenza")[
  I vettori $v_1, dots, v_k$ (con $k >= 2$) sono linearmente dipendenti se e solo se almeno uno di essi è combinazione lineare dei rimanenti.
]

#dimostrazione[
  ($arrow.r.double$) Se $lambda_1 v_1 + dots + lambda_k v_k = 0$ con, diciamo, $lambda_j != 0$, allora:
  $
  v_j = -lambda_j^(-1)(lambda_1 v_1 + dots + lambda_(j-1) v_(j-1) + lambda_(j+1) v_(j+1) + dots + lambda_k v_k)
  $

  ($arrow.l.double$) Se $v_j = mu_1 v_1 + dots + mu_(j-1) v_(j-1) + mu_(j+1) v_(j+1) + dots + mu_k v_k$, allora:
  $
  mu_1 v_1 + dots + (-1) v_j + dots + mu_k v_k = 0
  $
  e il coefficiente di $v_j$ è $-1 != 0$, quindi i vettori sono dipendenti.
]

#attenzione[
  Un insieme di vettori che contiene il vettore nullo è *sempre* linearmente dipendente: basta prendere coefficiente $1$ per il vettore nullo e $0$ per tutti gli altri. Di conseguenza, nessun vettore nullo può far parte di un insieme di vettori linearmente indipendenti.
]

#osservazione[
  In $KK^n$, la verifica dell'indipendenza lineare si riconduce a un problema già noto: la risoluzione di un sistema omogeneo. Dati $v_1, dots, v_k in KK^n$, si costruisce la matrice $A$ che li ha come colonne. I vettori sono linearmente indipendenti se e solo se il sistema $A x = 0$ ammette solo la soluzione banale, cioè se e solo se $r(A) = k$. Il collegamento tra indipendenza lineare e rango sarà approfondito nei prossimi capitoli.
]

== Sistemi di Generatori

Un sistema di generatori è un insieme di vettori che, attraverso combinazioni lineari, permette di raggiungere ogni elemento dello spazio vettoriale.

#definizione("Insieme generato")[
  Sia $V$ uno spazio vettoriale su $KK$ e siano $v_1, v_2, dots, v_k in V$. L'*insieme generato* (o *span*) di $v_1, dots, v_k$ è l'insieme di tutte le loro combinazioni lineari:
  $
  "Span"(v_1, dots, v_k) = chevron.l v_1, dots, v_k chevron.r = {lambda_1 v_1 + dots + lambda_k v_k : lambda_i in KK}
  $
]

#definizione("Sistema di Generatori")[
  Un insieme ${v_1, dots, v_k} subset.eq V$ si dice *sistema di generatori* di $V$ se ogni vettore di $V$ è combinazione lineare di $v_1, dots, v_k$:
  $
  V = "Span"(v_1, dots, v_k)
  $
  Si dice anche che $v_1, dots, v_k$ *generano* $V$.
]

#esempio(titolo: "Generatori canonici di $RR^2$")[
  I vettori $e_1 = (1, 0)$ e $e_2 = (0, 1)$ generano $RR^2$. Infatti, ogni vettore $(a, b) in RR^2$ si scrive come:
  $
  (a, b) = a(1, 0) + b(0, 1) = a e_1 + b e_2
  $
  Analogamente, i vettori $e_1 = (1, 0, dots, 0)$, $e_2 = (0, 1, dots, 0)$, $dots$, $e_n = (0, 0, dots, 1)$ generano $KK^n$.
]

#esempio(titolo: "Generatori non canonici di $RR^2$")[
  Anche $v_1 = (1, 1)$ e $v_2 = (1, -1)$ generano $RR^2$. Dato $(a, b) in RR^2$, si cercano $lambda_1, lambda_2$ tali che $lambda_1 (1, 1) + lambda_2 (1, -1) = (a, b)$, ottenendo il sistema:
  $
  cases(lambda_1 + lambda_2 = a, lambda_1 - lambda_2 = b) quad arrow.r.double quad lambda_1 = (a + b) / 2, quad lambda_2 = (a - b) / 2
  $
  Poiché il sistema ha sempre soluzione, $v_1$ e $v_2$ generano $RR^2$.
]

#esempio(titolo: "Sistema di generatori sovrabbondante")[
  L'insieme ${(1, 0), (0, 1), (1, 1)}$ genera $RR^2$, ma il terzo vettore è superfluo: $(1, 1) = (1, 0) + (0, 1)$. Ogni vettore di $RR^2$ si può già esprimere usando solo i primi due. In questo caso il sistema di generatori è *sovrabbondante*: contiene più vettori del necessario.
]

#osservazione[
  L'insieme $"Span"(v_1, dots, v_k)$ è chiuso rispetto alla somma e al prodotto per scalare: se $u$ e $w$ sono combinazioni lineari di $v_1, dots, v_k$, anche $u + w$ e $lambda u$ lo sono. In altre parole, $"Span"(v_1, dots, v_k)$ è a sua volta uno spazio vettoriale (un *sottospazio* di $V$). Questa è la stessa proprietà osservata nel Capitolo 1 per l'insieme delle soluzioni di un sistema omogeneo $A x = 0$: in effetti, quell'insieme è esattamente lo span di un opportuno insieme di vettori soluzione.
]

#osservazione[
  Quando un sistema di generatori è sovrabbondante, la rappresentazione di un vettore come combinazione lineare non è unica. Ci si può chiedere quale sia il "minimo" sistema di generatori, cioè un sistema che non contenga vettori superflui. Questa domanda, strettamente collegata alla nozione di indipendenza lineare, sarà formalizzata nei prossimi capitoli.
]

// ============================================================
// ALGEBRA LINEARE - DISPENSE COMPLETE
// ============================================================
// Dispense universitarie per il corso di Algebra Lineare
// Università di Pisa - Corso di Laurea in Informatica
// ============================================================

#import "template.typ": *

#show: conf

// ============================================================
// COPERTINA
// ============================================================
#set page(numbering: none)

#v(2cm)

#align(center)[
  #text(size: 14pt, tracking: 0.3em)[UNIVERSITÀ DI PISA]

  #v(0.3cm)

  #text(size: 11pt)[Dipartimento di Informatica]

  #v(0.2cm)

  #text(size: 11pt)[Corso di Laurea in Informatica]
]

#v(2cm)

#align(center)[
  #block(
    width: 80%,
    stroke: (y: 1pt + black),
    inset: (y: 15pt),
  )[
    #text(size: 28pt, weight: "bold")[Algebra Lineare]

    #v(0.5cm)

    #text(size: 14pt)[Dispense per il Corso di Laurea in Informatica]
  ]
]

#v(2cm)

#align(center)[
  #grid(
    columns: 2,
    column-gutter: 3cm,
    row-gutter: 0.8cm,
    align: (right, left),
    [#text(weight: "bold")[Docente:]], [Prof. Patrizio Frosini],
    [#text(weight: "bold")[Autore:]], [Diego Stefanini],
  )
]

#v(1fr)

#align(center)[
  #text(size: 9pt, fill: gray)[
    Per contribuire: #link("https://github.com/DiegoStefanini/unipi/algebra")
  ]

  #v(0.5cm)

  #line(length: 30%, stroke: 0.5pt + gray)

  #v(0.5cm)

  #text(size: 11pt)[Anno Accademico 2025/2026]

  #v(0.3cm)

  #text(size: 9pt, fill: gray)[
    Ultima revisione: #datetime.today().display("[day]/[month]/[year]")
  ]
]

#v(1cm)

// ============================================================
// PREFAZIONE
// ============================================================
#pagebreak()
#set page(numbering: "i")

#align(center)[
  #text(size: 16pt, weight: "bold")[Prefazione]
]

#v(0.5cm)

Queste dispense sono concepite come un testo auto-consistente per lo studio dell'Algebra Lineare. Il loro obiettivo è permettere allo studente di apprendere la materia in modo autonomo, partendo dai concetti fondamentali e costruendo progressivamente gli strumenti necessari per affrontare i risultati più avanzati. Il rigore delle definizioni e delle dimostrazioni è accompagnato da un'attenzione costante alla chiarezza espositiva e alla motivazione intuitiva.

#v(0.3cm)

*Filosofia didattica.* La trattazione segue una progressione precisa all'interno di ogni argomento: si parte dall'intuizione e dalla motivazione, si procede con il formalismo rigoroso delle definizioni, si esplorano le proprietà e le conseguenze, si dimostrano i risultati principali, e infine si consolida la comprensione attraverso gli esercizi. Le dimostrazioni non sono presentate come semplici giustificazioni dei risultati, ma come strumenti per insegnare il metodo del ragionamento matematico: ogni prova è un'occasione per imparare una tecnica dimostrativa o un modo di pensare.

#v(0.3cm)

*Come usare questo testo.* Si consiglia di procedere in ordine sequenziale: ogni capitolo si basa sui concetti dei precedenti, e saltare una definizione può rendere incomprensibili i risultati successivi. Le definizioni sono i mattoni fondamentali della teoria --- è essenziale comprenderle a fondo prima di procedere con i teoremi. Gli esercizi proposti non si limitano al calcolo: includono dimostrazioni, costruzioni di controesempi e problemi di tipo vero/falso, pensati per sviluppare il senso critico e la padronanza del linguaggio matematico.

#v(0.3cm)

*Convenzioni tipografiche.* Il testo adotta le seguenti convenzioni:
- I *termini definiti per la prima volta* sono indicati in grassetto all'interno delle definizioni
- Gli _enunciati di teoremi, lemmi, corollari e proposizioni_ sono composti in corsivo
- Le dimostrazioni si concludono con il simbolo $square.stroked$
- Le note e le osservazioni forniscono chiarimenti e punti di vista complementari
- Le sezioni di _attenzione_ segnalano errori comuni e fraintendimenti frequenti

#v(0.3cm)

*Notazione.* Si adottano le seguenti convenzioni notazionali, standard nei testi di algebra lineare:
- $KK$ indica un campo generico (tipicamente $RR$ o $CC$)
- $RR$ e $CC$ denotano rispettivamente i numeri reali e i numeri complessi
- $arrow(v)$ indica un vettore; le matrici sono indicate con lettere latine maiuscole ($A$, $B$, $C$)
- $""^t A$ denota la trasposta della matrice $A$
- $M_(m times n)(KK)$ è l'insieme delle matrici $m times n$ a coefficienti in $KK$
- $r(A)$ indica il rango della matrice $A$

#v(0.3cm)

*Invito allo studio attivo.* L'apprendimento della matematica richiede partecipazione attiva. Prima di leggere una dimostrazione, si tenti di costruirla autonomamente; prima di consultare la soluzione di un esercizio, si cerchi di risolverlo da soli. L'errore e il tentativo sono parte essenziale del processo di apprendimento. Un risultato compreso in profondità, anche a costo di tempo e fatica, vale assai più di molti risultati appresi passivamente.

// ============================================================
// INDICE
// ============================================================
#pagebreak()

#v(2cm)
#align(center)[
  #line(length: 70%, stroke: 0.5pt + black)
  #v(0.5cm)
  #text(size: 22pt, weight: "bold")[Indice]
  #v(0.5cm)
]
#v(0.5cm)
#outline(title: none, indent: 1.5em, depth: 2)

// ============================================================
// CONTENUTO
// ============================================================
#pagebreak()
#set page(numbering: "1")
#counter(page).update(1)

#include "capitoli/capitolo01.typ"

#include "capitoli/capitolo02.typ"

// Prossimi capitoli:
// #include "capitoli/capitolo03.typ"

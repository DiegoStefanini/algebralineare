// ============================================================
// TEMPLATE DISPENSE UNIVERSITARIE - ALGEBRA LINEARE
// Stile tradizionale da libro di testo
// Numerazione unificata: Capitolo.Sezione.Numero
// ============================================================

// Contatore unico per tutti i blocchi numerati (Cap.Sez.Num)
#let contatore-blocco = counter("blocco")

// Helper: incrementa il contatore e restituisce il numero formattato
#let _prossimo-numero() = {
  contatore-blocco.step()
  context {
    let h = counter(heading).get()
    let b = contatore-blocco.get().first()
    let ch = h.at(0, default: 0)
    let sec = h.at(1, default: 0)
    [#ch.#sec.#b]
  }
}

// Configurazione documento
#let conf(doc) = {
  set document(title: "Algebra Lineare - Dispense", author: "Diego Stefanini")

  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2cm),
    numbering: "1",
    header: context {
      if counter(page).get().first() > 1 {
        set text(size: 9pt, fill: gray)
        [Algebra Lineare — Dispense #h(1fr) #counter(page).display()]
      }
    },
  )

  set text(font: "New Computer Modern", size: 11pt, lang: "it")
  set par(justify: true, leading: 0.65em, first-line-indent: 1em)
  set heading(numbering: "1.1.")
  set math.equation(numbering: "(1)")
  set list(indent: 1em, body-indent: 0.5em)
  set enum(indent: 1em, body-indent: 0.5em)

  // Capitoli: stile "CAPITOLO N" con linee
  show heading.where(level: 1): it => {
    contatore-blocco.update(0)
    pagebreak()
    v(2cm)
    align(center)[
      #line(length: 70%, stroke: 0.5pt + black)
      #v(0.8cm)
      #text(size: 12pt, tracking: 0.15em)[CAPITOLO #context counter(heading).display("1")]
      #v(0.4cm)
      #text(size: 22pt, weight: "bold")[#it.body]
      #v(0.8cm)
      #line(length: 70%, stroke: 0.5pt + black)
    ]
    v(1cm)
  }

  // Sezioni: reset contatore blocchi
  show heading.where(level: 2): it => {
    contatore-blocco.update(0)
    v(0.5cm)
    block(breakable: false)[
      #set text(size: 12pt, weight: "bold")
      #it
      #v(0.2cm)
    ]
  }

  // Sotto-sezioni
  show heading.where(level: 3): it => {
    v(0.3cm)
    block(breakable: false)[
      #set text(size: 11pt, weight: "bold")
      #it
      #v(0.1cm)
    ]
  }

  // Indice: capitoli in grassetto
  show outline.entry.where(level: 1): it => {
    v(0.3em, weak: true)
    strong(it)
  }

  doc
}

// ============================================================
// AMBIENTI TEORICI (numerazione unificata Cap.Sez.Num)
// ============================================================

// Definizione - concetti fondamentali
// Etichetta in grassetto, corpo in testo normale
#let definizione(titolo, corpo) = {
  v(0.6em)
  [*Definizione #_prossimo-numero()#if titolo != none and titolo != "" [ (#titolo)].*]
  [ ] + corpo
  v(0.4em)
}

// Teorema - risultato principale
// Etichetta in grassetto, corpo in corsivo (tradizione matematica)
#let teorema(titolo, corpo) = {
  v(0.6em)
  [*Teorema #_prossimo-numero()#if titolo != none and titolo != "" [ (#titolo)].*]
  [ ] + emph(corpo)
  v(0.4em)
}

// Lemma - risultato ausiliario
// Etichetta in grassetto, corpo in corsivo
#let lemma(titolo, corpo) = {
  v(0.6em)
  [*Lemma #_prossimo-numero()#if titolo != none and titolo != "" [ (#titolo)].*]
  [ ] + emph(corpo)
  v(0.4em)
}

// Corollario - conseguenza diretta
// Etichetta in grassetto, corpo in corsivo
#let corollario(titolo, corpo) = {
  v(0.6em)
  [*Corollario #_prossimo-numero()#if titolo != none and titolo != "" [ (#titolo)].*]
  [ ] + emph(corpo)
  v(0.4em)
}

// Proposizione - risultato intermedio
// Etichetta in grassetto, corpo in corsivo
#let proposizione(titolo, corpo) = {
  v(0.6em)
  [*Proposizione #_prossimo-numero()#if titolo != none and titolo != "" [ (#titolo)].*]
  [ ] + emph(corpo)
  v(0.4em)
}

// ============================================================
// AMBIENTI DI SUPPORTO
// ============================================================

// Dimostrazione - con QED finale
// Parametro stile: per indicare il tipo (none, "intuitiva", "formale", "per casi", etc.)
#let dimostrazione(corpo, stile: none) = {
  v(0.4em)
  if stile != none {
    [_*Dimostrazione (#stile).*_]
  } else {
    [_*Dimostrazione.*_]
  }
  [ ] + corpo
  h(1fr)
  $square.stroked$
  v(0.4em)
}

// Esempio - numerato
// Parametro titolo: opzionale
#let esempio(corpo, titolo: none) = {
  v(0.6em)
  [*Esempio #_prossimo-numero()#if titolo != none and titolo != "" [ (#titolo)].*]
  [ ] + corpo
  v(0.4em)
}

// Osservazione - numerata
#let osservazione(corpo) = {
  v(0.4em)
  [*Osservazione #_prossimo-numero().*]
  [ ] + corpo
  v(0.4em)
}

// Esercizio - numerato
// Parametro tipo: opzionale (es. "Verifica", "Dimostrazione", "Controesempio", "Vero/Falso")
#let esercizio(corpo, tipo: none) = {
  v(0.6em)
  if tipo != none {
    [*Esercizio #_prossimo-numero() — #tipo.*]
  } else {
    [*Esercizio #_prossimo-numero().*]
  }
  [ ] + corpo
  v(0.4em)
}

// Nota - inline con il corpo
#let nota(corpo) = {
  v(0.3em)
  [_*Nota.*_]
  [ ] + corpo
  v(0.3em)
}

// Attenzione - errori comuni
#let attenzione(corpo) = {
  v(0.3em)
  [*Attenzione:*]
  [ ] + corpo
  v(0.3em)
}

// Ricorda - concetti chiave
#let ricorda(corpo) = {
  v(0.4em)
  [*Da ricordare.*]
  [ ] + corpo
  v(0.4em)
}

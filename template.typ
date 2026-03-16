// ============================================================
// TEMPLATE DISPENSE UNIVERSITARIE - ALGEBRA LINEARE
// Stile con box colorati e filetti laterali
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

  set text(font: "STIX Two Text", size: 11pt, lang: "it")
  set par(justify: true, leading: 0.65em, first-line-indent: 1em)
  set heading(numbering: "1.1.")
  set math.equation(numbering: "(1)")
  set list(indent: 1em, body-indent: 0.5em)
  set enum(indent: 1em, body-indent: 0.5em)

  show heading: set text(rgb("#003366"))

  // Capitoli: stile "CAPITOLO N" con linee colorate
  show heading.where(level: 1): it => {
    contatore-blocco.update(0)
    pagebreak()
    v(2cm)
    align(center)[
      #line(length: 60%, stroke: 0.4pt + rgb("#003366"))
      #v(0.8cm)
      #text(size: 11pt, tracking: 0.2em, fill: rgb("#003366"))[CAPITOLO #context counter(heading).display("1")]
      #v(0.4cm)
      #text(size: 22pt, weight: "bold", fill: rgb("#003366"))[#it.body]
      #v(0.8cm)
      #line(length: 60%, stroke: 0.4pt + rgb("#003366"))
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

  // Sotto-sotto-sezioni
  show heading.where(level: 4): it => {
    v(0.2cm)
    block(breakable: false)[
      #set text(size: 11pt, weight: "bold", style: "italic")
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
// AMBIENTI TEORICI (box colorati con filetti laterali)
// ============================================================

// Definizione — box blu
#let definizione(titolo, corpo) = {
  v(1em)
  rect(
    width: 100%,
    stroke: (left: 4pt + rgb("#003366")),
    inset: (x: 1.2em, y: 1em),
    fill: rgb("#f4f7fb"),
    radius: (right: 4pt),
  )[
    *#smallcaps[Definizione] #_prossimo-numero()#if titolo != none and titolo != "" [ (#titolo)].* #corpo
  ]
  v(1em)
}

// Teorema — box viola
#let teorema(titolo, corpo) = {
  v(1em)
  rect(
    width: 100%,
    stroke: (left: 4pt + rgb("#5b2c6f")),
    inset: (x: 1.2em, y: 1em),
    fill: rgb("#f8f4fc"),
    radius: (right: 4pt),
  )[
    *#smallcaps[Teorema] #_prossimo-numero()#if titolo != none and titolo != "" [ (#titolo)].* #emph(corpo)
  ]
  v(1em)
}

// Lemma — box viola chiaro
#let lemma(titolo, corpo) = {
  v(1em)
  rect(
    width: 100%,
    stroke: (left: 4pt + rgb("#7d3c98")),
    inset: (x: 1.2em, y: 1em),
    fill: rgb("#faf5fe"),
    radius: (right: 4pt),
  )[
    *#smallcaps[Lemma] #_prossimo-numero()#if titolo != none and titolo != "" [ (#titolo)].* #emph(corpo)
  ]
  v(1em)
}

// Corollario — box viola chiaro
#let corollario(titolo, corpo) = {
  v(1em)
  rect(
    width: 100%,
    stroke: (left: 4pt + rgb("#7d3c98")),
    inset: (x: 1.2em, y: 1em),
    fill: rgb("#faf5fe"),
    radius: (right: 4pt),
  )[
    *#smallcaps[Corollario] #_prossimo-numero()#if titolo != none and titolo != "" [ (#titolo)].* #emph(corpo)
  ]
  v(1em)
}

// Proposizione — box viola chiaro
#let proposizione(titolo, corpo) = {
  v(1em)
  rect(
    width: 100%,
    stroke: (left: 4pt + rgb("#7d3c98")),
    inset: (x: 1.2em, y: 1em),
    fill: rgb("#faf5fe"),
    radius: (right: 4pt),
  )[
    *#smallcaps[Proposizione] #_prossimo-numero()#if titolo != none and titolo != "" [ (#titolo)].* #emph(corpo)
  ]
  v(1em)
}

// ============================================================
// AMBIENTI DI SUPPORTO (box colorati)
// ============================================================

// Dimostrazione — box tratteggiato grigio, corpo 10pt
#let dimostrazione(corpo, stile: none) = {
  v(0.8em)
  rect(
    width: 100%,
    stroke: (left: 3pt + rgb("#95a5a6")),
    inset: (x: 1.2em, y: 0.8em),
    fill: rgb("#fafafa"),
    radius: (right: 4pt),
  )[
    #set text(size: 10pt)
    #if stile != none {
      [_*Dimostrazione (#stile).*_]
    } else {
      [_*Dimostrazione.*_]
    }
    #[ ] #corpo
    #h(1fr) $square.stroked$
  ]
  v(0.8em)
}

// Esempio — box arancione
#let esempio(corpo, titolo: none) = {
  v(1em)
  rect(
    width: 100%,
    stroke: (left: 4pt + rgb("#e67e22")),
    inset: (x: 1.2em, y: 1em),
    fill: rgb("#fffaf5"),
    radius: (right: 4pt),
  )[
    *#smallcaps[Esempio] #_prossimo-numero()#if titolo != none and titolo != "" [ (#titolo)].* #corpo
  ]
  v(1em)
}

// Osservazione — box grigio
#let osservazione(corpo) = {
  v(1em)
  rect(
    width: 100%,
    stroke: (left: 4pt + rgb("#7f8c8d")),
    inset: (x: 1.2em, y: 1em),
    fill: rgb("#fdfdfd"),
    radius: (right: 4pt),
  )[
    *#smallcaps[Osservazione] #_prossimo-numero().* #corpo
  ]
  v(1em)
}

// Esercizio — box verde
#let esercizio(corpo, tipo: none) = {
  v(1em)
  rect(
    width: 100%,
    stroke: (left: 4pt + rgb("#27ae60")),
    inset: (x: 1.2em, y: 1em),
    fill: rgb("#f0faf4"),
    radius: (right: 4pt),
  )[
    #if tipo != none {
      [*#smallcaps[Esercizio] #_prossimo-numero() — #tipo.*]
    } else {
      [*#smallcaps[Esercizio] #_prossimo-numero().*]
    }
    #[ ] #corpo
  ]
  v(1em)
}

// Nota — box azzurro chiaro
#let nota(corpo) = {
  v(0.8em)
  rect(
    width: 100%,
    stroke: (left: 3pt + rgb("#3498db")),
    inset: (x: 1.2em, y: 0.8em),
    fill: rgb("#f5faff"),
    radius: (right: 4pt),
  )[
    [_*Nota.*_]
    #[ ] #corpo
  ]
  v(0.8em)
}

// Attenzione — box rosso
#let attenzione(corpo) = {
  v(0.8em)
  rect(
    width: 100%,
    stroke: (left: 4pt + rgb("#e74c3c")),
    inset: (x: 1.2em, y: 1em),
    fill: rgb("#fdf2f2"),
    radius: (right: 4pt),
  )[
    *Attenzione:* #corpo
  ]
  v(0.8em)
}

// Da ricordare — box teal
#let ricorda(corpo) = {
  v(0.8em)
  rect(
    width: 100%,
    stroke: (left: 4pt + rgb("#16a085")),
    inset: (x: 1.2em, y: 1em),
    fill: rgb("#f0faf8"),
    radius: (right: 4pt),
  )[
    *Da ricordare.* #corpo
  ]
  v(0.8em)
}

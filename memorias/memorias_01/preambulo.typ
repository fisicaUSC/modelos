//
// Modelo de memorias de laboratorio
//
// https://github.com/fisicaUSC/modelos

// Algunhas fontes:
// - Encabezado alternante: https://forum.typst.app/t/how-to-set-headers-and-page-numbers-with-alternating-text-on-even-and-odd-pages/2992
// - Autoría múltiple: https://github.com/typst/typst/discussions/1504
// - Apéndice: https://github.com/typst/typst/discussions/4031

#import "@preview/muchpdf:0.1.1": muchpdf


#let documento(
  titulo: none,
  laboratorio: none,
  materia: none,
  autoria: "",
  // Exemplo:
  // (
  //   "Nome Apelido": (
  //     "email": "nome.apelido@rai.usc.gal",
  //   )
  // )
  resumo: "",
  curso: "Curso 2025-2026",
  data: datetime.today().display("[month repr:long] [year]"),
  body,
) = {

  set page(
    paper: "a4",
    //margin: (top: 15mm, bottom: 2mm, right: 3mm, left: 3mm),
    numbering: "1",
    header: context {
        if here().page() == 1 {
            []
        } else {
            let page = counter(page).get().first()
            let body = if calc.odd(page) [#strong(str(page)) #h(0.5cm) #upper(titulo)]
            else [#upper(materia) #h(0.5cm) #strong(str(page))]
            let alignment = if calc.odd(page) { left } else { right }
            align(alignment, body)
           // [header other pages]
        }},
    footer: none
  )

  set text(font: "New Computer Modern", size: 11pt, lang: "gl")
  // Mellores alternativas en fontes
  //set text(size: 11pt, lang: "gl")
  //set text(font: "CMU Bright", size: 11pt, lang: "gl")

  set par(justify: true, leading: 0.52em)
  set heading(numbering: "1.1")
  set enum(indent: 1.5em, spacing: 1em)
  set list(indent: 1.5em)
  show link: set text(rgb(0,51,153))


  [
  #v(30pt)
  #grid(
    columns: (1fr, 1fr),
    align(left)[
      #muchpdf(
        read("fig/logo-USC-fisica.pdf", encoding: none),
        scale: 2,
      )
    ],
    align(right)[#v(10pt)
      #materia\
      #curso\

      #emph(data)
    ],
  )
  #v(50pt)
  #align(left, text(17pt)[
    #text(14pt)[#laboratorio] \ #v(0pt)
    *#titulo*
  ])
  #line(length: 100%, stroke: 0.5pt)
  #v(10pt)

  // Bloque de autoría
  #block([
    // Procesa o texto para cada autor un a un
    #for (id, au) in autoria.keys().enumerate() {
      let au_meta = autoria.at(au)
      // Non poñer coma antes do primeiro autor
      if id != 0 {
        text([, ])
        text([\ ])
      }
      // Escribe o nome do autor
      if au_meta.keys().contains("name") {
        text([#au_meta.name])
      } else {
        text([#au])
      }
      // Email do autor
      if au_meta.keys().contains("email") and au_meta.email != "" {
        footnote(numbering: "1")[
          // Autor e correo electrónico
          #if au_meta.keys().contains("email") {
            [#link("mailto:" + au_meta.email)]
          }
        ]
      }
    }
  ])

  #v(8pt)
  #align(left)[
  #set par(justify: true)
  #resumo
  ]

  ]
  body
}

#let appendix(body) = {
  set heading(numbering: "A", supplement: [Apéndice])
  counter(heading).update(0)
  body
}

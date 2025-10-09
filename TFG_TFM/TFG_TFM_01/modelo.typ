/*
    MIRAR COMO SE PODE FACER PARA POÑER O TÍTULO DA SECCIÓN ACTUAL DA PÁXINA NO
    HEADER.
*/

#let azul_usc = color.rgb( 15, 41, 118)
#let gris = color.rgb( 234, 236, 240)
#let seccion = state("seccion", ([],))

#let crear_encabezado() = [
    #grid(
        columns: (1fr, 1fr, 1fr),
        rows: (1fr, 1mm),
        stroke: none,
        context {seccion.get().last()},
        [~],
        [~],
        line(length: 100%, stroke: 0.5pt),
        line(length: 100%, stroke: 0.5pt),
        line(length: 100%, stroke: 0.5pt),
    )
]

#let crear_portada(
    titulo             : none,
    autoria            : none,
    titor              : none,
    area_titor         : none,
    departamento_titor : none,
    cotitor            : none,
    afiliacion_cotitor : none,
    data_defensa       : none,
) = {

    table(
        columns: (15em, 1fr),
        column-gutter: 0cm,
        stroke: none,
        align: (right, center),
        image("imaxes/usc.png", width: 10em),
        [
            #set text(size: 14pt, azul_usc)
            #set par(leading:0.9em)
            #show: eso => smallcaps[#eso]

            Facultade de Física \
            Grao en Física \
            Curso 2025-26 \
            #text(size: 17pt)[Traballo de Fin de Grao]

        ]
    )

    v(30mm)

    // Título
    {
        set align(center)
        line(length: 65mm, stroke: 0.2mm)
        v(10mm)
        text(size: 20pt)[#titulo]
        v(10mm)
        line(length: 65mm, stroke: 0.2mm)
        v(20mm)
    }

    //Autor, titor e cotitor
    // non fai falta a táboa pero dame pereza quitala
    table(
        rows: (5em, 6em, 5em),
        columns: 1fr,
        align: left,
        stroke: none,
        [
            #text(size: 14pt, style: "italic")[Autor:] \
            #text(size: 16pt, weight: "bold")[#autoria.first()] // :FACER: array
        ],
        [
            #text(size: 14pt, style: "oblique")[Titor:]\
            #text(size: 14pt, weight: "bold")[#titor]\
            #text( size: 14pt, style: "oblique",)[#area_titor, #departamento_titor]\
        ],
        [
            #text(size: 14pt, style: "oblique")[Cotitor: (opcional)]\
            #text(size: 14pt, weight: "bold")[#cotitor]\
            #text(size: 14pt, style: "oblique")[Affiliation do cotitor]
        ]
    )

    align(right)[#data_defensa.display("[day]-[month repr:numerical]-[year]")]

    v(10mm)

    [
        #set align(center)
        #set par(first-line-indent: 0pt)
        #set text(size:6pt, weight:"bold")
        O autor autoriza a consulta e emprego desta memoria para uso
        académico e de investigación (autorización detallada nas
        páxinas interiores).
    ]

}

#let crear_presentacion(
    titulo             : none,
    autoria            : none,
    titor              : none,
    area_titor         : none,
    departamento_titor : none,
    cotitor            : none,
    afiliacion_cotitor : none,
    data_defensa       : none,
) = [

    Facultade de Física

    Grao en Física

    Curso 2025-26

    #smallcaps[Traballo de Fin de Grao]

    #v(30mm)

    #smallcaps[#text(size: 20pt)[#titulo]]

    #v(30mm)

    _Autor_: *#autoria.first()*

    _Titor_: *#titor* #text(style: "oblique")[#area_titor, #departamento_titor]

    _Cotitor (opcional)_: *#cotitor*, #text(style: "oblique")[#afiliacion_cotitor]

    #v(10mm)

    Opcionalmente, incluír aquí liñas de agradecementos a outras persoas que
    colaborasen, referencias a financiación económica, notas sobre patentes ou
    publicacións de traballos derivados do traballo, ou calqueira outra información
    complementaria de contextualización xeral do traballo que considere convinte.

    #v(2em)

    #set align(right)
    Data de presentación: #data_defensa.display("[day]-[month repr:numerical]-[year]")

]

#let declaracions = [

    #text(style: "oblique")[
        #h(10mm) Declaración asinada polo autor da orixinalidade do traballo
    ]

    O autor do traballo declara que o presente é un traballo orixinal. Autoriza
    asemade ao control por persoal da Universidade de Santiago de Compostela da
    devandita orixinalidade, eventualmente mediante o emprego de bases de datos
    e a inclusión nelas.

    En Santiago de Compostela, a X de Febreiro de 2020. Asinado, #v(30mm)

    #text(style: "oblique")[
        Autorización do autor á difusión do traballo (opcional)
    ]

    O  autor autoriza á difusión do traballo aos efectos considerados nos vixentes
    regulamentos de TFG e TFM da Universidade de Santiago de Compostela (Artigo
    11.3) e de TFM do Máster en Física (Artigo 33), entendendo que esta
    autorización non inflúe na propiedade intelectual do traballo nen á
    posibilidade de publicar o mesmo total ou parcialmente por outros medios.
    Autoriza asemade a que a Facultade de Física desa Universidade dispoña de
    copia electrónica do traballo para o seu arquivo, consulta e emprego para
    usos académicos e de investigación coa mención específica ao autor.

    En Santiago de Compostela, a X de Febreiro de 2020. Asinado,
]

#let crear_indice() = {

    show outline.entry.where(level: 1): eso => {
        set block(above: 1.2em)
        set block(below: 1.2em)
        set text(weight: "bold", size: 15pt)
        eso
    }
    outline(title: auto)

}


#let estilo_tfg(
    titulo             : none,
    autoria            : none,
    titor              : none,
    area_titor         : none,
    departamento_titor : none,
    cotitor            : none,
    afiliacion_cotitor : none,
    data_defensa       : none,
    resumos            : none,
    documento,
) = {
    set page(
        paper: "a4",
        margin: (x: 20mm, y: 30mm),
        header: crear_encabezado()
    )
    set text(
        size: 12pt,
        lang: "gl",
        font: "New Computer Modern",
        hyphenate: true,
    )
    set heading(numbering: "1.")
    set par(
        spacing: 5mm,
        first-line-indent: (amount: 10mm, all: true),
        hanging-indent: 5mm,
        justify: true,
    )

    crear_portada(
        titulo             : titulo ,
        autoria            : autoria ,
        titor              : titor ,
        area_titor         : area_titor ,
        departamento_titor : departamento_titor,
        cotitor            : cotitor ,
        afiliacion_cotitor : afiliacion_cotitor,
        data_defensa       : data_defensa ,
    )

    pagebreak(to: "odd") // páxina en blanco detrás da portada

    crear_presentacion(
        titulo             : titulo ,
        autoria            : autoria ,
        titor              : titor ,
        area_titor         : area_titor ,
        departamento_titor : departamento_titor,
        cotitor            : cotitor ,
        afiliacion_cotitor : afiliacion_cotitor,
        data_defensa       : data_defensa ,
    )

    pagebreak()

    declaracions

    pagebreak()

    resumos

    context[#seccion.final()]
    pagebreak()

    crear_indice()

    show heading.where(level: 1): eso => {
        let corpo = eso.body
        seccion.update(eso => eso + (corpo,))
        [#context { counter(heading.where(level:1)).get().first() }.#corpo]
    }
    set page(numbering: "1")
    counter(page).update(1)

    documento

    pagebreak()

    bibliography(
        "referencias.yml",
        title: "Referencias",
        full: true,
    )

}


// Resto dos capítulos

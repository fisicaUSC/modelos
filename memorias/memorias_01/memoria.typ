
#import "preambulo.typ": *
#import "@preview/booktabs:0.0.4": *
#show: booktabs-default-table-style

#let resumo= [
*Obxectivos*. A presente práctica ten como obxectivo levar a cabo unha estimación das taxas de dispersión de partículas $alpha$ por unha lámina de ouro en función do ángulo, para a xeometría plana $N_d$ e a súa corrección tridimensional. Estes datos permitirannos verificar a validez da fórmula de dispersión de Rutherford e, á súa vez, utilizala para estimar o número atómico $Z$ do aluminio.
]

#show: documento.with(
  titulo: "Dispersión de Rutherford",
  laboratorio: "Laboratorio de Física Cuántica",
  materia: "Técnicas Experimentais III (G1031326)",
  autoria: (
    "Ernest Rutherford": ("email": "ernestito.toyota@rai.usc.gal"),
    "Maruxaina": ("email": "betanzos.tortilla@rai.usc.gal")
  ),
  resumo: resumo,
  curso: "Curso 2025-2026",
  data: "Abril 2026"
)


#outline()
#pagebreak()

= Introdución
Isto xa se dixo na clase.

= Materiais e métodos
A continuación descríbese brevemente o material que compón o noso dispositivo experimental e o papel que desempeña na realización do experimento:

+ Ovos
+ Avena
+ Tofu
+ Mazás

Tal e como se pode ver na @fig:dispositivo-experimental e @fig:raxo-con-patacas, o material é da última xeración que acordou a peseta. 

#table(
columns:(1fr,1fr),
stroke: none,
[#align(center)[
    #figure(
    //image("fig/dispositivo-experimental.jpg", width: 80%),
    rect[Quedamos sen debuxos, perdón.],
    caption: [Debuxo esquemático do dispositivo experimental.],
  ) <fig:dispositivo-experimental>]
]
,
[
#align(center)[
    #figure(
    //image("fig/outra-imaxe.jpg", width: 80%),
    rect[Que se quere bolsa.],
    caption: [Isto sería un descrición #emoji.face.beam.],
  ) <fig:raxo-con-patacas>]
])


#pagebreak()

= Resultados

== Dependencia co ángulo de dispersión
Os datos obtidos recóllense na @tab:dispersion-angulo.

#align(center)[
  #figure(
  table(
    columns: 3,
    align: (center, center, center),
    toprule(),
    table.header([$theta" "^(circle.stroked.small)$], [$N" "("s"^(-1))$ ], [$u(N)" "("s"^(-1))$]),
    midrule(),
    [-30], [0,568], [0,062],
    [-25], [1,17], [0,13],
    [-20], [4,22], [0,55],
    bottomrule()
  ),
  caption: [Uns modestos datos da dispersión en función do ángulo.],
  ) <tab:dispersion-angulo>
]



= Conclusións
Os resultados non concordan co modelo teórico, o que suxire que ou Rutherford non tiña nin idea ou, máis probálmente, que a cuántica sexa mentira.

#bibliography("bibliografia.bib", style: "american-physics-society", full: true)

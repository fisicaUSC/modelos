#import("modelo.typ"): *

#show: estilo_tfg.with(
    titulo             : smallcaps[Titulo do traballo],
    autoria            : ("Autores",),
    titor              : "Titor",
    cotitor            : "Cotitor",
    afiliacion_cotitor : "Afiliacion Cotitor",
    area_titor         : "Area Titor",
    departamento_titor : "Departamento Titor",
    data_defensa       : datetime( year: 2025, month: 1, day: 5,),
    resumos            : include("partes/resumos.typ")
)

#include("partes/introduccion.typ")
#include("partes/cap1.typ")
#include("partes/cap2.typ")
#include("partes/conclusions.typ")

#import("modelo.typ"): *

/* README

O campo de autoría debe ser sempre un array de strings
    - autoria: ("Autor1", "Autor2", [···], "AutorN") 
Se hai un só autor é importante rematar cunha coma:
    - autoria: ("Autor",)
Se queres que se xere un salto de liña ao escribir o seguinte autor podes:
    - (fácil) Insertar un salto de liña manualmente antes de cada autor a partires do segundo
      autoria: ("Autor1", "\nAutor2", [···], "\nAutorN")

    - (maís complicado) Ir ao modelo (modelo.typ) e cambiar a función crear_portada() 
*/

#show: estilo_tfg.with(
    titulo             : "Titulo do traballo",
    autoria            : ("Autor1", "Autor2", "Autor3", ),
    titor              : "Titor",
    /*
    En caso de non ter cotitor deixar o campo de «cotitor» cuberto con «""» ou con «none»
    (nunca en branco, xa que non compila)

    Non é necesario cambiar o resto dos campos asociados ó cotitor, xa que estos xa se eliminan
    ao cambiar o campo de «cotitor»
    */
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

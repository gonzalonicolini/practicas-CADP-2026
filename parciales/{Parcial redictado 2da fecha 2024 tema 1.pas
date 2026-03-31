{Parcial redictado 2da fecha 2024 tema 1

se desea realizar un sist para manejar los albunes de figuritas pertenencientes a 10 chicos. De cada chico se conoce: apellido, nombre,
una estructura que simula un album de 638 figuritas que permita marcar si se tiene o no cada figurita, mas los datos de cada figurita, y
otra estructura para almacenar las figus repetidas. De cada figurita (1..648) se conoce: nro de fig, apellido y nombre del jugador, cod
de seleccion (1..32)

a) realizar un modulo que cargue la info de los 10 chicos en una estructura. El album de cada chico arranca vacio (las 648 figus deben 
quedar marcadas como que no las tienen y sin datos de las figuritas) y su estructura de figuritas repetidas arranca vacia.

b) realizar un modulo que reciba una posicion X (1..10) y una estructura que represente un paquete con 5 figuritas. El modulo debe acceder
al chico de la posicion X y simular el pegado de las 5 figus en su album (cuando una figu no está en su album debe actualizar el dato que 
indica que la tiene y guardar la figurita, si ya la tiene debe almacenarla en la estructura de las figuritas repetidas)

c) realizar el modulo que reciba la estructura generada en A y retorne el apellido, nombre del chico con mas figuritas repetidas

d) realizar un modulo que reciba la estructurada generada en A y retorne cual es el codigo de seleccion que tiene menos figus repetidas
entre los 10 chicos.}

program Figuritas;

type

    rChicos = 1..10;
    rFigus = 1..648;
    rSelecciones = 1..32;
 
Figurita = record
    nro_fig: rFigus;        // Nro. de 1 a 648
    apellido_jugador: string[20];
    nombre_jugador: string[20];
    cod_seleccion: rSelecciones; // Cod de 1 a 32
  end;


FiguAlbum = record
    laTiene: boolean;          // si la tiene o no
    dataFigu: Figurita;        // Datos de la figurita, solo relevantes si 'tiene' es TRUE
  end;
  
  vAlbum = array[rFigus] of FiguAlbum;


  PFiguRepetida = ^nodo;
  nodo = record
    dato: Figurita;
    sig: lista;
  end;


  
  Chicos = record
    apellido: string[20];
    nombre: string[20];
    album: vAlbum;
    repetidas: lista;
  end;

  vChicos = array[rChicos] of Chicos;

  
  TPaquete = array[1..5] of Figurita;


{PRIMERA FECHA 2023 T1

    Una empresa de venta de tickets de tren está analizando la
    información de los viajes realizados por sus trenes
    durante el año 2022. Para ello, se dispone de una estructura
    de datos con la información de todos los viajes.
    De cada viaje se conoce el código de tren, el mes en que se realizó
    el viaje (entre 1 y 12), la cantidad de pasajeros que viajaron,
    y el código de la ciudad de destino (entre 1 y 20). La información se
    encuentra ordenada por código de tren.
    Además, la empresa dispone de una estructura de datos con información
    del costo del ticket por ciudad destino.
    
    A. Generar una lista que tenga por cada código del tren, la cantidad de viajes realizados
    B. Informe el mes con mayor monto recaudado
    C. COMPLETO: Informe el promedio de pasajeros por cada tren entre todos sus viajes
}

{comentarios del enunciado: 
*viajes es un record
*necesito 2 listas? se disponen ambas?
*un procedure maximo para el B o quizas funcion por que es solo 1 max
}

program PARCIALT1PF2023;
type
Rmes=1..12;
Rciudad=1..20;


viajes=record
cod:integer;
mes:Rmes;
cantPas:integer;
ciudad:Rciudad;
end;

CodyVia=record // para la lista del inciso A
cod:integer;
cantviaje:integer;
end;

//vectores para recorrer y acumular montos
Vciudad=array [Rciudad] of real;//vector de costos, lo dispone
Vmes=array [Rmes] of real;

Lviaje=^nodov;
Lnueva=^nodonue;

nodov=record
dato:viajes;
sig:Lviaje;
end;

nodonue=record
dato:CodyVia;
sig:Lnueva;
end;


procedure InicializarVmes (var vm: Vmes);//vector contador
var
	i:integer;
begin
	For i:= 1 to 12 do begin
		vm[i]:= 0;
		end;
end;



Procedure CargarVciudad (var vc:Vciudad); //se dispone

Procedure CargarLviajes (var lv:Lviaje);//se dispone



Procedure generarLista (var ln:Lnueva, dato:CodyVia);//el enunciado remarca que esta ordenado, tengo que inicializarlo ordenado?
var
	nue:Lnueva;
begin
	new(nue);
	nue^.dato := dato;
	nue^.sig := ln;
	ln := nue;
end;



Procedure recorrerLista(lv:Lviaje; var ln:Lnueva;var vm:Vmes; vc: Vciudad);
var
	totPas, cantVia, codAct: integer;
	rCodyVia:CodyVia;
	Prom:real;
begin
	while (lv<>nil) do //no se si tengo que trabajar con la lv o ln o ambas
	begin
		totPas:=0;
		cantVia:=0:
		Prom:=0;
		codAct:=lv^.dato.cod;
		while (lv<>nil) and (lv^.dato.cod = codAct) do
		begin
			cantVia:= cantVia +1;
			totPas:= totPas + lv^.dato.cantPas;
			vm[lv^.dato.mes]:= vm[lv^.dato.mes] + vc[lv^.dato.ciudad] * lv^.dato.cantPas // para sacar el mes que mas facturó
			lv:= lv^.sig;
		end;
		Prom:=(totPas / cantVia)
		rCodyVia.cod:=codAct;
		rCodyVia.cantviaje:=cantVia;//rCodyVia registro auxiliar para laburar con los datos de la 2da lista
		generarLista(ln,rCodyVia);//inciso A
		Writeln('el prom de pasajeros entre todos los viajes es ', Prom);
		
	end;
end;

Procedure ProcesarVmeses (vm:meses);//vector contador para el maximo, esto iria ultimo en el orden del pp? - se pasa por ref o x valor? porque?
var
	maxMonto:real;
	maxMeses:Rmes;
	i:integer;
begin
	maxMonto:=-1;
	for i:= 1 to 12 do 
	begin
		if (vm[i]>maxMonto)then
		begin
			maxMonto:= vm[i];
			maxMeses:= i;
		end;
	end;
	writeln('el mes que mas se vendió fue ', maxMeses, 'con el siguiente monto: 'maxMonto);
end;


var
	lv:Lviaje;
	ln:Lnue;
	vm:Vmes;
	vc:Vciudad;
BEGIN
	lv:=nil;
	ln:=nil;
	InicializarVmes(vm);
	CargarVciudad(vc);//se dispone
	CargarLviajes(lv);//se dispone
	RecorrerLista(lv,ln,vm,vc);
	ProcesarVmeses(vm);
END.


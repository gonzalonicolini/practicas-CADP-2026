(* 
 TERCERA FECHA TEMA 1 2024
 
 La Conmebol desea procesar informacion del torneo Copa America entra paises. Para ello,
 se dispone de una estructura de datos con la info de cada pais que ha particiapdo 
 alguna vez del evento. De cada pais se conoce: el nombre, la cant de participaciones
 en Copas America e informacion de cada participacion (a lo sumo 10)De cada participacion
 se conoce el año y en que instacia finalizo (1: fase de gurpos, 2: cuartos de final
 3: semifinal 4: final)

Realizar un programa que:

a) lea la info de un nuevo pais y la incorpore en la estructura de datos que se dispone
Del nuevo paios se lee el nombre del pais, la cant de participaciones (a lo sumo 10) y
la info de cada participacion (año y en que instancia finalizo en dicha participacion)

b)una vez cargado el nuevo pais, procese los datos de todos los pais e informe.
	1- para cada pais, la cantidad de participaciones realizadas en años anteriores al 2020
	en las que superaron la fase de grupos
	
	2- los nombrees de los 2 paises que llegaron menos veces en intancias de final
	
	3- El promedio de participaciones en copa america entre todos los paises.
 * 
 *)


program parcial;

type
	rangoParticipaciones = 1 ..10;
	rangoInstancia = 1.. 4;
	
	pais=record;
		nombre:integer;
		cantPart:rangoParticipaciones;
		vector:vParticipaciones; // no se me hubiera ocurrido hacer esto, como me doy cuenta?
	end;
		
	participaciones = record;
		anio:integer;
		instancia:rangoInstancia;
	end;

	lista = ^nodo
	nodo = record;
		dato:pais;
		sig:lista;
	end;
	
	vParticipaciones = array [rangoParticipaciones] of participaciones;



Procedure cargarLista (var l:lista); //se dispone


Procedure inicialiarVector (var v: vParticipaciones); // no necesito VCONT
var
	i:rangoParticipaciones;
begin
	for i:= 1 to 10 do
		v[i] := 0
end;
	
	
Procedure agregarAdelante (var l:lista, p:pais);
var
		nue:lista;
begin
	new (nue);
	nue^.dato:= p;
	nue^.sig:=l;
	l:=nue;
end;



Procedure leerPais (var p:pais);
var
	i:integer
begin
	readln(p.nombre);
	readln(p.cantPart);
	for i:= 1 to p.cantPart do
		begin
			readln(p.vector[i].anio);
			readln(p.vector[i].instancia);
		end
end;


Procedure cargarPais (var l:lista); // punto A
var
	p:pais;
begin
	leerPais(p);
	agregarAdelante(l,p);
end;


procedure buscarMinimos(v: vParticipaciones; cantParti:integer; var cant2020,min1, min2:integer;var paisMin1, paisMin1:string; pais:string;); 
var
	cantFin,i: integer;
begin
	cantFin:=0
	for i:= 1 to cantParti do 
	begin
		if (v[i].instancia <> 1) and (v[i].anio < 2020) then
			cant2020 = cant2020 + 1;
		if (v[i].instancia=4) then 
			cantFin:= cantNoFin + 1;
	end;
	if (cantFin < min1) then
	begin
		min2:= min1;
		paisMin2:= paisMin1;
		max1:= Cantfin;
		paisMin1:= pais;
	end else
		if(cantFin < min2)then
		begin
			max2:= Cantfin;
			paisMin2:= pais;
		end;
end;




Procedure recorrerLista (l:lista);
var
	totalPaises,contadorParticipaciones,min1, min2,cant2020:integer;
	paismin1,paismin2:string;
	promedio:real;
begin
	min1:= 999;
	min2:= 999;
	totalPaises:=0;
	contadorParticipaciones:=0;
	while (l <> nil) do
	begin
		cant2020:=0;
		buscarMinimos (l^.dato.vector, l^.dato.cantParti,cant2020,min1,min2,paismin1,paismin2,l^.dato.pais);
		writeln ('el pais actual participo de',cant2020,'antes del 2020');
		totalPaises:= totalPaises + 1;
		contadorParticipaciones:=contadorParticipaciones + l^.dato.cantPart;
		L:=L^.sig;
	end;
		promedio:= contadorParticipaciones / totalPaises;
		writeln(paismin1, paismin2);
		writeln(promedio);
end;



PP

VAR
	l:lista

BEGIN
	L:= nil;
	cargarLista(l)
	cargarPais(l)
	recorrerLista(l)
END



















}

(* 
Una revista deportiva dispone de informacion de los jugadores de futbol
participantes de la liga profesional 2022. De cada jugador se conoce
codigo de jugador, apellido y nombre, codigo de equipo(1..28) año de
nacimiento y la calificacion para cada una de las 27 fechas del torneo 
ya finalizado. la calificacion es numerica de 0 a 10 donde 0 significa que 
el jugador no ha participado de la fecha.

Se solicita:
a.Informar para cada equipo la cantidad de jugadores mayores a 35 años
b.Informar los 2 codigos de los jugadores con mejor calificacion promedio
en los partidos en los que participo. Solo deben considerarse los 
jugadores que participaron en mas de 14 fechas
c. Implementar e invocar un modulo que genere una lista con los jugadores
cuyo codigo posee exactamente 3 digitos impares y hayan nacido entre
1983 y 1990.
La lista debe estar ordenada por codigo de jugador.
 *)

Program parcial
type
	rangoEquipo = 1..28;
	rangoFechas = 1..27;
	
	jugador = record
		cod:integer;
		nomApe:string;
		codEquipo:rangoEquipo;
		añoNac:integer;
		calificacion:integer;
		vector:Vcalif;
	end;

	lista = ^nodo;
	nodo = record
		dato: jugador;
		sig: lista;
	end;
	
	vEquipo = [rangoEquipo] of integer;
	vCalif = [rangoFechas] of integer;


procedure inicializarVCont (var ve:vEquipo)
var
	i:rangoEquipo;
begin
	for i:=1 to 28 do
		ve[i]:=0;
end;
 


procedure cargarLista (var l:lista) // se dispone

procedure insertarOrdenado (var l2:lista, j:jugador)
var
	act,ant,nue:lista
begin
	new(nue);
	nue^.dato:=j;
	act:=l2;
	ant:=l2;
	while (act <> nil) and (act^.dato.cod > j.cod) do
	begin
		ant:=act;
		act:=act^.sig;
	end;
	if (ant = act) then
		L2:= nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;


procedure maximos(var PromMax1,PromMax2:real; var codMax1,codMax2:integer; codigo:integer; vc:Vcalificaciones;)
var
	i:rangoFechas;
	promedio:real;
	sumaCalificaciones,cantTotCalificaciones:integer;
begin
	cantTotCalificaciones:=0
	sumaCalificaciones:=0
	for i:= 1 to 27 do 
	begin
		if (vc[i]<> 0) then
		begin
			cantTotCalificaciones:=cantTotCalificaciones+1;
			sumaCalificaciones:=sumaCalificaciones + vc[i];
		end;
	end;
	if(cantTotCalificaciones>14)then
	begin
		promedio:= sumaCalificaciones / cantTotCalificaciones;
		if(promedio> PromMax1) then
			begin
				PromMax2:=PromMax1;
				PromMax1:=vc[i].j.calificacion
				codMax2:=codMax1;
				codMax1:=codigo
			end;
		else
				if (promedio > PromMax2) then
				begin
					calMax1:=vc[i].j.calificacion
					codMax1:=codigo;
				end;	
end;


function Descomponer (cod:integer):boolean
var
	dig, cant:integer;
begin
	cant:=0;
	while (cod <> 0 ) and (cant <= 3)do
	begin
		dig:=cod mod 10;
		if(dig mod 2 = 1) then
			cant:=cant+1;
		cod := cod div 10;
	end;
	Decomponer:=(cant=3);
end.




procedure recorrerLista (var l2:lista; l:lista; ve:vequipo)
var
	PromMax1,PromMax2:real
	edad,codMax1,codMax2:integer
	i:rangoFecha;

begin
	PromMax1:=-999;
	PromMax2:=-999;

	while (L<>nil) do
	begin
		edad:= 2025 - L^.dato.añoNac 
		if(edad > 35) then
				ve[L^.dato.equipo]:=ve[L^.dato.equipo] + 1;
		Maximo(PromMax1,PromMax2,codMax1,codMax2, L^.dato.cod,L^.dato.vector)	
		if (Descomponer(L^.dato.cod)) and (L^.dato.añoNac>=1983) and (L^.dato.añoNac<=1990) then
			insertarOrdenado(L2,L^.dato)
	
			
		
		L:= L^.sig
	end
	for i := 1 to 28 do
		writeln(ve[i]);
	writeln(PromMax1,PromMax2)
end;









PP
var
	ve:vEquipo;
	l,l2:lista
begin
	L:=nil
	L2:=nil
	inicializarVCont(ve)
	cargarlista(l)//se dispone
	recorrerLista(l2,l,ve)
end.








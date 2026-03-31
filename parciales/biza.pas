(* 
 * CADP 2023 SEG FECHA T1
 * el prod bizarrap organiza sesione con dif artistas. Implementar un programa que lea
 * y almacene info de dichas sesiones. De c/ sesion se lee: titulo, nombre del artista,
 * genero musical (1 trap 2 reggaeton 3urban 4 electronica 5 poprap)y la cant de visualizaciones 
 * La lectura finaliza cuando se lee la sesion con nombre Peso Pluma que debe procesarse. La info
 * debe quedar almacenada en una estructura de datos ordenada por titulo de sesion de forma ascendente.
 * 
 * Una vez leida y almacenada la info, se pide:
 * A)informar los 2 codigos de genero musical con mayor cantidad de vistas
 * B)informar la cant de sesiones del gen reggaeton cuya cant de visua contiene la misma cant de dig pares 
 * que impares
 * C)Realizar un mod que reciba un titulo de sesion y elimine dicha sesion de la estructura. El titulo puede no existir
 * Invocar el mod desarrollado en el PP con un titulo leido por teclado.
 * 
 *)

program Biza;
Type
	rangoCat = 1 .. 5;
	sesion= record
		titulo: string;
		nombre: string;
		genero: rangoCat;
		cantvistas: integer;
	end;
	
lista= ^nodo;
nodo= record
	dato: sesion;
	sig: lista;
end;
vCont= Array[rangoCat] of integer;

procedure leerSesion(var s: sesion);
begin
	readln(s.titulo);
	readln(s.nombre);
	readln(s.genero);
	readln(s.cantvistas);
end;

procedure insertarOrdenado(var L: lista; s:sesion);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.dato:= s;
	ant:= L;
	act:= L;
	while(act <> nil)AND(act^.dato.titulo < s.titulo)do 
		begin
				ant:=act;
				act:= act^.sig;
		end;
	if (act = ant) then
		ln := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;

procedure cargarLista(var L: lista);
var
	s:sesion;
begin
	repeat
		leerSesion(s);
		insertarOrdenado(L, s);
	until(s.titulo = 'Peso Pluma');
end;


procedure inicializar(var v: vCont);
var
	i: integer;
begin
	for i:= 1 to dimF do
		v[i]:= 0
end;


function descomponer(cantvistas: integer): boolean; //cant dig pares = cant dig impar
var
	dig, pares, impares: integer;
begin
	pares:= 0;
	impares:= 0;
	while(cantvistas <> 0)do 
	begin
		dig:= cantvistas MOD 10;
		if(dig MOD 2 = 0)then
			pares:= pares +1
		else
			impares:= impares +1;
		cantvistas:= cantvistas DIV 10;
	end;
	descomponer:= (pares = impares);
end;

procedure buscarMaximos(v: vCont); //es necesario inicializar la posmax en 0? 
var
	i,max1, max2, posMax1, posMax2: integer;	
begin
	max1:= -1;
	max2:= -1;
	for i:= 1 to 5 do 
	begin
		if(v[i] > max1)then 
		begin
			max2:= max1;
			posMax2:= posMax1;
			max1:= v[i];
			posMax1:= i;
		end else
			if(v[i] > max2)then
			begin
				max2:= v[i];
				posMax2:= i;
			end;
	end;
	writeln(posMax1;posMax2);
end;



procedure recorrerLista(L: lista; var v: vCont);
var
	pos:integer;
	cantRegg: integer;
begin
	cantRegg:= 0;
	inicializar(v);
	
	while(L <> nil)do begin
		pos:=L^.dato.genero
		v[pos]:= v[pos] + L^.dato.visualizacion; // al igual que el parcial de trenes, pedir explicacion de como verlo en el enunciado a Eze
		if(L^.dato.genero = 2)and(descomponer(L^.dato.visualizacion))then
				cantRegg:= cantRegg +1;
		L:= L^.sig;
	end;
	writeln('Cantidad de sesiones de regeton que cumplen: ',cantRegg);
end;


procedure eliminar(var L: lista; unTitulo: string);
var
	ant, act: lista;
begin
	ant:= L;
	act:= L;
	while(act <> nil)AND(act^.dato.titulo <> unTitulo)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act<>nil) then
	begin
		if (act = ant) then
			L:=L^.sig;
		else
			ant^.sig:= act^.sig;
	dispose(act);	
	end;
end;



var
	L: lista;
	V: vectorVisualizacion;
	titulo: string;
begin
	L:= nil;
	cargarLista(L);
	recorrerLista(L,V);
	buscarMaximos(V);	
	readln(titulo);
	eliminar(L, titulo);
end.

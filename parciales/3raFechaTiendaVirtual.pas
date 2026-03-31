(* 
CADP 2023 - PARCIAL 3RA FECHA TEMA 1 13/12
una tienda virtual necesita un programa para administrar la info de sus clientes
de cada cliente se lee: numero, dni, apellido y nombre, fecha de nacimiento (dia mes año)
nivel (1 a 5) y puntaje. Le lectura finaliza cuando se lee el cliente con DNI 33444555 que debe procesarse

se pide

a. generar una estructura que contenga numero, ape y nom de aquellos clientes con dni
compuesto solamente por dig impares

b. informar los niveles con mayor y menor puntaje acumulado por los clientes nacidos antes del 2000

c. implementar un modulo que elimine, de la estructura generada, la info relacionada a un numero 
de cliente recibido por parametro. Tener en cuenta que dicho nro puede no existir


 *)


program parcial;
type
	rangoNivel = 1..5;
	
	clientes = record
		numero:integer;
		dni:integer;
		nomApe:string;
		fechadeNac:fecha;
		nivel:rangoNivel;
		puntaje:integer;
	end;
	
	vNivel = array [rangoNivel] of integer;
	
	fecha= record
		dia:integer;
		mes:integer;
		año:integer;
	end;
	
	impar = record
		numero:integer;
		nomApe:string;
		dni:integer;
	end;
	
	lista = ^nodo;
	nodo = record;
		dato:impar;
		sig:lista;
	end;
	

Procedure leerClientes (var c:clientes)
begin
	
	readln(c.numero);
	readln(c.dni);
	readln(c.nomApe);
	readln(c.fechadeNac.año);
	readln(c.fechadeNac.dia);
	readln(c.fechadeNac.mes);
	readln(c.nivel);
	readln(c.puntaje);
	
end;
	
	
	
Procedure agregarAdelante(var l:lista;i:impar);
var
		nue:lista;
begin
	new(nue);
	nue^.dato:=i;
	nue^.sig:=L;
	L:=nue;
end;

Procedure cargarLista (var l:lista; vc:Vnivel);
var
	c:cliente
	i:impar
begin
			repeat
			leerCliente(c)
			if (c.fechadeNac.año<2000)then
					vc[c.nivel]:= vc[c.nivel]+ c.puntaje;
			if (descomponer(c.dni))then
			begin
					i.numero:=c.numero;
					i.dni:=c.dni;
					i.nomApe:=c.nomApe;
					agregarAdelante(l,i);
			end
			until (c.dni = 33444555)
			MaxMin(vc);
end;


procedure eliminar (var l: lista;numero:integer)
var
	act, ant: lista
begin
	act:l;
	ant:l;
	
	while (act<>nil) and (act^.dato.numero <> numero) do
	begin
		ant:=act;
		act:=act^.sig;
	end;
	
	if (act<>nil) then
	begin
		if (act=ant) then
			L:=L^.sig;
		else
			ant^.sig = act^.sig;
		dispose(act);
	end;
end;




Procedure inicializarVCont (var vc:vNivel);
var
	i:rangoNivel;
begin
	for i: 1 to 5 do
		vc[i]:=0;
end;



function descomponer (dni:integer): boolean;
var
	dig:integer;
	Par:integer
begin
		par:=0
		while (dni <> 0) and (par=0)do
		begin
			dig:= dni mod 10
			if (dig mod 2 = 1) then
					dni:= div 10;
				else
					par:=par +1
			end

			descomponer:=(par=0);
end;


procedure MaxMin (vc:Vnivel);
var
	nivelMin, nivelMax,i:rangoNivel;
	maxP,minP:integer
	 
begin
	maxP:=-99
	minP:=99
	for i:= 1 to 5 do
	begin
		if(maxP < vc[i]) then
		begin
			maxP:=vc[i];
			nivelMax:=i;
		end
		
		if(minP>vc[i]) then
		begin
			minP:=vc[i];
			nivelMin:=i
		end;
	end
	writeln(minP,maxP);
end



VAR
	vc:vNivel
	
BEGIN
	inicializarVCont(vc)
	
END.


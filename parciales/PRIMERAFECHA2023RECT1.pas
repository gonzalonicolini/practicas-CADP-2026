{ 
REDICTADO CADP 2023 PARCIAL 1RA FECHA * 

Una jugueteria necesita un programa para administrar la infor. de los prod.
que comercializa. De cada prod. se lee: codigo, descripcion, categoria
(1: primera infancia, 2: didacticos, 3: de mesa, 4: otros), marca y precio

La lectura finaliza cuando se lee el cod -1 que no debe procesarse. La info
se lee ordenada por marca. Se pide

A) generar una estructura que contenga, para cada marca, la cant de prod.comercializados

B) Informar las 2 categ con menor cantidad de prod comercializados

C) Informar el precio promedio de los productos con cod multiplo de 3

}

{comentarios enunciado:
*producto record
*condicion de corte -1 que no debe proc (while)
vector contador para el B
*2 listas? 
}

program Parcial_2023;
type
	Rcat: 1..4;

	producto = record
		cod:integer;
		desc:string;
		cat:Rcat;
		marca:string;
		precio:real;
	end;

	prodLista = record //para la lista del inciso a
		marca:string;
		cantProd:integer;
	end;


	lista:=^nodo;
	nodo=record
		dato:prodLista;
		sig:lista;
	end;


vCont=array [Rcat] of integer;

Procedure LeerProducto (var p:producto);//condicion de corte -1 -- se usa if xq es siempre para leer solo un producto
begin
	writeln('Ingrese el codigo del producto');
	readln(p.cod);
	if(p.cod <> -1) then  
	begin
		writeln('Ingrese descripcion del producto');
		readln(p.desc);
		writeln('Ingrese categoria del producto');
		readln(p.cat);
		writeln('Ingrese marca del producto');
		readln(p.marca);
		writeln('Ingrese precio del producto');
		readln(p.precio);
	end;
end;

Procedure inicializarVector (var v:vCont)
var
	i:integer;
begin
	for i:= 1 to 4 do
		v[i]:=0;
end;



Procedure insertarOrdenado (var L:lista; p:prodLista);// creo que no es necesario
var
	nue, act, ant:lista
begin
	new(nue);
	nue^.dato:= p;
	act:=L;
	ant:=L;
	while (L<> nil) and (act^.dato.marca >p.marca)do
		begin
		ant:=act;
		act:=act^.sig;
		end;
	if (act = ant) then
		L:=nue;
	else
		ant^.sig := nue;
	nue^.sig:=act;
end;




Procedure agregarAdelante (var L:lista; p:prodLista);// el enunciado dice "se lee ordenado" en ningun momento pide INSERTAR ordenado
var
	nue:lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:=L;
	L:=nue;
end;

Procedure leerInformacion (var L:lista, var v:Vcont);
var
	p:producto;
	aux:prodLista;
	marcaAux:string;
	cantTotal, contAux:integer;
	totalPrecios:real;
	prom:real;
begin
	cantTotal:=0;
	leerProducto(p);
	while(p.cod <> -1) do begin //condicion de corte
		marcaAux:= p.marca;
		contAux:=0;
		while(p.cod <> -1) and (marcaAux = p.marca)do begin
			contAux:= contAux +1;
			v[p.cat]:=v[p.cat]+1;
			cantTotal:=cantTotal +1;
			if (p.cod MOD 3 = 0) then //hago el multiplo de 3
				totalPrecios:= totalPrecios + p.precio
			LeerProducto (p);	
		end;
		aux.marca:=MarcaAux;//al aux de tipo lista le asigno la marca

		aux.cont:=contAux;//al aux de tipo lista le asigno la cant de prod comercializados

		agregarAdelante(L,aux); // inciso A
	end;

	prom:= (totalPrecios / cantTotal)*100;
	writeln('El promedio de productos con cod multiplo de 3 es ',prom:0:2);	// inciso C

end;


Procedure buscarMin (v:vCont);
var
	i,min2,min1,posMin1,posMin2:integer;
begin
	min1:= 9999;
	min2:= 9999;
	for i:= 1 to 4 do begin
		if(v[i] < min1)then begin
			min2:= min;
			posMin2:= posMin;
			min1:= v[i];
			posMin1:= i;
		end else
			if(v[i] < min2)then begin
				min2:= v[i];
				posMin2:= i;
			end;
	end;
	writeln('La categoria con menor cantidad es la ',posMin1);
	writeln('La segunda con menor cantidad es la ',posMin2);
end;



var
	v:vCont;
	l:lista;
BEGIN
	l:=nil;
	inicializazVector(v);
	leerInformacion(l,v);
	buscarMin(v); //incisoB
	
END.

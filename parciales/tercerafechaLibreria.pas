(* 
 LA FUENTE CLASE DE APOYO 16HS MIERCOLES
 
 Una libreria dispone de info de los lbiros vendidos durante el año 2023
 de cada libre se conoce cod de libre, titulo, autor, codigo de genero (1 a 20)
 año de publicacion y la calificaion obtenida en cada uno de los 12 meses del año.
 La calificion es numerica de 0 a 10, donde el valor 0 significa que el libro no ha sido vendido este mes
 
 
 a) informar para cada genero la cant de libros publicados antes del 2000
 
 b) informar los titulos de los 2 libros con mejor calificacion promedio en los meses en los que se vendieron.
 solo deben considerarse los libros que se vendieron en mas de 6 meses
 
 c) implementar e invocar un modulo que genere una lista con los libros cuyo codigo posee exactamente 4 digitos pares
 y haya sido publicado entre 1995 y 2005. La lista tiene que estar ordenada x autor
 
 d) ingresar un cod de libro y buscar su titulo en la lsita generada en el inciso c
 *)


program tercerafechaLibreria;
type
	rangoGen= 1..20;
	rangoCal = 0.. 10;
	meses = 1..12;
	

	vectorCalificacion = array[meses] of integer;
	libro = record
		codLib:integer;
		titulo:string;
		autor:string;
		codGen:rangoGen;
		anio:integer;
		calificacion:vectorCalificacion;
	end;

	Vcont = array [rangoGen] of integer;

	lista = ^nodo;
	nodo = record
		dato:libro;
		sig:lista;
	end;


Procedure inicializarVector (var vc: Vcont);
var
	i:rangoGen;
begin
	for i := 1 to 20 do 
		vc[i]:=0;
end;

Procedure CargarLista (var L:lista) // se dispone


Procedure Maximos (v:vectorCalificacion; var max1,max2: real; var titulo1,titulo2: String; titulo: String); // el maximo se saca del vector o de la lista que se dispone?
var
	sumaPuntaje,cantMeses: integer;
	promedio: real;
begin
	sumaPuntaje:= 0;
	cantMeses:= 0;
	for i := 1 to 12 do 
		if (v[x] <> 0) then
			begin
				sumaPuntaje:= sumaPuntaje + v[x];
				cantMeses:= cantMeses + 1;
			end;
	
	if (cantMeses > 6) then
		begin
			promedio:= sumaPuntaje / cantMeses;

			if(promedio>max1) then 
			begin
				max2:=max1;
				titulo2:=titulo1;
				max1:=promedio;
				titulo1:=titulo;
			
			end
			else
				if(promedio>max2) then
				begin
					max2:=promedio;
					titulo2:= titulo;
				end;
		end;
end;

Procedure InsertarOrdenado (var L2:lista; li: libros);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.dato:=li;
	act:=L2;
	ant:=L2;
	while (act <>nil) and (act^.dato.autor > li.autor) do
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


function cumple(num:integer):boolean; // alguna forma mas simple de hacerlo? 
var
	digito:integer;
	ok:boolean;
	par:integer;
begin
	par:= 0;
	ok:= false;
	while (num <> 0) AND (par <= 4) do begin
		dig:= num MOD 10;
		if(dig MOD 2 = 0) then
			par:= par + 1;
		num:= num DIV 10;
	end;
	if(par = 4) then
		ok:= true;
	cumple:= ok;
end;


procedure busqueda(l2:lista);
var
	cod:integer;
begin
	read(cod);
	while (l2 <> nil) and (l2^.dato.codLib <> cod) do
		L2:= L2^.sig;

	if (l2 <> nil) then
		write('libro encontrado, es el titulo: ',l2^.dato.titulo);
end;


Procedure recorrerLista(L:lista; var L2: lista; var Vc:Vcont)
var
	x: integer;
	max1,max2: real;
	titulo1,titulo2: String;
begin
	inicializarVector (vc);
	max1:= 0;
	max2:= 0;
	while(l <> nil) do 
	begin
		{inciso A}
		if(l^.dato.anio < 2000) then
			vc[l^.dato.codGen] := vc[l^.dato.codGen] + 1;

		maximo(L^.dato.calificacion,max1,max2,titulo1,titulo2,L^.dato.titulo);
			
		if(cumple(l^.dato.codLib = 4) AND (l^.dato.anio > 1995) AND (l^.dato.anio < 2005) )then
			insertarOrdenado(l2,l^.dato);
		l:= l^.sig;
	end;

	{inciso A}
	for x:=1 to 20 do
		writeln(vc[x]);

	{inciso B}
	writeln(titulo1,titulo2);
end;


VAR
	L, L2: lista;
	vc:Vcont;
BEGIN
	L:=nil;
	L2:=nil;
	generarLista(l); // SE DISPONE
	recorrerLista(l,l2,vc);
	busqueda(l2);
	
END.


(* 
 * CADP 2024
 * 
 Un super esta procesando las compras que realizaron sus clientes. Para ello, dispone de una estructura de datos 
 con todas las compras, sin ningun orden en particular. De c/ compra se conoce: codigo, mes, año (2014 y 2024), monto y dni
 Un cliente puede haber realizado más de una compra. 
 
 A) Almacene en otra estructura de datos las compras realizada en el año leido. Esta estructura debe quedar ordenada x dni cliente.
 
 B)Una vez almacenada la info, procese los datos del inciso A e informe:
		1)Para c/ cliente, el monto total facturado entre todas sus compras
		2) Los 2 meses con menor facturacion
		3) La cant de compras con Codigo multiplo de 10
 *)


program Supermercado;
type
	rangoMes = 1..12;
	rangoAnio = 2014..2024;

	compra = record;
		codigo:integer;
		mes:rangoMes;
		anio:rangoAnio;
		monto: real;
		dni: integer;
	end;

	lista = ^nodo;
	nodo = record;
		dato:compra;
		sig:lista;
	end;


	Vmes = Array [rangoMes] of real;

Procedure CargarLista (var l:lista); //se dispone



Procedure InsertarOrdenado (var L2:lista; c:compra);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.dato:=c;
	act:=L2;
	ant:=L2;
	while (act <>nil) and (act^.dato.dni>C.dni) do
	begin
		ant:=act;
		act:=act^.sig;
	end;
	if (ant = act) then
		L:= nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;

Procedure CargarLOrdenada (var L2:lista; L:lista);
var
	anio:integer;
begin
	Readln (anio);
	While (L <> nil) do 
	begin
	if (L^.dato.anio = anio) then 
		InsertarOrdenado (L2, L^.dato);
	L:=L^.sig;
	end;
end;


Procedure InicializarV(var v:Vmes);
var 
	i: integer;
begin
	for i := 1 to 12 do
		v[i] = 0
end



Procedure RecorrerLista2(L2:lista; var v:Vmes);
var
		compras,dni:integer;
		monto:real;
begin
	compras:=0
	while (L2 <> nil) do
		begin
		monto:=0
		dni:=L2.dato.dni
		while (L2 <> nil) and (L2.dato.dni = dni)do
			begin
				monto := monto + l2^.dato.monto;
				if (L2^.dato.codigo MOD 10 = 0) then
					compras:=compras + 1;
				V[L2^.dato.mes]:=V[L2^.dato.mes] + L2.dato.monto;
				L2:=L2^.sig;
			end;
			Writeln (monto,dni);
		end;
		Minimos(v);
		writeln(compras);
end;




Procedure Minimos (v:Mes)
var
	i,min1,min2,posmin1,posmin2:integer;
begin
	min1:=99999
	min2:=99999
	for i:= 1 to 12 do 
	begin
		if(v[i]<min1)then
			begin
				min2:=min1;
				posmin2:=posmin1;
				min1:=v[i];
				posmin1:=i;
			end
			else
				if (v[i]<min2) then
					begin
						min2:=v[i];
						posmin2:=i
					end;
		end;
		write (posmin1,posmin2);
end;


VAR
v:Vmes
L:lista
L2:lista
BEGIN
L:=nil
L2:=nil
InicializarV(v);
CargarLista(L)
CargarLOrdenada(L2,L)
RecorrerLista2 (L2,V)
END.


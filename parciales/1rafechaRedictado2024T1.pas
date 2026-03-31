(* 
		Una fabrica de automov. necesita un prog. para administrar las piezas de los dif modelos de automoviles que fabrica. De cada pieza se conoce: cod. de pieza, descripcion
		cant.stock, costo de la pieza, codigo del modelo al que pertenece (1--10), stock minimo. La lectura finaliza al leer el cod de pieza 9999 el cual debe procesarse
		
		A) Leer y almacenar la info de las piezas en una estructura de datos adecuada. La info debe quedar almacenada en el mismo orden que fue leida
		
		B) A partir de la estructura generada en A, calcular e informar:
		
		1) los 2 codigos de modelo de automoviles mas baratos de fabricar
		
		2) el prom de piezas con codigo de modelo 3 y cuyo codigo de pieza comieza en 9
		
		3)cual es el cod de pieza en que la fabrica debera gastar mas dinero para que su stock actual supere en una unidad a su stock minimo
		
		
 *)


program parcial_Redictado_2024_1raFecT1;
type
  codMod= 1..10;
  
  piezas=record;
		codPieza:integer
		descripcion:string
		cantStock:integer
		costoPieza:real
		codModelo:codMod
		stockMin:integer
		end;
		
		vCont = array [codMod]of real;
		
		lista = ^nodo
		nodo = record
			dato:piezas
			sig:lista
		end;
		


Procedure AgregarAtras (var L,ult:lista, p:piezas)
var
		nue:lista;
begin
	new(nue)
	nue^.dato:=p
	nue^.sig:=nil
	if(l=nil)then
		L:=nue
	else 
		ult^.sig:=nue
	ult:=nue
end;

Procedure Leer (var p:piezas)
begin
	readln(p.codPieza)
	readln(p.descripcion)
	readln(p.cantStock)
	readln(p.codModelo)
	readln(p.StockMin)
	end;
	

Procedure InicializarCont (var vc:Vcont)
var
i:integer
begin
for i:= 1 to 10 do 
	vc[i]:=0
end;

Procedure CargarLista(var ult,L:lista)
var
p:piezas
begin
	repeat
	leer(p)
	AgregarAtras(ult,l,p)
	until p.codPieza = 9999
end;

Procedure Minimos (vc: Vcont)
var
	codMin1,codMin2,i:integer
	min1,min2:real
begin
	min1:=9999
	min2:=9999
	codmin1:=0
	codmin2:=0
	for 1 := 1 to 10 do begin
		if (vd[i]< min1)then
		begin
		min2:=min1;
		codmin2:=codmin1
		min1:=vd[i]
		codmin1:=i
		end
		else
			if (vd[i]< min2)then
			begin
			min2:=vd[i]
			codmin2:=i
			end;
		end;
		writeln('los cod mas baratos son',codmin1;codmin2)
end;


function descomponer (codPieza:integer): boolean
begin
while (codPieza > 9 ) do
begin
	codPieza:= codPieza div 10
end;
descomponer := (codpieza = 9)
end.



procedure recorrerLista (L:lista, vc:vcont)
var
cantReponer,codpiezaMax:integer;
Preciototal,Preciomax1:real;
promedio:real
CantPiezas9:integer
piezastotales:integer

begin
piezastotales:=0
CantPiezas9:=0
Preciomax1:=0
while (l <> nil) do
	begin
	piezastotales:=piezastotales+1
	 vc[l^dato.codModelo]:= vc[l^dato.codModelo] + L^.dato.costoPieza // B1 empiezo a llenar cada posicion del vector (modelos) con el precio correspondiente a cada uno
	 cantReponer := (L^.dato.Stockminimo -  L^.dato.StockActual) + 1 // como se nesecita supere en una unidad se le asigna esto. 
	if (cantReponer>0) then// si es mayor que 0 ya se que tengo que reponer producots, asique es un dato valido
			begin
				Preciototal:=cantReponer * L^.dato.costoPieza
				if (Preciomax1<Preciototal) then
				begin
						PrecioMax1:= Preciototal
						codpiezaMax:=L^.dato.codPieza
				end; // finalizacion del calculo del inciso 	
			end;
	
	if (descomponer (L^.dato.codPieza)) and (l^dato.codModelo = 3) then
	begin
			CantPiezas9 := CantPiezas9 + 1
	end;
	
	L:=L^.sig
	
	end
		Minimos (vc)
		promedio :=  (piezastotales / CantPiezas9) 
		
		writeln (promedio)// b2
		writeln (codPiezaMax)//b3


end;


VAR
vc:vcont
l:lista
BEGIN
	L:=nil
	InicializarCont(vc)
	CargarLista(l)
	recorrerLista(l,vc)
	
END.

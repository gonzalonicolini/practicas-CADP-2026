{Parcial redictado fecha 1 2023 (corroborar esto)

Una fabrica de autos necesita un programa para administrar las 90000 piezas de los dif modelos de autos que fabrica. De cada pieza se conoce, codigo de pieza
descripcion, cant de stock, costo de la pieza, cod de modelo al que pertenece (1 al 10), stock minimo y su peso en kg.

a) leer y almacenar la informacion de las piezas en una estructura de datos adecuada. La info debe quedar almacenada en el mismo orden que fue leida.

b) a partir de la estructura generada en A, se requiere: 

1) realizar una lista de las piezas cuyo stock actual sea igual al stock minimo

2) calcular el promedio de piezas que pesan mas de 1 kg y su codigo de posee al menos 3 dig multriplos de 2

3) utilizando la lista generada en B)1) Calcular e informar 2 codigos de piezas mas costosas cuyo codigo de modelo sea menor que 5}

program parcial_redictado

rModelo = 1 .. 10;
rRangoPiezas = 1.. 90000;


piezas = record
codPieza:integer
descripcion:string
cantStock:integer
codModelo: rModelo
stockMinimo: integer
peso:real
end;

Vpiezas = array [rRangoPiezas] of piezas 

lista=^nodo
nodo = record
dato: pieza
sig: lista
end;

vModelo = array [rModelo] of real

Procedure Leer (var p:piezas)
begin
writeln (p.codPieza)
writeln (p.descripcion)
writeln (p.cantStock)
writeln (p.codModelo)
writeln (p.stockMinimo)
writeln (p.peso)
end;


Procedure cargarVpieza (var vp:vPieza)
var
    i:integer;
    p:piezas
begin
    for i := 1 to 90000 do
    begin
    leer (p);
    vp[i]:= p 
    end;
end;

procedure agregarAdelante (var L:lista, p:piezas)
var
    nue:lista
begin
    new (nue)
    nue^.dato:=p
    nue^.sig:=l
    l:=nue
end;

procedure RecorrerVector (var L:lista, vp:Vpiezas)
var

i:integer
totalpiezasCondicion:integer
begin


totalpiezasCondicion:=0
for i := 1 to 9000 do begin

if (vp[i].StockActual = vp[i].Stockminimo) then
    agregarAdelante (L,vp[i])

if (vp[i].peso > 1) and (cumple(vp[i].codPieza)) then
totalpiezasCondicion:=  totalpiezasCondicion + 1



end;

writeln (totalpiezasCondicion/90000) //punto b2


function cumple (codpieza:integer): boolean
var
i:integer;
dig:integer
cant: integer

begin 
cant:= 0
while (codpieza <> 0) and (cant < 3) do begin
dig := codpieza mod 10
if (dig mod 2 = 0) then 
    cant:cant +1 
codpieza:= codpieza div 10
   
end;

cumple := (cant = 3)
end;

procedure recorrerLista (L:lista)
var
max1,max2, codMax1, codMax2:real


begin

max1:=0
max2:=0
codMax:=0
codmax2:=0
while (L <> nil) do begin
if (L^.dato.codModelo < 5) then 
    if (max1< L^.dato.precio) then begin
        max2:=max1
        codmax2:=codmax1
        Max1:=L^.dato.precio
        codmax1:=L^.dato.cod
    end
    else
        if (max2< L^.dato.precio) then begin
            Max2:=L^.dato.precio
            codmax2:=L^.dato.cod
        end;

L:=L^.sig
end; 

writeln(codmax1, codmax2)
end;

PP

VAR
L:lista
vp:Vpiezas

BEGIN
l:=nil
cargarVpieza (vp)
RecorrerVector(l,vp)
recorrerLista(l)




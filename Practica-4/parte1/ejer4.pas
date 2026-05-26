program ejer4;
const
    dimF = 100;
type
    vector = array[1..dimF] of integer;

function posicion(v:vector; x: integer): integer; //inciso A
var
    i: integer;
begin  
    i := 1;
    while (i <= dimF) and (v[i] <> x) do
        i := i + 1;
    if (i <= dimF) then
        posicion := i 
    else
        posicion := -1;
end;

procedure intercambio(var v:vector; x, y: integer); //inciso B
var
    num: integer;
begin
    num := v[x];
    v[x] := v[y];
    v[y] := num;
end;

function sumaVector(v:vector): integer; //inciso C
var
    i: integer;
begin
    suma := 0;
    for i := 1 to dimF do
        suma := suma + v[i];
    sumaVector := suma;
end;

function promedio(v:vector): real; //inciso D
begin
  promedio:=sumaVector(v)/dimF;
end;


function elementoMaximo(v:vector): integer; //inciso E
var
    i, max: integer;
begin
    max := 0;
    for i := 1 to dimF do
    begin
        if (v[i] > max) then
        begin
            max := v[i];
            elementoMaximo := i;
        end;
    end;
end;


function elementoMinimo(v:vector): integer; //inciso F
var
    i, min: integer;
begin
    min := 99999;
    for i := 1 to dimF do    
    begin
        if (v[i] < min) then
        begin
            min := v[i];
            elementoMinimo := i;
        end;
    end;
end;


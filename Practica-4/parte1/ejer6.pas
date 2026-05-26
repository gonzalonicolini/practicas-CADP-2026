program ejer6;

const
    dimF = 100;
type
    vector = array[1..dimF] of integer;

function posicion(v:vector;x: integer): integer;
var
    i: integer;
begin
    i:= 1;
    while (i <= dimF) and (v[i] <> x) do
        i:= i + 1;
    if (i <= dimF) then
        posicion:= i
    else
        posicion:= -1;
end;


procedure intercambio(var v:vector; x,y: integer);
var
    num:integer;
begin
    num:= v[x];
    v[x]:= v[y];
    v[y]:= num;
end;


procedure maxmin (v: vector; dimL: integer; var maximo, minimo: integer);
var
    x, max, min: integer;
begin
    max:=0;
    min:=9999;

    for x:= 1 to dimL do
    begin
        if (max<v[x]) then
        begin
            max:= v[x];
            maximo:= x;
        end;
        if (min>v[x]) then
        begin
            min:= v[x];
            minimo:= x;
        end;
    end;
end;

procedure cargarVector(var v:vector; var dimL: integer);
var
    num: integer;
begin
    writeln('Ingrese un numero: ');
    readln(num);

    while (diml < dimF) and (num <> 0) do
    begin
        dimL:= dimL + 1;
        v[dimL]:= num;

        writeln('Ingrese un numero: ');
        readln(num);
    end;
end;

//PP

var
    v: vector;
    dimL, max, min: integer;
begin
    dimL:= 0;
    cargarVector(v, dimL);
    maxmin(v, dimL, max, min);
    intercambio(v, max, min);
    writeln('El numero maximo es: ', max, ' y se encuentra en la posicion: ', posicion(v, max));
    writeln('El numero minimo es: ', min, ' y se encuentra en la posicion: ', posicion(v, min));
end.
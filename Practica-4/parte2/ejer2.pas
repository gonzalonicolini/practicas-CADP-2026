program ejer2;
const
    dimf = 500;
type
    vector = array [1..dimf] of string;

//punto A

procedure cargarVector(var v:vector; var diml:integer);
var
    nombre: string;
begin
    writeln('Ingrese un nombre (zzz para terminar): ');
    readln(nombre);
    while (nombre <> 'zzz') and (diml < dimf) do
    begin
        diml := diml + 1;
        v[diml] := nombre;
        writeln('Ingrese un nombre (zzz para terminar): ');
        readln(nombre);
    end;
end;

// punto B
procedure eliminarVector(var v:vector; var diml:integer; nombre:string);
var
    i: integer;
    pos: integer;
begin
    pos :=1; //me paro en el primer elemento del vector del 1 al 500
    while (pos <= diml) and (v[pos] <> nombre) do
        pos := pos + 1;
    
    if (pos <= diml) then 
    begin
        if (pos < diml) then
        begin
            for i := pos to diml do
                v[i] := v[i + 1];
        end;
        diml := diml - 1;
    end;
end;

// punto C
procedure insertar (var v:vector; var diml:integer; nombre:string);
begin
    if (diml <=4) then
        v[4] := nombre;
end;

//punto D
procedure agregar (var v:vector; var diml:integer; nombre:string);
begin
    if (diml < dimf) then
    begin
        diml := diml + 1;
        v[diml] := nombre;
    end;
end;

//programa principal
var
    v: vector;
    diml: integer;
    nombre: string;
begin
    diml := 0;
    cargarVector(v, diml);
    writeln('Ingrese un nombre a eliminar: ');
    readln(nombre);
    eliminarVector(v, diml, nombre);
    writeln('Ingrese un nombre a insertar en la posicion 4: ');
    readln(nombre);
    insertar(v, diml, nombre);
    writeln('Ingrese un nombre a agregar al final del vector: ');
    readln(nombre);
    agregar(v, diml, nombre);
    
end.

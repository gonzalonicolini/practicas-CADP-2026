program ejer3;
const
    dimf=200;
type
    Rviaje = record
        dia: integer;
        monto: real;
        distancia: real;
    end;
    vector=array [1..dimf] of Rviaje;
    vcontador=array [1..31] of integer;

procedure leerViaje(var r: Rviaje);
begin
    writeln('Ingrese la distancia del viaje: ');
    readln(r.distancia);
    if (r.distancia <> 0) then
    begin
        writeln('Ingrese el dia del viaje: ');
        readln(r.dia);
        writeln('Ingrese el monto del viaje: ');
        readln(r.monto);
    end;
end;


//punto A

procedure cargarVector(var v: vector; var diml: integer);
var
    r: Rviaje;
begin
    leerViaje(r);
    while (r.distancia <> 0) and (diml < dimf) do
    begin
        diml := diml + 1;
        v[diml] := r;
        leerViaje(r);
    end;
end;

//punto B

procedure recorrerVector(v: vector; diml: integer);
var
    montoTotal: real;
    r: Rviaje;
    i: integer;
    vc: vcontador;
begin
    montoTotal := 0;
    r.monto := 99999; // Inicializo un monto alto porque el inciso me pide el viaje con menor monto

    for i := 1 to 31 do
        vc[i] := 0; // Inicializar el contador de viajes por día
    

    for i := 1 to diml do
    begin
        montoTotal := montoTotal + v[i].monto;
        

        if (v[i].monto < r.monto) then
            r := v[i]; // Me guardo TODO el viaje (incluye la distancia y el dia)

        vc[v[i].dia] := vc[v[i].dia] + 1; // Incremento el contador del día del viaje
    end;

    writeln('Monto promedio es: ', (montoTotal / diml):0:2);
    writeln('Distancia total es: ', DistanciaTotal:0:2, 'y el dia del mes que se transporto menos dinero fue el dia: ', r.dia);
    writeln('Cantidad de viajes por dia: ');
    for i := 1 to 31 do
        writeln('Dia ', i, ': ', vc[i], ' viajes');
end;


procedure eliminar(var v: vector; var diml: integer);
var
    i: integer;
    pos: integer;
begin
    pos := 1;
    while (pos <= diml) do
    begin
        if (v[pos].distancia = 100) then
        begin
            diml := diml - 1; // Disminuyo el tamaño lógico del vector
            for i := pos to diml do
                v[i] := v[i + 1]; // Desplazo los elementos hacia la izquierda
        end
        else
            pos := pos + 1; // Solo incremento la posición si no elimino un elemento
    end;
end;

// programa principal
var
    v: vector;
    diml: integer;
begin
    diml := 0;
    cargarVector(v, diml);
    recorrerVector(v, diml);
    eliminar(v, diml);
end.
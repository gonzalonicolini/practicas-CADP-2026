program ejer10;
const
    dimf = 300;
type
    vector = array [1..dimf] of real; //porque un real? porque te pide almacenar el SALARIO de empleados.

procedure cargarVector(var v: vector; var dimL: integer);
var
    salario: real;
begin
    writeln('Ingrese el salario del empleado: ');
    readln(salario);
    while (dimL < dimf) and (salario <> 0) do
    begin
        dimL := dimL + 1;
        v[dimL] := salario;
        writeln('salario del empleado: ');
        readln(salario);
    end;
end;

procedure puntoA(var v: vector; dimL: integer; x: real);
var
    i: integer;
begin
    for i := 1 to dimL do
    begin
        v[i] := v[i] * x;
    end;
end;

procedure puntoB(v: vector; dimL: integer);
var
    suma: real;
    i: integer;
begin
    suma := 0;
    for i := 1 to dimL do
    begin
        suma := suma + v[i];
    end;
    writeln('Salario promedio es: ', (suma / dimL):0:2);
end;

//PROGRAMA PRINCIPAL
var
    v: vector;
    dimL: integer;
    x: real;
begin
    dimL := 0;
    cargarVector(v, dimL);
    writeln('Ingrese el valor de X: ');
    x:=1.15; //esto es para simular un aumento del 15% en el salario, pero se puede pedir al usuario que ingrese el valor de X.
    puntoA(v, dimL, x);
    puntoB(v, dimL);
end.
program ejer1;
const
    dimF = 500; 
type
    vector = array [1..dimF] of integer;

procedure cargarVector(var v: vector; var dimL: integer);
var
    num: integer;
begin
    write('Numero: '); 
    readln(num);
    while (dimL < dimF) and (num <> 0) do
        begin
            dimL:= dimL + 1;
            v[dimL]:= num;
            write('Numero: '); readln(num);
        end;
end;

procedure recorrerVector (v:vector;dimL:integer;num:integer);
var
    i:integer;
begin
    i := 1;
    while (i <= dimL) and (v[i] <> num) do
        i:= i + 1;
    //el punto B habria que cambiar (v[i] <> num) por (v[i] < num) porque se encuentra ordenado de forma ascendente, si fuese descendente seria (v[i] > num)

    if (i <= dimL) and (v[i] = num) then
        writeln('El numero se encuentra en la posicion: ', i)
    else
        writeln('El numero no se encuentra en el vector');  
end;



var
    num,dimL: integer;
    v: vector;
begin
    dimL := 0;
    cargarVector(v, dimL);
    write('Ingrese el numero a buscar: ');
    readln(num);
    recorrerVector(v, dimL);
end.
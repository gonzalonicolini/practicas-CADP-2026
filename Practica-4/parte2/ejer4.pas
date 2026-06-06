program ejer4;
const
    dimf = 1000;
type
    alumno = record
        nroAlu: integer;
        nombre: string;
        apellido: string;
        asistencias: integer;
    end;
    vector = array [1..dimf] of alumno;


//la catedra DISPONE de informacion
//PUNTO A
function posicion(v:vector; num:integer):integer;
begin
    pos:=1;
    while (v[pos].nroAlu <> num) do
        pos:=pos+1;
end;
//PUNTO B
procedure insertar(var v:vector; var diml:integer; alu:alumno);
begin
    if (diml < dimf) then
    begin
        diml := diml + 1;
        v[diml] := alu;
    end;
end;
//PUNTO C
procedure eliminarPos(var v:vector; var diml:integer; pos:integer);
var
    i: integer;
begin
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

//PUNTO D
procedure eliminarNro(var v:vector; var diml:integer; numAlu:integer);
var
    i: integer;
    pos: integer;
begin
    pos :=1; //me paro en el primer elemento del vector del 1 al 1000
    while (pos < diml) and (v[pos].nroAlu < numAlu) do
        pos := pos + 1;
    
    if (pos <= diml) then 
    begin
        if (v[pos].nroAlu = numAlu) then
        begin
            if (pos < diml) then
                for i := pos to diml do
                    v[i] := v[i + 1];
            diml := diml - 1;
        end;
    end;
end;

procedure eliminar0Asistencias(var v:vector; var diml:integer);
var
    x, pos: integer;
begin
    pos := 1;
    while (pos <= dimL) do // Ahora sí evalúa hasta el final
    begin
        if (v[pos].cantAsistencia = 0) then
        begin
            // Si no es el último, desplazo
            if (pos < dimL) then 
                for x := pos to (dimL - 1) do
                    v[x] := v[x + 1];
            
            dimL := dimL - 1; // Achico la dimensión sea el último o no
        end
        else
            pos := pos + 1; // Solo avanzo si no eliminé
    end;
end;

//PP

var
    v: vector;
    diml: integer;
    pos: integer;
    nroAlu: integer;
    alu: alumno;

begin
    diml := 0;
    cargarVector(v, diml);// se dispone

    //punto A
   writeln('ingrese nro de alumno');
   readln(nroAlu);
   pos := posicion(v, nroAlu);

   //punto B
   insertar(v, diml, alu);
   
    //punto C
    eliminarPos(v, diml, pos);

    //punto D
    eliminarNro(v, diml, nroAlu);

    //punto E
    eliminar0Asistencias(v, diml);

end.
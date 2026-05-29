program ejer8;
const
    dimf = 400;
type
    vector = array [1..dimf] of integer;

    alumnos = record
        nombre: string;
        apellido: string;
        dni: integer;
        nroinscripcion: integer;
        anionac: integer;
    end;
    
procedure leerAlumno(var a: alumnos);
begin
    writeln('Ingrese el nombre del alumno:');
    readln(a.nombre);
    writeln('Ingrese el apellido del alumno:');
    readln(a.apellido);
    writeln('Ingrese el DNI del alumno:');
    readln(a.dni);
    writeln('Ingrese el numero de inscripcion del alumno:');
    readln(a.nroinscripcion);
    writeln('Ingrese el año de nacimiento del alumno:');
    readln(a.anionac);
end;

procedure cargarVector(var v: vector);
var
    i: integer;
    a: alumnos;
begin
    for i := 1 to dimf do
    begin
        leerAlumno(a);
        v[i] := a;
    end;
end;

function soloPar(dni:integer): boolean;
begin
    soloPar := true;
    while (dni <> 0) and (soloPar) do
    begin
        if (((dni mod 10) mod 2) <> 0) then
            soloPar := false
        else
            dni := dni div 10;
    end;
end;


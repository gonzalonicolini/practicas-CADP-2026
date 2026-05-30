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

procedure masViejos(a:alumnos; var max1, max2: integer; var nom1, nom2,ape1,ape2: string);
begin
  if (a.anionac < max1) then
    begin
        max2 := max1;
        nom2 := nom1;
        ape2 := ape1;
        max1 := a.anionac;
        nom1 := a.nombre;
        ape1 := a.apellido;
    end
  else 
    if (a.anionac < max2) then
    begin
        max2 := a.anionac;
        nom2 := a.nombre;
        ape2 := a.apellido;
    end;
end;

procedure imprimir(v:vector);
var
    i,cantPar,max1, max2: integer;
    nom1, nom2, ape1, ape2: string;
begin
    cantPar := 0;
    max1 := 9999;
    max2 := 9999;
    for i := 1 to dimf do
    begin
        if (soloPar(v[i].dni)) then
            cantPar := cantPar + 1;
        masViejos(v[i], max1, max2, nom1, nom2, ape1, ape2);
    end;
    writeln('el porcentaje de alumnos con DNI compuesto solo por digitos pares es: ', ((cantPar/dimf)*100):0:2, '%');
    writeln('Los dos alumnos mas viejos son: ', nom1, ' ', ape1, ' y ', nom2, ' ', ape2);
end;

// programa principal
var
    v: vector;
begin

    cargarVector(v);
    imprimir(v);
end.
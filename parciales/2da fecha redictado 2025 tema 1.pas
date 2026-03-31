{Se dispone una estructura con información de materias. La informacion que se dispone esta ordenada por nombre apellido de cada profesor.
De cada materia se conoce:
	•	código
	•	denominación
	•	apellido (profesor responsable)
	•	año (1..5)
	•	semestre (1 o 2)
	•	cantCorrelativas

Se pide:

a) Generar una estructura nueva con apellido del profesor y cantidad de materias a su cargo, ordenada ascendentemente por apellido.
b) Informar los 2 años con mayor cantidad de materias con al menos 2 correlativas.
c) Informar denominación de materias del primer semestre cuyo código tenga menos dígitos pares que impares

solo se tiene que recorrer una sola vez la lista que se dispone}



program parcial
type
    raño=1..5

    materia = record
        código:integer;
        denominación:string
        nomape:string;
        año:raño
        semestre1:boolean;
        semestre2:boolean;
        cantCorrelativas:integer;
    end;

    profexmateria = record;
        nomape:string;
        cantmaterias:integer;
    end;

    vAnio = array [raño] of integer

    lista = ^nodo // L que se dispone
    nodo = record
        dato:materia
        sig:lista
    end;


    listanue = ^nodonue
    nodonue = record
        dato:materia
        sig:listanue
    end;



procedure inicializarV (var v:vAnio)
var
i:integer
begin
    for i:= 1 to 5 do
        v[i]:=0
end;


procedure insertarOrdenado(var L2:listanue, pm:profexmateria)
var
    act,ant,nue:listanue
begin
    new(nue)
    act:=L2
    ant:=L2
    new^.dato:=c
    while (act<>nil) and (pm.nomape > act.dato.nomape) do // ordenado de manera ascendente
    begin
        act:=act^.sig
        ant:=act
    end;
    if (act = L2) then
        L2:=nue
    else
        ant^.sig:= nue
    nue^.sig := act;
end;


procedure maximos (v: vAnio)
var
    max1,max2:integer;
    i,Amax1,Amax2:ranio;
begin
    max1:=0
    max2:=0
    for i := 1 to 5 do
    begin
        if (max1<vc[i]) then
        begin
            max2:=Max1
            Amax2:=Amax1
            max1:=vc[i]
            Amax1:=i
        end
        else
            if (max2<vc[i]) then
            begin
                
                max2:=vc[i]
                Amax2:= i
        end
    writeln (Amax1,Amax2)
end;


function cumple (cod:integer):boolean
var
    dig, impar, par:integer
begin
    par:=0
    impar:=0

    while (cod <> 0 ) do
    begin
        dig:= cod mod 10
        if (dig mod 2 = 0) then
            par := par +1
        else
            impar := impar +1
        cod:= cod div 10
    end
    cumple := (par < impar)
end


procedure recorrerLista (l:lista;var v:vAnio; var l2:listanue)
var
    cant:integer
    pm:profexmateria
begin
    cant:=0
    while (l<>nil) do
    begin
        if (l^dato.correlativas>=2) then
            v[l^dato.anio]:=v[l^dato.anio] + 1
        
        if (l^dato.semestre1 = true) and (cumple(l^dato.codigo)) then
            writeln (l^dato.denominación)

        if (l^dato.nomape = L2^.dato.nomape) then
        begin
            cant := cant + 1
            L2^.dato.cantmaterias:=cant
        end
        else
            insertarOrdenado (L2,pm)
        L:=L^.sig
    end
    maximos(vc)
end

/pp

var

L:lista
L2:listanue
v:vAnio

BEGIN
    l:nil
    l2:nil
    cargarLista(l)// se dispone
    inicializarV(v)
    recorrerLista (l,v,l2)
end

{Redictado cadp 2024 turno 2 tema 1

Una escuela necesita un programa para administrar info de preinscripciones. De cada preinscripcion se lee: dni, nombre, apellido, fec nac (año, mes y dia), telefono y
hs de preferencia que va de 1 a 4. Se pide:
a) leer y almancenar la infor de las pre inscripciones en uan estructura adecuada. La info debe quedar almacenada en el mismo orden que fue leida. 

B) a partir de la estructura generada en A, Calcular e informar:
    a. los 2 horarios mas requeridos por alumnos nacidos entre enero y junio
    b. ape, nom y tel de aquellos alumnos con DNI compuesto por digitos impares
    c. porcentaje de preinscripciones al horario 4
}

program parcial
type
    rHorario = 1..4

    preinscripcion = record
        dni:integer
        apellido:string
        nombre:string
        dianac:integer
        mesnac:integer
        anionac:integer
        telefono:integer
        hspref:integer
    end;

    lista = ^nodo

    nodo = record
        dato:preinscripcion
        sig:lista
    end;

    vCont = array [1..4] of integer;


procedure leer (var p: preinscripcion)
begin
    readln(p.dni)   
    readln(p.apellido)
    readln(p.nombre)
    readln(p.dianac)
    readln(p.mesnac)
    readln(p.anionac)
    readln(p.telefono)
    readln(p.hspref)
end;

procedure AgregarAtras(var pri,ult:lista;p:preinscripcion)
var
    nue:lista;
begin
    new(nue)
    nue^.dato := preinscripcion
    nue^.sig:= nil
    if (pri = nil) then
        pri:=nue
    else
        ult^.sig:=nue
    ult:=nue
end;


procedure inicializarVCont (var vc:Vcont)
var
    i:rHorario
begin
    for i := 1 to 4 do
        vc[i]:=0
end;

procedure cargarLista (var pri,ult:lista)
var
    p:preinscripcion
begin
    leer(p)
    AgregarAtras(pri,ult,p)
end

procedure maximos (vc: Vcont)
var
    max1,max2:integer;
    i,hsmax1,hsmax2:rHorario;
begin
    max1:=0
    max2:=0
    hsmax1:=0
    hsmax2:=0
    for i := 1 to 4 do
    begin
        if (max1<vc[i]) then
        begin
            max2:=Max1
            hsmax2:=hsmax1
            max1:=vc[i]
            hsmax1:=i
        end
        else
            if (max1<vc[i]) then
            begin
                
                max2:=vc[i]
                hsmax2:= i
        end
    writeln (hsmax1,hsmax2)
end;

function cumple (dni:integer):boolean
var
    par, impar, dig:integer
begin
    par:=0
    impar:=0
    while (dni <> 0 ) and (par > 0) do
    begin
        dig: dni mod 10
        if (dig mod 2 = 1) then
            impar:= impar + 1
        else
            par:= par + 1
        dni := dni div 10
    end
    cumple : = (par = 0)
end;

procedure recorrerLista (var l:lista, var vc:vCont)
var
    turno4,totalpreins:integer;
    porcentaje:real;


begin
    inicializarVCont(vc)
    totalpreins:=0
    turno4:=0
    while (l<>nil) do
    begin
        totalpreins:=totalpreins + 1
        if (l^.dato.hspref = 4) then
            turno4:=turno4 +1

        if (cumple(l^dato.dni)) then
            whiteln(l^dato.nombre,l^dato.apellido,l^dato.telefono)

        if(l^dato.mesnac<= 6) then
            maximos (vc)
            //aca esta mal el maximo, yo tengo que sacarlo recorriendolo pero no recuerdo como se hace.

        l:=l^.sig
    end;
    porcentaje:=  (turno4/totalpreins)*100
    writeln('el % es', porcentaje)
end

//pp

var
pri,ult,l:lista
vc:vcont

begin
l:=nil
cargarLista(pri,ult)
recorrerLista(l,vc)
end;


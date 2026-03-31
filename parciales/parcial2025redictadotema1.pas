{PARCIAL REDICTADO 2025 FECHA 1 TURNO 1 TEMA 1

una agencia de autos necesita un programa para administrar la info de las reservas de turnos para realizar los servicios de mantenimiento durante el mes de octubre de 2025. Se dispone de una estructura con la info
de las reservas de turnos. De cada reserva de turno se conoce: codigo de reserva, dni del cliente, dia en el cual debera realziar el servicio (1..31), hora de inicio (8..18), hora de fin (8..18),
tipo de servicio (1..10). Ademas, se dispone de otra estructura con el precio por hora que debera abonar el cliente de acuerdo al tipo de servicio

a) generar una nueva estructura con cod de reserva y precio total de cada reserva. Esta estructura debe generarse ordenada de manera ascendente por el precio total de cada reserva de turno.
 
b) informar los 2 dias del mes con menor cant de reservas de clientes con dni que contenga a lo sumo 2 digitos impares

c) realizar un modulo que reciba la estructurada generada en A y retorne el promedio de precio total que estan pagando los clientes en octubre de 2025

}


program parcial;
type
    rDia = 1 ..31;
    rHora = 8..18;
    rServicio = 1 ..10;


    reserva = record
        codReserva:integer;
        dni:integer;
        dia:rDia;
        hsIni:rHora;
        hsfin:rHora;
        tServicio:rServicio;
    end;

    vPrecio = array [rServicio] of real; // vector de precio de acuerdo al tipo de servicio

    //lista que se dispone

    lista = ^nodo;
    nodo = record;
        dato: reserva;
        sig: lista;
    end; 

    //punto a) nueva estructura con cod de reserva y precio total 
    codxprecio = record
        codReserva:integer;
        precioTotal:real;
    end;

    lista2 = ^nodonue
    nodonue = record
        dato:codxprecio
        sig:lista2

    vCont = array [rDia] of integer;// cantidad de reservas de clientes para el punto b


procedure CargarLista (var L:lista, r:reserva)// se dispone
procedure CargarVector (var vp:vPrecio)// se dispone




procedure inicializarVcont (var vc:Vcont)
var
    i:rDia
begin
  for i:= 1 to 31 do
    vc[i]:=0
end;


procedure insertarOrdenado(var L2:lista2, c:codxprecio)
var
    act,ant,nue:lista2
begin
    new(nue)
    act:=L2
    ant:=L2
    new^.dato:=c
    while (act<>nil) and (c.codxprecio > act.codxprecio) do // ordenado de manera ascendente
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





procedure minimos (vc:Vcont)
var
    i,min1,min2:integer;
    diaMin1,diaMin2:rDia;
begin
    diaMin1:=0;
    diaMin2:=0;
    min1:=999;
    min2:=999;
    for i:=1 to 31 do
    begin
        if (min1>vc[i]) then
        begin
            diaMin1:=i;
            diaMin2:=diaMin1;
            min1:=vc[i];
            min2:=min1;
        end
        else
            if (min2>vc[i]) then
            begin
            diaMin2:=i;
            min2:=vc[i];
            end;
    end;
    writeln (diamin1,diamin2);
end;


function cumple (dni:integer):Boolean
var
    impar,dig
begin
  impar:=0
  while (dni<>0) and (impar>2) do
  begin
    dig:= dni MOD 10
    if (dig MOD 2 = 1) then
        impar := impar + 1
    dni:=dni DIV 10
  end;
  cumple:= (impar = 2)
end;

procedure recorrerLista (var L2:lista2, L:lista, vp:vPrecio)
var
c:codxprecio
vc:vCont
precioxdia:real;
canthoras:integer;

begin
    canthoras:=0
    precioxdia:=0

    while (L<> Nil) do
    begin
        canthoras:= l^dato.horafin + l^dato.horaini
        precioxdia:= canthoras * vp[l^.dato.tservicio]
        c.codReserva:=l^dato.codreserva
        c.precioTotalxHs:=precioxdia

        insertarOrdenado(l2,c)

        if (cumple(l^.dato.dni)) then
            vc[l^dato.dia]:=v[l^dato.dia] + 1

        l:=l^.sig
    end;
        minimos(vc)
    
end;

function promedio (L2:lista2): Real
var
    precioTotal, promedio:Real
    reservatotales:Integer
begin
    reservatotales:=0
    preciototal:=0
    promedio:=0
    while(l2<>nil) do
        begin
            preciototal:= preciototal + l2^.dato.preciototal
            reservatotales:= reservatotales + 1
            L2:=L2^.sig
        end;
    promedio:=(preciototal/reservatotales)
end;


PP//

VAR
    L:lista
    l2:lista2
    vp:vectorPrecio
    vc:vcont
    promedioretorno:real
begin
  
  l:=nil
  l2:=nil
  cargarLista(l)// se dispone
  cargarVector(vp)//se dispone
  inicializarVCont(vc)
  recorrerLista (l,l2,vp)
  promedioretorno:= promedio(l2) // cuando dice retornar es una funcion. 
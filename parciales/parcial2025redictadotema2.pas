{PARCIAL REDICTADO 2025 FECHA 1 TURNO 1 TEMA 2

una agencia de motos necesita u nprograma para administrar la info de las reservas de turnos para realizar los servicios de mantenimiento durante el mes de noviembre de 2025. Se dispone de una estructura con la info
de las reservas de turnos. De cada reserva de turno se conoce: codigo de reserva, dni del cliente, dia en el cual debera realziar el servicio (1..30), hora de inicio (7..19), hora de fin (7..19),
tipo de servicio (1..5). Ademas, se dispone de otra estructura con el precio por hora que debera abonar el cliente de acuerdo al tipo de servicio

a) generar una nueva estructura con cod de reserva y precio total de cada reserva. Esta estructura debe generarse ordenada de manera descendente por el cod de reserva de turno.
 
b) informar los 2 dias del mes con mayor cant de reservas de clientes con dni que contenga al menos 3 digitos impares

c) realizar un modulo que reciba la estructurada generada en A y retorne el promedio de precio total que estan pagando los clientes en noviembre de 2025

}


program parcial;
type
    rDia = 1 ..30;
    rHora = 7..19;
    rServicio = 1 ..5;



    reserva = record
        codReserva:integer;
        dni:integer;
        dia:rDia;
        hsIni:rHora;
        hsfin:rHora;
        tServicio:rServicio;
    end;

    vPrecio = array [rServicio] of real; // volver a chequear esto

    //lista que se dispone

    lista = ^nodo;
    nodo = record;
        dato: reserva;
        sig: lista;
    end; 



    codxprecio = record
        codReserva:integer;
        precioTotalxHs:real;
    end;

    lista2 = ^nodonue
    nodonue = record
        dato:codxprecio
        sig:lista2

    vCont = array [rDia] of integer;// cantidad de reservas de clientes para el punto b


Procedure cargarLista (var L:lista, r:reserva) // se dispone

Procedure cargarVector (var vp:precio) // se dispone

Procedure insertarOrdenado (var L2:lista2, cp:codxprecio)
var
    ant,act,nue:lista2
begin
    new(nue);
    nue^.dato:=cp
    act:=L2
    ant:=L2
    while (act <> nil) and (cp.codReserva < act^.dato.codReserva) do 
    begin
        ant:=act
        act:=act^.sig
    end;
    if (act = L2) then
        L2:=nue
    else
        ant^.sig:= nue
    nue^.sig := act;
end;   


Procedure inicializarVCont(var vc:vCont)
var
    i:integer
begin
    for i:= 1 to 30 do
        vc[i]:=0;
end;

procedure maximos (vc:vCont)
var
    max1,max2:real
    diaMax1,diaMax2:rDia
    i:integer
begin
    max1:=0
    max2:=0
    diaMax1:=0
    diaMax2:=0
    for i:= 1 to 30 do begin
        if (max1<vc[i]) then begin
        max2:max1
        diaMax2:=diaMax1
        max1:=vc[i]
        diaMax1:=i
        end
        else
            if (max2<vc[i]) then begin
            max2:=vc[i]
            diaMax2:=i
            end;
    end;
    writeln (diaMax1, diaMax2)
end;


function cumple (dni:integer): boolean
var
impar,dig:integer
begin
    impar:=0
    while (dni<>0) and (impar < 3) do
    begin
        dig:=dni mod 10
        if (dig mod 2 = 1) then
            impar:=impar + 1;
        dni:= dni div 10;
    end;
    cumple:= (impar = 3)
end;






function promedio (L2:lista2): real
var
    precioTotal,promedio:real
    reservaTotales:integer
begin
    reservaTotales:=0
    precioTotal:=0
    promedio:=0
    while (l2 <> nil) do begin
        precioTotal := precioTotal + l2^.dato.precioTotal
        reservaTotales := reservaTotales + 1
        L2:= L2^.sig
    end;
    promedio:=(precioTotal/reservaTotales)
    

end;




procedure recorrerLista (var l2:lista2, l:lista, vp:vectorPrecio)
var
cp:codxprecio
vc:vCont
precioxdia:real;
canthoras:real;
begin
    canthoras:= 0
    precioxdia:=0
    while(l<>nil) do 
    begin
        canthoras:= l^dato.horafin - l^dato.horaini
        precioxdia:= canthoras * vp[l^dato.tservicio]
        cp.codReserva:=l^dato.codreserva
        cp.precioTotalxHs:=precioxdia

        insertarOrdenado(l2,cp)

        if (cumple(l^.dato.dni)) then
            vc[l^dato.dia]:=v[l^dato.dia] + 1

        l:=l^.sig
    end;
        maximos(vc)
        

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
end;
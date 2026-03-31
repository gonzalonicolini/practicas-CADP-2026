(* 
 * PARCIAL 2DA FECHA 2023
 * 
{Un salon de eventos necesita un programa para administrar la informacion de las reservas de diciembre de 2023. 
Se dispone de una estruicutra con la informacion de las reservas.
De cada reserva se conoce: numero de reserva, DNI del cliente, dia del evento(1..31), hora de inicio, 
hora de fin  y categoria de serivicio (1..4). Ademas, se dispone de una tabla
co el precio por hora de reserva de acuerdo a cada categoria de servicio.
A)generar una nueva estructura con numero y precio total de acada reserva. Esta estrucuta debe generar ordenada
por el precio total de cada reserva.
B)Informar los dias del mes con menor cantidad de reservas de clientes con DNI par.
C)Informar el porcentaje de reservas de eventos que inicien despues de las 12 hs y se produzcan en la segunda quincena} 
 *)


program 2da2023;
type
	rangoDia=1..31;
	rangoCat=1..4;
	rangoHora=0..23;

	reserva = record
		num:integer;
		dni:integer;
		diaEv:rangoDia;
		horaIni:rangoHora;
		horaFin:rangoHora;
		categoria:rangoCat;
	end;

	CostoxRes = record
		num:integer;
		precioRes:Real;
	end;

	LReserva = ^nodoR;
	nodoR = record
		dato: reserva;
		sig: LReserva;
	end;
	
	Lnueva = ^nodonue;
	nodonue = record
		dato:CostoxRes;
		sig:Lnueva;
	end;
	
	Vcosto = array [RangoCat] of real; 
	Vdia = array [RangoDia] of integer;
	
	
	
Procedure inicializarVdia(var vd:Vdia);
var
	i:integer;
begin
	For i:= 1 to 31 do
		vd[i]:=0;
end;


Procedure CargarReserva (var lr: Lreserva);// se dispone

Procedure CargarCosto (var vc:Vcosto); // se dispone

Procedure insertarOrdenado (var ln:Lnueva; cr: CostoxRes);
var
	nue, act, ant:Lnueva;
begin
	new (nue);
	nue^.dato:=cr;
	act:=ln;
	ant:=ln;
	while (act<>nil) and (cr.precioRes>act^.dato.precioRes) do
		begin
				ant:=act;
				act:= act^.sig;
		end;
	if (act = ant) then
		ln := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;


Procedure Maximos (vd:Vdia);
var
		diaMax1, diaMax2, Max1, Max2,i:integer;
begin
	diaMax1:= -99
	diaMax2:= -99
	Max1:= -99 
	Max2:= -99
	for i := 1 to 31 do 
		begin
			if(vd[i]>max1) then 
			begin
				Max2:=Max1;
				diaMax2:=diaMax1;
				Max1:=vd[i];
				diaMax1:=i;
			
			end
			else
				if(vd[i]>Max2) then
				begin
					Max2:=vd[i];
				diaMax2:=i;
				end;
		end;
		writeln(diaMax1, diaMax2);
end;


procedure RecorrerLista (vc:Vcosto;lr:Lreserva;var ln:Lnueva; var vd:Vdia;);
var
	porcentaje:real;
	totalEventos,suma:integer;
	aux3:CostoxRes;
begin
	suma:=0;
	totalEventos:=0;
	porcentaje:=0;

	while (lr<>nil) do begin
		totalEvento:=totalEvento + 1;
		if (lr^.dato. dni MOD 2 = 0) then
			vd[lr^.dato.diaEv]:= vd[lr^.dato.diaEv]+1;
		if (lr^.dato.horaIni < 12) and (lr^.dato.diaEv <= 15) then
			suma:=suma+1;
		aux3.num:=lr^.dato.num;
		aux3.precioRes:= (L^dato.horaFin - L^dato.horaIni) * vc[lr^dato.categoria]
		InsertarOrdenado(ln,aux3);
	end
	maximos(vd);
	porcentaje := (suma/totaleventos)*100
	writeln('el % es', porcentaje);
end;


VAR
lr:Lreserva
ln:Lnueva
vd:Vdia
vc:Vcosto

BEGIN
lr:=NIL;
ln:=NIL;
inicializarVdia(vd);
CargarReserva(lr);
CargarCosto(vc);
RecorrerLista(vc,lr,ln,vd);

END.


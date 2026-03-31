(* 
 Redictado 2023 2da fecha TEMA 2
 
 Un salon de eventos necesita un programa para administrar la info de las reservas de dic de 2023. Se dispone de una estructura con la info de las reservas. De cada reserva se conoce: nro de reserva,
 dni del cleinte, dia de evento (1..31), hora de inicio, hora fin y categoria del servicio (1--4). Ademas, se dispone de una tabla con el precio por hora de reserva de acuerdo a cada cat de servicio
 
 a) generar una nueva estructura con nro y precio total de cada reserva. Esta estrucutra debe generarse ordenada por el precio total de cada reserva
 b) informar los 2 dias del mes con menor cant de reservas de clientes con dni impar
 C) Informar el porcentaje de reservas de eventos que inicien despues de las 12 hs y se produzcan en la segunda quincena 
 *)


program Redic_Parcial_2dafec_2023;
type
	rangoDia=1..31;
	rangoCat=1..4;
	rangoHora=0..23;
	
	reserva = record
		num:integer;
		dni:integer;
		horaIni:rangoHora;
		horaFin:rangoHora;
		categoria:rangoCat;
	end;
	
	CostoxRes=record
		num:integer;
		precioRes:real;
	end;
	
	LReserva = ^nodoR;
	nodoR = record
		dato:reserva;
		sig:LReserva;
		end;

	Lnueva = ^nodonue; //punto A
	nodonue = record
		dato:CostoxRes;
		sig:Lnueva;
	end;	

	
	Vcosto = array [RangoCat] of real; //para el punto C
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



Procedure Minimos (vd:Vdia);
var
		diaMin1, diaMin2, Min1, Min2,i:integer;
begin
	diaMin1:= 999
	diaMin2:= 999
	Min1:= 999 
	Min2:= 999
	for i := 1 to 31 do 
		begin
			if(vd[i]>Min1) then 
			begin
				Min2:=Min1;
				diaMin2:=diaMin1;
				Min1:=vd[i];
				diaMin1:=i;
			
			end
			else
				if(vd[i]>Min2) then
				begin
					Min2:=vd[i];
				diaMin2:=i;
				end;
		end;
		writeln(diaMin1, diaMin2);
end;


procedure RecorrerLista (vc:Vcosto;lr:Lreserva;var ln:Lnueva; var vd:Vdia);
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
		if (lr^.dato. dni MOD 2 = 1) then
			vd[lr^.dato.diaEv]:= vd[lr^.dato.diaEv]+1;
		if (lr^.dato.horaIni < 12) and (lr^.dato.diaEv <= 15) then
			suma:=suma+1;
		aux3.num:=lr^.dato.num;
		aux3.precioRes:= (L^dato.horaFin - L^dato.horaIni) * vc[lr^dato.categoria]
		InsertarOrdenado(ln,aux3);
	end;
	minimos(vd);
	porcentaje := (suma/totaleventos)*100
	writeln(porcentaje);

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



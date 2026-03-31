{Una feria de arte desea procesar informacion de los expositores que participaron de la edicion 2025. La feria
DISPONE de una estructura de datos con la informacion de los EXPOSITORES(LISTA DE EXPOSITORES SE DISPONE).
 De cada expositor se conoce: (Si lo conocemos, entonces sabemos que son sus campos de un registro)
DNI, nombre y apellido, año de su primera presentacion, y la informacion de sus 5 OBRAS en exposicion(Vector de). De cada OBRA
se conoce: titulo y precio.(otro registro)

Realizar un programa que:

a. Agregue a la estructura que se dispone, un nuevo expositor con sus 5 obras en exposicion. 
La informacion se lee desde el teclado. Luego de agregar el nuevo expositor se pide que: 
(PROCESO LEER, dentro un proceso cargarOBras. Luego agregarlo a la lista que se dispone.)

	i) informe para cada expositor el titulo de la obra de menor valor entre sus obras en exposicion
	(RECORREMOS EL VECTOR DE CADA EXPOSITOR y calculamos un minimo. ADEMAS guardamos el dato que nos pide)
	
	ii) informe la cantidad de expositores que cumplen con tener tanto el DNI como el año de su primera presentacion
	conformados solamente por digitos impares
	(modulo DESCOMPONER, devuelve verdadero si todos los numeros del parametro pasado son impares)
	}

program claseApoyoLF;
type
	obra = record
		titulo:string;
		precio:real;
	end;
	vectorObras = array [1..5] of obra;
	expositor = record
		dni:integer;
		nombreCompleto:string;
		anioPresentacion:integer;
		obras:vectorObras;
	end;
	
	lista = ^nodo;
	nodo = record
		dato:expositor;
		sig:lista;
	end;


{/////////////////////////////////////MODULOS/////////////////////////////////}
procedure cargarLista(var l:lista); //SE DISPONE POR EL ENUNCIADO	

procedure leer(var expo : expositor);
var 
	i: integer;
begin
    readln(expo.DNI);
    readln(expo.nombreCompleto);
    readln(expo.anioPresentacion);    
    for i:=1 to 5 do begin
        readln(expo.obras[i].titulo);
        readln(expo.obras[i].precio);
    end;
end;

procedure cargarNodo(var l:lista; e:expositor);
var
	nue:lista;
begin
	new(nue);
	nue^.dato := e;
	nue^.sig:= l;
	l:= nue;
end;


procedure agregarExpositor(var l:lista);
var
	e:expositor;
begin
	leer(e);
	cargoNodo(l,e);
end;


procedure recorrerVector(v:vectorObras; Var min:integer; var titulo:string);
var
	i:integer;
begin
	for i:= 1 to 5 do begin
		if(v[i].precio < min) then begin
			min:= v[i].precio;
			titulo:= v[i].titulo;
	end;
end;

function descomponer(num:integer):boolean;
var
	ok:boolean;
	aux:integer;
begin
	ok = true;
	while(num <> 0) and (ok =true) do begin
		aux := num MOD 10;
		if(aux MOD 2 = 0) then
			ok := false
		else
			num:= num DIV 10;
	end;
	descomponer:= ok;
end;
		



	
procedure recorrerLista(l:lista);
var
	min:integer; //INICIALIZAR
	tituloMin:string;
	cant:integer; // INICIALIZAR
begin
	cant:= 0;// INCISO C
	while(l<>nil) do begin
		min:= 9999;//INCISO B
		recorrerVector(l^.dato.obras,min,tituloMin);
		writeln('el titulo de la obra mas barata del expositor: ', l^.dato.nombreCompleto, ' es: ',tituloMin);
		if(descomponer(l^.dato.dni) = true) AND (descomponer(l^.dato.anioPresentacion) = true) then
			cant:= cant+1;
		l:= l^.sig;
	end;
	writeln('la canttidad de expositores que cumplen es: ',cant);

end;
	




{//////////////////////////////PROGRAMA PRINCIPAL/////////////////////////////}
Var
	l:lista;

begin
	cargarLista(l); //SE DISPONE POR EL ENUNCIADO
	agregarExpositor(l);
	recorrerLista(l);
end.



{l = lista
l^= nodo
l^.dato = expositor
l^.dato.obras = vector
l^.dato.obras[i] = obra
l^.dato.obras[i].precio = real}







































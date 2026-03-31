{Una librería dispone de información de los libros vendidos durante el año 2023. De cada libro
se conoce código del libro, título, autor, código de género (1..20), año de publicación y la
calificación obtenida en cada uno de los 12 meses del año. La calificación es numérica de 0 a
10, donde el valor 0 significa que el libro no ha sido vendido ese mes.}
program Libreria;

const
	
	cadena = string[20];
	DcodigoGenero = 20;
	Dcalificacion = 10;
	Rmes = 12;
type

	Vgenero = array [1..DcodigoGenero] of integer;
	Vcalificacion = array [0..Dcalificacion] of integer;

	Tlibros = record
		codigoLibro : integer;
		titulo : cadena;
		autor : cadena;
		codigoGenero : 1..DcodigoGenero;
		anio_pub : integer;
		calificacion : 1..Dcalificacion;
	end;

	Lventas = ^nodo;  //se dispone
		nodo = record;
			datos : Tlibros;
			sig : Lventas;
		end;

	procedure CargarLista(var l:Lventas); //se dispone

	{a. Informar para cada género la cantidad de libros publicados antes del año 2000.}

	procedure InicializarVectorG(var v:Vgenero);
	var
		i:integer;
	begin
		for i := 1 to DcodigoGenero do begin
			v[i] := 0;
		end;
	end;

	function anioSelec (anio:integer):boolean;
	begin
		anioSelec := anio < 2000;
	end;

	procedure VentasPorGenero (var v:Vgenero ; l:Lventas);
	var
		p : Lventas;
	begin
		p := l;
		while(p <> nil) do begin
			if(anioSelec(p^.datos.anio_pub)) then begin
				v[p^.datos.codigoGenero] := v[p^.datos.codigoGenero] + 1;
			p := p^.sig;
			end;
		end;
	end;

	procedure Informar(v : Vgenero);
	var
		i:integer;
	begin
		for i := 1 to DcodigoGenero do begin
			if(v[i] > 0) then begin
				writeln('Para el genero ', i, ' se publicaron ', v[i], ' libros antes del año 2000.');
			end;
		end;
		
	end;
	{b. Informar los títulos de los 2 libros con mejor calificación promedio en los meses en los que se
	vendieron. Solo deben considerarse los libros que se vendieron en más de 6 meses.}

	procedure CargarVectorMes (var vmes : vmes ; var vcal : Vcalificacion);
	begin
		while(l <> nil) do begin
			for i := 1 to Rmes do begin
			if(l^.datos.calificacion > 0) then
				v[i]
			end;
		end;
	end;

	procedure InformarMejoresLibros (l:Lventas);
	var
		libroActual : Lventas;
		sumaCalificaciones, cantMeses : integer;
	begin
		while(l <> nil) do begin
			libroActual := l^.datos;
			sumaCalificaciones := 0;
			cantMeses := 0;

			for i := 1 to Rmes do begin
				if(libroActual.calificacion[i] > 0) then begin
					sumaCalificaciones := sumaCalificaciones + libroActual.calificacion[i];
					cantMeses := cantMeses + 1;
				end;
			end;
		end;
	end;



	{c. Implementar e invocar un módulo que genere una lista con los libros cuyo código posee
	exactamente 4 dígitos pares y haya sido publicado entre 1995 y 2005. La lista debe estar
	ordenada por autor.}

	procedure InsertarOrdenado (var l2 : Lventas ; info : Lventas);
	var
		act, ant, nue : Lventas;
	begin
		act := l2;
		ant := l2;
		new(nue);
			nue^.datos := info;
		while (act <> nil) do begin
			AutorActual := act^.datos.autor
			while((act <> nil) and (act^.datos.autor = AutorActual)) do begin
				ant := act:
				act := act^.sig;
			end;
		end;

		if(act = ant) then begin
			l2 := nue;
		end
		else
			ant^.sig := nue;
			nue^.sig := act;
		end;
	end;

	function EsPar (codigo:integer):boolean;
	var
		aux:integer;
		pares : integer;

	begin
		pares := 0;

		while (codigo <> 0 ) do begin
			aux:= codigo MOD 10;
				if(aux MOD 2 = 0) then
					pares := pares + 1;
			codigo := aux DIV 10;
		end;

		if(pares = 4) then
			EsPar := true;
		else
			EsPar := false;
	end;

	function AñosSelec (anio:integer):boolean;
	begin
		AñosSelec := false;
		if ((anio >= 1995) and (anio <= 2005)) then begin
			AñosSelec := true;
		end;
	end;

	procedure NuevaLista (var ListaOrd : Lventas ; l : Lventas);
	var

	begin
		while(l <> nil) do begin
			if((EsPar(l^.datos.codigo)) and (AñosSelec(l^.datos.anio_pub))) then begin
				InsertarOrdenado(ListaOrd, l^.datos);
			end;
			l := l^.sig;
		end; 
	end;

	{d. Ingresar un código de libro y buscar su título en la lista generada en el inciso c.}

	procedure BuscarTitulo (l2 : Lventas);
	var
		codigo:integer;
		lista:Lventas;
		encontre : boolean;
	begin
		lista := l2;
		encontre := false;
		writeln('ingrese el codigo de libro para buscar el titulo: ');
		readln(codigo);
		while ((lista <> nil) and (not encontre)) do begin
			if(codigo = lista^.datos.codigoLibro) then begin
				encontre := true;
				writeln('El titulo del libro de este codigo es: ', lista^.datos.titulo);
				readln;
			end;
			lista := lista^.sig;
		end;

		if(not encontre) then begin
			writeln('No se ha encontrado el codigo ingresado.');
			readln;
		end;
	end;

//cuerpo del programa

var
	ventas, ventarOrd : Lventas;
	Genero : Vgenero;

begin
	ventas := nil;
	ventarOrd := nil;
	CargarLista(ventas); //se dispone;
	InicializarVectorG(Genero);
	VentasPorGenero(Genero, ventas);
	Informar(genero);
	NuevaLista(ventarOrd, ventas);
	BuscarTitulo(ventarOrd);
end.
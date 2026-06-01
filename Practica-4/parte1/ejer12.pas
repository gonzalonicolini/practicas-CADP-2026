program ejer12;
const
    dimf = 53;


type
    vector = array [1..dimf] of galaxia;
    vc = array [1..4] of integer;
    galaxia = record
        nombre: string;
        tipo: integer;
        masa: real;
        distancia: real;
    end;

procedure leerGalaxia(var g: galaxia);
begin
    writeln('Ingrese el nombre de la galaxia: ');
    readln(g.nombre);
    writeln('Ingrese el tipo de la galaxia (1-5): ');
    readln(g.tipo);
    writeln('Ingrese la masa de la galaxia: ');
    readln(g.masa);
    writeln('Ingrese la distancia de la galaxia: ');
    readln(g.distancia);
end;

procedure cargarVector(var v: vector);
var
    i: integer;
    g: galaxia;
begin
    for i := 1 to dimf do
    begin
        leerGalaxia(g);
        v[i] := g;
    end;
end;

procedure recorrervector (v: vector);
var
    cantGalIrre,i: integer;
    vc: vc;
    masaTotal,masa3,max1,max2,min1,min2: real;
    nomMax1,nomMax2,nomMin1,nomMin2: string;
begin
    for i := 1 to 4 do
    begin
        vc[i] := 0;//inicializo el vc porque tengo que empezar a contar los tipos de gal

    end;
    masaTotal := 0;
    masa3 := 0;
    max1 := -1;
    max2 := -1;
    min1 := 1000000;
    min2 := 1000000;

    for i := 1 to dimf do //laburo con las 53 galaxias
    begin
        vc[v[i].tipo] := vc[v[i].tipo] + 1; //arranco a contar la cantidad de gal de este tipo
        
        if (v[i].nombre = 'Via Láctea') or (v[i].nombre = 'Andromeda') or (v[i].nombre = 'Triángulo') then
        
            masa3 := masa3 + v[i].masa;
        masaTotal := masaTotal + v[i].masa; //voy sumando la masa total de las galaxias
    
        if (v[i].tipo = 4) and (v[i].distancia < 1000) then
            cantGalIrre := cantGalIrre + 1; //cuento las galaxias irregulares

        if (max1<v[i].masa) then
        begin
            max2 := max1;
            nomMax2 := nomMax1;
            max1 := v[i].masa;
            nomMax1 := v[i].nombre;
        end
        else 
            if (max2<v[i].masa) then
            begin
                max2 := v[i].masa;
                nomMax2 := v[i].nombre;
            end;
        
        if (min1>v[i].masa) then
        begin
            min2 := min1;
            nomMin2 := nomMin1;
            min1 := v[i].masa;
            nomMin1 := v[i].nombre;
        end
        else 
            if (min2>v[i].masa) then
            begin
                min2 := v[i].masa;
                nomMin2 := v[i].nombre;
            end;
    end;

    for i := 1 to 4 do
        writeln('Cantidad de galaxias de tipo ', i, ': ', vc[i]);


    writeln('el % que representan es', ((masa3/masaTotal)*100):0:2);

    writeln('la cantidad de galaxias irregulares es: ', cantGalIrre);

   // INCISO D
    writeln('Las 2 galaxias con mas masa son: ',nomMax1,' y ',nomMax2);
    writeln('Las 2 galaxias con menos masa son: ',nomMin1,' y ',nomMin2);
end;

//pp

var
    v:vector;
begin
    cargarVector(v);
    recorrervector(v);
end.
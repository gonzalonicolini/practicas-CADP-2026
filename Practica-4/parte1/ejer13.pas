program ejer13;
const
    dimf=2026;


type
    vectorTemp = array [1..100] of real; //porque un real? porque te pide almacenar la temperatura.
    vectorAnio = array [1976..dimf] of integer; 

procedure CargarVectorTemp(var vt: vectorTemp);
var
    i: integer;
begin
    for i := 1 to 100 do
    begin
        writeln('Ingrese la temperatura del punto ');
        readln(vt[i]);
    end;
end;

procedure cargarVectorAnio(var va: vectorAnio);
var
    i: integer;
begin
    for i := 1976 to dimf do
    begin
        writeln('Ingrese el año del punto ');
        readln(va[i]);
    end;
end;

procedure recorrervector (va: vectorAnio);
var
    anio,punto,anioMayorProm,anioMayorTemp: integer;
    sumaTemp,maxTemp,tempProm: real;
begin
    maxTemp:= 0;
    tempProm:= 0;
    for anio:=1974 to dimF do
        begin
            sumaTemp:= 0;

             for punto:=1 to 100 do
                begin
                    // INCISO A
                    sumaTemp:= sumaTemp + v[anio][punto];

                    // INCISO B
                    if (maxTemp < v[anio][punto]) then
                        begin
                            maxTemp:= v[anio][punto];
                            anioMayorTemp:= anio;
                        end;
                end;
            
            // INCISO A
            if (tempProm < (sumaTemp / 100)) then
                begin
                    tempProm:= sumaTemp / 100;
                    anioMayorProm:= anio;
                end;
        end;
    
    // INCISO A
    writeln('El anio con mayor temperatura promedio fue ',anioMayorProm);

    // INCISO B
    writeln('El anio que detector mayor temperatura en el mes fue: ',anioMayorTemp);
end;

// programa principal
var
    v: vectorAnio;
begin
    cargarVector(v);
    recorrerVector(v);
end.


-consultar este ejer, me costo un huevo-
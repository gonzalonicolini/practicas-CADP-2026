program ejer14;
const
    dimf = 1000;

type

    participante = record
        pais: string;
        codigo: integer;
        canths: integer;
        nombreProy: string;
        rol:string;
    end;

    vectorParticipante = array [1..dimf] of participante; // se dispone
    vectorMonto = array [1..5] of real;
    vectorContMonto = array [1..dimf] of real;
    vectorContProy = array [1..dimf] of integer;//para el inciso D - cantidad de arquitectos

procedure leerParticipante(var p: participante);
begin
    writeln('Ingrese el codigo del participante: ');
    readln(p.codigo);
    if (p.codigo <> -1) then
    begin
        writeln('Ingrese el pais del participante: ');
        readln(p.pais);
        writeln('Ingrese la cantidad de horas trabajadas: ');
        readln(p.canths);
        writeln('Ingrese el nombre del proyecto: ');
        readln(p.nombreProy);
        writeln('Ingrese el rol del participante: ');
        readln(p.rol);
    end;
end;

procedure cargarVector(var v: vectorParticipante; var dimL: integer);
var
    p: participante;
begin
    leerParticipante(p);
    while (p.codigo <> -1) and (dimL < dimf) do
    begin
        dimL := dimL + 1;
        v[dimL] := p;
        leerParticipante(p);
    end;
end;

procedure recorrerVector (v:vectorParticipante; dimL: integer; vm:vectorMonto)
var
    totalhs,minCod,i: integer;
    montoMin,montoTotal: real;
    vcm:vectorContMonto;
    vcp:vectorContProy;
begin
    totalhs := 0;
    montoTotal := 0;
    montoMin := 9999999;
    
    for i := 1 to dimF do
    begin
        vcm[i] := 0; //inicializo el vector contador de monto
        vcp[i] := 0; //inicializo el vector contador de proyectos
    end;

    for i := 1 to dimL do
    begin
        //punto A
        if (v[i].pais = 'Argentina') then

            montoTotal := montoTotal + (vm[v[i].rol]); //calculo el monto total para Argentina

        //punto B
        if (v[i].codigo = 3) then
            totalhs := totalhs + v[i].canths; //calculo el total de horas para el proyecto 3

        //punto C
        vcm[v[i].codigo] := vcm[v[i].codigo] + vm[v[i].rol];

        //punto D
        if (v[i].rol = 'Arquitecto de Software') then
            vcp[v[i].codigo] := vcp[v[i].codigo] + 1; //cuento la cantidad de arquitectos por proyecto
    end;


    writeln('El monto total para Argentina es: ', montoTotal:0:2); //informo el pto A
    writeln('El total de horas para el rol administrador es: ', totalhs); //informo el pto B

    for i := 1 to dimf do
    begin
        if (minMonto > vcm[i]) then
                begin
                    minMonto:= vcm[i];
                    minCod:= i;
                end;
    end;
    writeln('El codigo de proyecto que gasto menos es: ',minCod); //informo el pto C

    for i := 1 to dimf do
        writeln('La cantidad de arquitectos para el proyecto ',i,' es: ',vcp[i]); //informo el pto D
end;



//programa principal
var
    v: vectorParticipante;
    vm: vectorMonto;
    dimL: integer;
begin
    dimL := 0;
    cargarmontos(vm); // se dispone el vector vm con los montos correspondientes a cada rol
    cargarVector(v, dimL);
    recorrerVector(v, dimL, vm);
end.

// tirarselo a gemini
program ejer11;
const
    dimf = 200;
type
    vector = array [1..dimf] of fotos;
    fotos = record
        titulo: string;
        autor: string;
        cantMG: integer;
        cantClicks: integer;
        cantComment: integer;
    end;

procedure LeerFoto(var f: fotos);
begin
    writeln('Ingrese el titulo de la foto: ');
    readln(f.titulo);
    writeln('Ingrese el autor de la foto: ');
    readln(f.autor);
    writeln('Ingrese la cantidad de Me Gusta: ');
    readln(f.cantMG);
    writeln('Ingrese la cantidad de Clicks: ');
    readln(f.cantClicks);
    writeln('Ingrese la cantidad de Comentarios: ');
    readln(f.cantComment);
end;

procedure cargarVector(var v: vector);
var
    f: fotos;
    i: integer;
begin
    for i := 1 to dimf do
    begin
        LeerFoto(f);
        v[i] := f;
    end;
end;

procedure recorrerVector(v: vector);
var
    i,maxTitulo, cantArt, cantComments: integer;
    titulo:string;
begin
    maxTitulo := 0;
    cantArt := 0;
    cantComments := 0;

    for i := 1 to dimf do
    begin
        if ( maxTitulo< v[i].cantClicks ) then
        begin
            maxTitulo := v[i].cantClicks;
            titulo := v[i].titulo;
        end;

        if (v[i].autor = 'Art Vandelay') then
            cantArt := cantArt + v[i].cantMG;

        cantComments := cantComments + v[i].cantComment;
    end;
end;

//programa principal

var
    v: vector;

begin
    cargarVector(v);
    recorrerVector(v);
end.
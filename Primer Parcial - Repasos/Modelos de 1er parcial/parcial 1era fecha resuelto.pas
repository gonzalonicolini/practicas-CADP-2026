CADP - 1º Parcial 2º Fecha - 26/04/25
1. La función esPar tiene como objetivo retornar TRUE si el número recibido es par, o FALSE en caso contrario. Indique la afirmación correcta: D


function esPar(n:integer):boolean;
begin
    esPar := (n MOD 2) = 0;
end;

{
A. Es errónea, la función no puede retornar un boolean.

B. Es incorrecta, debe descomponer el número n.

C. Es incorrecta, debe usar DIV.

D. La función es correcta. --> la funcion es correcta

E. NS/NC
}

2. Dado el siguiente programa, indique la opción correcta: B

program parcial;
procedure decrementar(var n:integer);
begin
    n := n-1;
end;
var nro: integer;
begin
    nro := 10;
    decrementar(10);
    writeln(nro);
end.

{
A. El código es erróneo, no se puede inicializar la variable nro en 10.

B. La invocación al procedimiento es errónea, no se puede pasar un valor a un parámetro por referencia. respuesta correcta

C. Imprime 10

D. Imprime 9

E. NS/NC
}


3. Dado el siguiente programa, indique la opción correcta:

program parcial;
var
    i, nro: integer;
begin
    nro := 2;
    for i := -1 to 1 do
        nro := nro * i;
    writeln(nro);
end.


{
A. Imprime -2

B. El código es erróneo, el índice i no se puede usar dentro del for. (Nota: Según la imagen, marcaron B, pero técnicamente en Pascal i sí se puede usar para lectura. Sin embargo, en exámenes de CADP suelen considerar esto un error de concepto si se intenta modificar o por reglas específicas de la cátedra).

C. Imprime 0

D. El código es erróneo, nro no puede modificarse dentro del for.

E. NS/NC
}


4. Dado el siguiente programa, indique la opción correcta:



program parcial;
procedure incrementarSiEsPar(var x:integer);
begin
    if ((x MOD 2) = 0) then
        x := x+1;
end;
var i, n: integer;
begin
    for i:= 1 to 5 do begin
        n := i;
        incrementarSiEsPar(n);
        write(n,',');
    end;
end.

{
A. El código es erróneo, no existe la variable x.

B. El código es erróneo, no se puede pasar la variable n como parámetro.

C. Imprime 1, 3, 3, 5, 5

D. El código es erróneo, el procedimiento no retorna ningún valor. (Nota: Los procedimientos no "retornan" valores como las funciones, aunque el error real aquí sería semántico si se espera un retorno).

E. NS/NC}

5. Dado el siguiente programa, indique la opción correcta:D

program parcial;
function cuadrado(n:integer):integer;
var resultado: integer;
begin
    resultado := n*n;
end;
var nro: integer;
begin
    nro := 3;
    writeln(cuadrado(nro));
end.


{A. El código es erróneo, no se pueden declarar variables locales en una función.

B. Imprime 9

C. El código es erróneo, no se puede invocar una función en un writeln.

D. El código es erróneo, la función no retorna un valor. (Correcto: falta asignar el resultado al nombre de la función cuadrado := resultado).

E. NS/NC
}


6. Dado el siguiente programa, indique la opción correcta:

program parcial;
var x,y: integer;
begin
    repeat
        read(x);
        read(y);
    until (x = y);
    write(x, ' - ', y);
end.


{Valores a ingresar: 1, 2, 2, 3, 3, 3

A. El repeat hasta que ingresa en un ciclo infinito...

B. Imprime 1 - 2

C. Imprime 2 - 2

D. Imprime 3 - 3 Correcta

E. NS/NC
}


7. Dado el siguiente programa, indique la opción correcta:



program parcial;
var i, aux, max, max2: integer;
begin
    max := -1;
    for i := 1 to 3 do begin
        read(aux);
        if (aux > max) then begin
            max2 := max;
            max := aux;
        end;
        if (aux > max2) then
            max2 := aux;
    end;
    writeln(max, ' , ', max2);
end.

{Valores ingresados: 10, 30, 20

A. Imprime 20, 30

B. Imprime 30, 20

C. Imprime basura porque falta inicializar la variable max2.

D. Imprime 30, 30 correcto

E. NS/NC
}


8. Dado el siguiente programa, indique la opción correcta:

program parcial;
var cant, nro: integer;
begin
    cant := 0; read(nro);
    while (cant <= 4) and (nro <> 5) do begin
        cant := cant+1;
        read(nro);
    end;
    writeln(cant, '-', nro);
end.


{Secuencia a leer: 1, 2, 3, 4, 5

A. Imprime 4-5

B. El código es erróneo, no se puede leer de teclado un dato de tipo integer.

C. Imprime 4-4 Correcta

D. Imprime 5-5

E. NS/NC
}
9. Dado el siguiente programa, indique la opción correcta:

program parcial;
function max(a,b:integer):integer;
begin
    if (a > b) then
        max := a
    else
        max := b;
end;
begin
    write(max(5,6));
end.
{A. Es erróneo, en la función se están asignando dos valores de retorno. (Nota: En la imagen está tachado/marcado, pero el código es correcto para Pascal estándar).

B. Imprime 5

C. Es erróneo, los parámetros deben ser variables.

D. Imprime 6

E. NS/NC}

10. Dado el siguiente programa, indique la opción correcta:

program parcial;
procedure cuadrado(lado: integer; per, area:integer);
begin
    per := lado * 4;
    area := lado * lado;
end;
var i, perimetro, area: integer;
begin
    for i:= 1 to 3 do begin
        cuadrado(i, perimetro, area);
        write(perimetro, area);
    end;
end.

{
A. Imprime basura, los parámetros per y area deben estar pasados por referencia. Correcta

B. Imprime perímetro y área de los cuadrados de lado 1, 2 y 3 respectivamente.

C. Es erróneo, no se corresponden los parámetros formales con los reales.

D. Es erróneo, no se puede pasar i como parámetro.

E. NS/NC}
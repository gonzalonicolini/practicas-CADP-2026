program Ejer2;

// programa principal
var
    num: integer;
begin
    write('Ingresar un numero:');
    readln(num);
    if (num < 0) then
        num:= num * -1; // como es un if con solo una linea interna no es necesario cerrarlo con un end
    writeln('El valor absoluto es: ',num);
end.
program Ejer2;

// programa principal
var
    i,max,pos,num: integer;
begin
    max:= 0;

    for i:=1 to 10 do
        begin
            write('Ingresar un numero: ');
            readln(num);
            if (num > max) then
                begin
                    max:= num;
                    pos:= i;
                end;
        end;

    writeln('El mayor numero leido fue el ',max,', en la posicion ',pos);
end.
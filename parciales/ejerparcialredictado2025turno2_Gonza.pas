{ejercicio pascal



Una almacén/tienda disponía de una estructura con el stock de sus 100 productos.

Había que hacer un procedimiento qué lea los pedidos (código de producto, día, stock y NRO de pedido) y terminaba al leerse el NRO de pedido -1, el cuál no se procesaba. 

A_ crear una estructura que almacene los nro de pedidos, los cuáles satisfacen. De ser así, actualizar el stock.

B_ informar los días que tuvieron una cantidad de pedidos no satisfechos, los cuáles todos sus dígitos sean pares.

C_ crear un módulo el cuál reciba la lista del punta A y un nro de pedido, lo elimine de la lista de ser posible y retorne si se pudo o no. (Retorne, no informe)

}

program parcial;

type
    rProductos= 1..100;
    rDia= 1..30;

    pedidos=record;
        nroid:integer;
        codprod:rProductos;
        dia:rDia;
        cantprodpedida:integer;
    end;

    vStock = array [rProductos] of integer;

    lista = ^nodo;
    nodo = record;
        dato: pedidos;
        sig:lista;
    end;

procedure cargarvectorstock(var vs:vStock);//se dispone 

procedure leerPedido (var p:pedido);
begin
readln(p.nroid);
if (p.nroid <> -1 ) then
    readln (p.codprod);
    readln (p.dia);
    readln (p.cantprodpedida);
end;

procedure agregarAdelante (var L:lista, p:pedido);
var
    nue:lista;
begin
    new (nue);
    nue^.dato:=p;
    nue^.sig:=L;
    l:=nue;
end;



procedure cargarLista (var L:lista, var vs:vStock);
var
    i:rProductos;
    p:pedido ;
    cantpedidosnosati:integer;
begin
    cantpedidosnosati:=0;
    leerPedido(p);
    while (p.nroid <> -1 ) do
    begin
        if (p.cantprodpedida =< vs[p.codprod]) then
        begin
            agregarAdelante(l,p)
            v[p.codprod]:=v[p.codprod] - p.cantprodpedida
        end
        else 
            begin
            cantpedidosnosati:= cantpedidosnosati + 1
            if (cumple (cantpedidosnosati)) then
                writeln (p.dia);
            end;
        leerPedido(p);
    end;
end;




function cumple (num: integer): boolean;
var
    dig, par, impar: integer;
begin 
    par:=0;
    impar:=0;
    while (num <> 0) then 
    begin
        dig:= num mod 10
        if(dig mod 2 = 0) then
            par:=par + 1
        else
            impar:=impar + 1;
        num:=num div 10;

    end;
    cumple:=(impar= 0);
end;



procedure eliminar (var l:lista , num: integer);
var
    act,ant:lista;
begin
    act:=L;
    ant:=L;
    while (act<>ant) and (act^.dato.nroid <> num) do
    begin
        act:=ant;
        act:=act^.sig;
    end
    if(act<>nil);
            if(act=ant) then
            L:= L^.sig;
    else
        ant^.sig := act^.sig;
    dispose (act);
    writeln('se elimino el num');
    end;
end;





Var
    L:lista;
    Vs:vectorDtock;
    Núm:integer;

Begin
    L:nil
    Cargarvector(vs);// sedispone 
    Cargar lista (L,vs);
    Readln (num);
    Eliminar(l,num);
End
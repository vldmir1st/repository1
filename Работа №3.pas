type arr = array[1..100] of integer;
     matrix = array[1..10] of array[1..10] of integer;
var n, i, q:integer;
    check:boolean;
    a, sp_i, sp_j:arr;
    f:matrix;

procedure init_arr_random(var a:arr; n:integer);
var i:integer;
begin
  for i:=1 to n*n do
    a[i]:=random(9)+1
end;

procedure init_arr(var a:arr; n:integer);
var i:integer;
begin
  writeln('Введите ', n*n, ' элементов:');
  for i:=1 to n*n do
    read(a[i]); 
  writeln;
end;

procedure print_arr(const a:arr; n:integer);
var i:integer;
begin
  writeln('Массив');
  for i:=1 to n*n do
    write(a[i], ' ');
  writeln;
  writeln;
end;

procedure init_matrix(var f:matrix; a:arr; n:integer);
var count:integer;
    i, j:integer;
begin
  count:= 1;
  for i:=1 to n do begin
    for j:=1 to n do begin
      f[i,j]:= a[count];
      inc(count);
    end;
  end; 
end;

procedure print_matrix(const f:matrix; n:integer);
var i, j:integer;
begin
  writeln('Матрица');
  for i:=1 to n do begin
    for j:=1 to n do begin
      write(f[i, j], ' ');
    end;
    writeln;
  end;
  writeln;
end;

procedure spoint(const f:matrix; var check:boolean);
var max_line, min_line, max_column, min_column: arr;
    i, j, count: integer;
begin
  check:= False;
  for i := 1 to n do begin
    max_line[i] := f[i, 1];
    min_line[i] := f[i, 1];
  end;
  for j := 1 to n do begin
    max_column[j] := f[1, j];
    min_column[j] := f[1, j];
  end;
  for i := 1 to n do
    for j := 1 to n do begin
      if f[i, j] > max_line[i] then
        max_line[i] := f[i, j]
      else if f[i, j] < min_line[i] then
        min_line[i] := f[i, j];
      if f[i, j] > max_column[j] then
        max_column[j] := f[i, j]
      else if f[i, j] < min_column[j] then
        min_column[j] := f[i, j];
    end;
  count := 0;
  for i := 1 to n do
    for j := 1 to n do
      if (max_line[i] = min_column[j]) or (min_line[i] = max_column[j]) then begin
        inc(count);
        if count = 1 then writeln('Индексы седловых точек');
        writeln(i, ' ', j);
        sp_i[count]:= i; sp_j[count]:= j;
      end;  
      
  if count = 0 then writeln('Таких ячеек в матрице нет')
  else if count > 1 then begin
    i:= 2;
    while (sp_i[1] = sp_i[i]) and (i <= count) do
      inc(i);
    if (i <= count) and (sp_i[1] <> sp_i[i]) then begin
      check:= True;
      q:= count;
    end;
  end;
  writeln;
end;

procedure change_and_print(var f:matrix; const check:boolean; sp_i, sp_j:arr);
var i,j, max, max_i, min, min_i:integer;
    ch:matrix;
begin
  if check = True then begin
    max:= f[sp_i[1],sp_j[1]]; max_i:= sp_i[1];
    min:= f[sp_i[1],sp_j[1]]; min_i:= sp_i[1];
    for i:=2 to q do begin
      if f[sp_i[i],sp_j[i]] > max then begin
        max:= f[sp_i[i],sp_j[i]];
        max_i:= sp_i[i];
      end
      else if f[sp_i[i],sp_j[i]] <= min then begin
        min:= f[sp_i[i],sp_j[i]];
        min_i:= sp_i[i];
      end;
    end;
    if (min_i <> max_i) and (min <> max) then begin
      ch[1]:= f[max_i];
      f[max_i]:= f[min_i];
      f[min_i]:= ch[1];
      writeln('Изменённая матрица');
      for i:=1 to n do begin
        for j:=1 to n do begin
          write(f[i, j], ' ');
        end;
        writeln;
      end;
    end;
  end;
end;

begin
  writeln('Введите размер матрицы: ');
  readln(n);
  if (n < 2) or (n > 10) then writeln('Некорректное значение')
  else begin
    //init_arr_random(a, n);
    init_arr(a, n);
    print_arr(a, n);
    init_matrix(f, a, n);
    print_matrix(f, n);
    spoint(f, check);
    change_and_print(f, check, sp_i, sp_j);
  end;
end.
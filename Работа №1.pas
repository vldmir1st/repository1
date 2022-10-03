const
  S1 = 'Параметры не задают одну из окружностей';
  S2 = 'Область D не образуется';
  S3 = 'Точка является точкой пересечения графиков';
  S4 = 'Точка лежит в области D';
  S5 = 'Точка лежит на границе области D';
  S6 = 'Точка не принадлежит области D';
var
  x1, y1, r1, x2, y2, r2, x3, y3, r3, x, y, d12, d13, d23, x01, y01, r01, x02, y02, r02, x03, y03, r03, p1, p2, p3, sq_r1, sq_r2, sq_r3: integer;
begin
  writeln('Введите 3 параметра для первой окружности: ');
  read(x01,y01,r01);
  writeln('Введите 3 параметра для второй окружности: ');
  read(x02,y02,r02);
  writeln('Введите 3 параметра для третьей окружности: ');
  read(x03,y03,r03);
  if (r01 = 0) or (r02 = 0) or (r03 = 0)
    then write(S1)
  else
    if ((r01 > r02) and (r01 > r03)) or ((r02 > r01) and (r02 > r03)) or ((r03 > r01) and (r03 > r02)) then begin
      if (r01 > r02) and (r01 > r03) then begin
        x1:= x01; y1:= y01; r1:= r01;
        x2:= x02; y2:= y02; r2:= r02;
        x3:= x03; y3:= y03; r3:= r03
      end
      else
        if (r02 > r01) and (r02 > r03) then begin
          x1:= x02; y1:= y02; r1:= r02;
          x2:= x01; y2:= y01; r2:= r01;
          x3:= x03; y3:= y03; r3:= r03
        end
        else begin
          x1:= x03; y1:= y03; r1:= r03;
          x2:= x01; y2:= y01; r2:= r01;
          x3:= x02; y3:= y02; r3:= r02
        end;
      d12 := sqr(x2 - x1) + sqr(y2 - y1);
      d13 := sqr(x3 - x1) + sqr(y3 - y1);      
      d23 := sqr(x2 - x3) + sqr(y2 - y3);
      p1 := sqr(x - x1) + sqr(y - y1);
      p2 := sqr(x - x2) + sqr(y - y2);
      p3 := sqr(x - x3) + sqr(y - y3);
      sq_r1 := sqr(r1);
      sq_r2 := sqr(r2);
      sq_r3 := sqr(r3);
      if not((d13 = sqr(r1 - r3)) and (d12 = sqr(r1 - r2)) and (d23 < sqr(r2 + r3))) then 
        write(S2)
      else
        writeln('Введите координаты точки: ');
        read(x,y);
        if ((p2 = sq_r2) and (p3 = sq_r3)) or ((p1 = sq_r1) and (p3 = sq_r3)) or ((p2 = sq_r2) and (p1 = sq_r1)) then 
          write(S3)
        else
          if ((p2 < sq_r2) and (p3 < sq_r3)) or ((p1 < sq_r1) and (p2 > sq_r2) and (p3 > sq_r3)) then 
            write(S4)
          else
            if ((p1 = sq_r1) and (p2 <> sq_r2) and (p3 <> sq_r3)) or ((p2 = sq_r2) and (p1 <> sq_r1) and (p3 <> sq_r3)) or ((p3 = sq_r3) and (p2 <> sq_r2) and (p1 <> sq_r1)) then 
              write(S5)
            else
              write(S6)
    end
    else
      write(S2)
end.

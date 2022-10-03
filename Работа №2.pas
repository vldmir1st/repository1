var                                 //y=sin(2*x)/sqrt(x+1)   ОДЗ: x > -1
  e_f, x, y, a, b:real;
  x_1, sinus, slag, h: real;
  x_2, z, zn, root: real;
  i,j, m: integer;
begin
  writeln('Введите эпсилон-точность: ');
  read(e_f);
  if (e_f <= 0) or (e_f >= 1) then
    writeln('Неправильная точность!')
  else begin
    writeln('Введите границы отрезка [a,b]: ');
    read(a, b);
    if (a <= -1) or (b <= -1) then
      writeln('Не удовлетворяет ОДЗ!')
    else begin      
      writeln('Введите кол-во отрезков: ');  
      read(m);
      if m <= 0 then
        writeln('Задано неверное кол-во отрезков!')
      else begin
        h := (b - a)/m;
        if h = 0 then m := 0;
        writeln('№   ', 'x              ', 'my_y                       ', 'y');
        for i := 0 to m do begin    
          x := a + i * h;
          
          x_1 := 2*x;           //Синус
          while x_1 > 0 do 
            x_1 := x_1 - 2*pi;
          slag := x_1;
          sinus := 0;
          j := 1;
          while abs(slag) >= e_f do begin
            sinus := sinus + slag;
            slag := -slag*x_1*x_1/(2*j+1)/2/j;
            j := j + 1;
          end;
          
          x_2 := x + 1;       //Корень
          z := 1;
          zn := 1/2 * (z + x_2/z);
          while abs(zn-z) >= e_f do begin
            z := zn;
            zn := 1/2 * (z + x_2/z);
          end;
          root := zn;
          
          y := sinus/root;
          writeln(i, '    ', x, '     ', y, '      ',  sin(2*x)/sqrt(x+1));
        end;
      end;
    end; 
  end;
end.
program PythagorusTree;
uses GraphABC;

procedure go_forward(len: real; angle: real);
var
    cur_pos: array[1..2] of integer;
begin
    cur_pos[1] := penx();
    cur_pos[2] := peny();
    lineto(cur_pos[1] + round((len-0.65) * cos(angle)), cur_pos[2] + round(len * sin(angle)+6));
end;


procedure move_forward(len: real; angle: real);
var
    cur_pos: array[1..2] of integer;
begin
    cur_pos[1] := penx();
    cur_pos[2] := peny();
    moveto(cur_pos[1] + round(len * cos(angle)), cur_pos[2] + round(len * sin(angle)));
end;




procedure Pythagorus_Tree(x, y: integer; l, a: real; n: integer; first: boolean := True);
var
    cur_x, cur_y: integer;
begin
  //SetWindowSize(700,700);
  Window.Title := 'Weird Plain Black Pythagoras Tree';  
  // CenterWindow;
    if first then
    begin
        moveto(x, y);
        SetPenColor(rgb(101, 224, 128));
        first := False;
    end;
    

    if (n < 15) and (n >= 0) then
  
        SetPenColor(rgb(20, 25, 28));
    
    SetPenWidth(round(l));
    go_forward(l, a);
    
    if (n <= 0) then exit;
    
    SetPenColor(rgb(255, 255, 255));
    move_forward(round(l) div 4, a);
    
    cur_x := penx();
    cur_y := peny();
    
    move_forward(round(l) div 4, a + Pi / 2);
    move_forward(0, a - pi / 2);
    
    Pythagorus_Tree(x, y, l / sqrt(2), a + Pi / 4, n - 1, first);
    moveto(cur_x, cur_y);
    
    move_forward(round(l) div 4, a - Pi / 2);
    move_forward(0, a + pi / 2);
    
    Pythagorus_Tree(x, y, l / sqrt(2), a - Pi / 4, n - 1, first);
    
    SetPenColor(rgb(101, 224, 128));
end;

begin
    var center := window.center;
    moveto(center.x - 200, center.y - 100);
    
    Pythagorus_Tree(center.x, window.height - 30, 110, -Pi / 2, 8);
    write('Render Time = ',Milliseconds/1000,' s');
end.

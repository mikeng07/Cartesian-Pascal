Program Program1(output);

uses
  SysUtils, Math;

//function to find quadrant
function Quadrant(x,y :Integer) : Integer;
begin
  //check if it is on origin
  if (x = 0) and (y = 0) then
    Quadrant:=0
  else if (x = 0) then
    Quadrant:=6
  else if (y = 0) then
    Quadrant:=5
  else if (x > 0) and (y > 0) then
    Quadrant:=1
  else if (x < 0) and (y > 0) then
    Quadrant:=2
  else if (x < 0) and (y < 0) then
    Quadrant:=3
  else
    Quadrant:=4
end;


//function to find the distant between 2 points
function Distance(x1,y1,x2,y2 : Integer) : real;
begin
 Distance:= sqrt(sqr(x2-x1) + sqr(y2-y1));
end;


// Procedure to read coords from file
procedure Read(filename: string; var ints: array of integer; var count:integer);
var
  f: text;
  i: integer;
  x1,y1,x2,y2: integer;
begin
  assign(f, filename);
  reset(f);
  
  // Read first and second coords
  i:= 1;
  while not eof(f) do
  begin 
    
    readln(f, x1, y1, x2, y2); 
    ints[i] := x1;
    ints[i+1] := y1;
    ints[i+2] := x2;
    ints[i+3] := y2; 
    i := i+4;
   
  end;
  
  count := i-1;
  close(f);
end;


//procedure for output
procedure Output( var ints: array of integer; var count:integer);
var
  str : String = '';
  str2 : String = '';
  distanceStr:string = '';
  x1,y1,x2,y2, i: integer;
  totalDistance : real = 0.0;



begin

  i := 1;
    while i < count do
    begin
    x1 := ints[i];
    y1 := ints[i+1];
    x2 := ints[i+2];
    y2 := ints[i+3];
    
    //This is the 1st pair
    if ((Quadrant(x1,y1)) = 0) then
        str :=' lies on the origin, '
    else if ((Quadrant(x1,y1)) = 1) then
        str := ' lies in quadrant I, '
    else if ((Quadrant(x1,y1)) = 2) then
        str := ' lies in quadrant II, '
    else if ((Quadrant(x1,y1)) = 3) then
        str := ' lies in quadrant III, '
    else if ((Quadrant(x1,y1)) = 4) then
        str := ' lies in quadrant IV, '
    else if ((Quadrant(x1,y1)) = 5) then
        str := ' lies x-axis, '
    else 
        str := ' lies on y-axis, ';

    //Now this is for the 2nd pair
    if ((Quadrant(x2,y2)) = 0) then
        str2 :=' lies on the origin, '
    else if ((Quadrant(x2,y2)) = 1) then
        str2 := ' lies in quadrant I, '
    else if ((Quadrant(x2,y2)) = 2) then
        str2 := ' lies in quadrant II, '
    else if ((Quadrant(x2,y2)) = 3) then
        str2 := ' lies in quadrant III, '
    else if ((Quadrant(x2,y2)) = 4) then
        str2 := ' lies in quadrant IV, '
    else if ((Quadrant(x2,y2)) = 5) then
        str2 := ' lies x-axis, '
    else 
        str2 := ' lies on y-axis, ';
    
    distanceStr :=Format('%1.3f',[Distance(x1,y1,x2,y2)]);
    writeln('(' , x1, ',', y1,')', str, '(' , x2, ',', y2,')', str2, 'distance is ', distanceStr);
    writeln();
    totalDistance += Distance(x1,y1,x2,y2);
    i := i + 4; 
       
    end;

    writeln(Round(count/4), ' sets of points were processed');
    writeln('Average distance was ',Format('%1.3f',[totalDistance/Round(count/4)] ));

end;




// Main
var 
  myints: array [1..100] of integer;
  count: integer = 0 ;
begin

    Read('points.dat', myints,count);
    Output(myints,count);
  
end.    


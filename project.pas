Program Program1(output);


// Procedure to read coords from file
procedure Read(filename: string; var x1, y1, x2, y2: Integer);
var
  f: text;
begin
  assign(f, filename);
  reset(f);
  
  // Read first and second coords
  readln(f, x1, y1, x2, y2); 
  
  close(f);
end;


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



//procedure for output
procedure Output(x1,y1,x2,y2: Integer);
var
  str : String = '';
  str2 : String = '';
begin
//This is the 1st pair
    if ((Quadrant(x1,y1)) = 0) then
        str +=' lies on the origin, '
    else if ((Quadrant(x1,y1)) = 1) then
        str += ' lies in quadrant I, '
    else if ((Quadrant(x1,y1)) = 2) then
        str += ' lies in quadrant II, '
    else if ((Quadrant(x1,y1)) = 3) then
        str += ' lies in quadrant III, '
    else if ((Quadrant(x1,y1)) = 4) then
        str += ' lies in quadrant IV, '
    else if ((Quadrant(x1,y1)) = 5) then
        str += ' lies x-axis, '
    else 
        str += ' lies on y-axis, ';

    //Now this is for the 2nd pair
    if ((Quadrant(x2,y2)) = 0) then
        str2 +=' lies on the origin, '
    else if ((Quadrant(x2,y2)) = 1) then
        str2 += ' lies in quadrant I, '
    else if ((Quadrant(x2,y2)) = 2) then
        str2 += ' lies in quadrant II, '
    else if ((Quadrant(x2,y2)) = 3) then
        str2 += ' lies in quadrant III, '
    else if ((Quadrant(x2,y2)) = 4) then
        str2 += ' lies in quadrant IV, '
    else if ((Quadrant(x2,y2)) = 5) then
        str2 += ' lies x-axis, '
    else 
        str += ' lies on y-axis, ';
    writeln('(' , x1, ',', y1,')', str, '(' , x2, ',', y2,')', str2, 'distance is', Distance(x1,y1,x2,y2));
end;

// Main
var 
  x1, y1, x2, y2: Integer;
begin
  Read('points.dat', x1, y1, x2, y2);
   
  
// Print coords
//   writeln('Set 1: ', x1, ',', y1);
//   writeln('Set 2: ', x2, ',', y2);
//   writeln(Quadrant(x2,y2));

    Output(x1,y1,x2,y2)
end.


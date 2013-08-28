void setup(){
  size (1024, 768);
}
void draw(){
 

ellipse((mouseX()+ 10)*width/20, 
    (mouseY()+10)*height/40, 
    map(powADrums, 0, 0.3, 100, 110), 
    map(powADrums, 0, 0.3, 100, 120))
    ;
}

PImage img;
float x;
void setup(){
 size(500,500);
 img=loadImage("song cover.png"); 
}

void draw(){
 background(255);
 image(img,x,0,500,500);
 x+=0.01;
}

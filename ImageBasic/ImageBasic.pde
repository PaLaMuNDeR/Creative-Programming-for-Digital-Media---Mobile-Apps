PImage imgA;
PImage imgD;
PImage imgM;

void setup(){
 background(0);
 imgA = loadImage("anev.jpg");
 imgD = loadImage("dani.jpg");
 imgM = loadImage("mecki.jpg");
 size(1024, 768);
}

void draw(){
  imageMode(CENTER);
  int imgAheight = 300;
  int imgAwidth = 300*imgA.width/imgA.height;
  int imgDheight = 300;
  int imgDwidth = 300*imgD.width/imgD.height;
  int imgMheight = 300*imgM.height/imgM.width;
  int imgMwidth = 300;
  int margin = 20;
  image(imgA, width/2 + margin - imgAwidth/2,
  margin/2 + imgAheight/2, imgAwidth, imgAheight);
  
  image(imgD, width/2 + 2*margin + imgDwidth/2,
                margin/2 + imgDheight/2, imgDwidth, imgDheight);
  image(imgM,  width/2,
               margin + imgAheight + imgMheight/2,
               imgMwidth, imgMheight);
               
}

void mousePressed(){
   int imgMheight = 300*imgM.height/imgM.width;
  int imgMwidth = 300;
  
  image(imgM,  mouseX,mouseY,
               imgMwidth, imgMheight);
}


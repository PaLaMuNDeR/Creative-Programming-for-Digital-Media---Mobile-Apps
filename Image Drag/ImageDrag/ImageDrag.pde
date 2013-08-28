PImage imgA;
PImage imgD;
PImage imgM;
PImage TV;
int tvx, tvy;

int margin = 20;

float current_weight = 2;
float target_weight = 2;

float current_alpha = 0;
float target_alpha = 0;

void setup() {
  background(0);
  
  imgA = loadImage("anev.jpg");
  imgD = loadImage("dani.jpg");
  imgM = loadImage("mecki.jpg");
  TV = loadImage("TV.png");

  size(1024, 768);
}

void draw() {

  imageMode(CENTER);
  float imgAheight = 300;
  float imgAwidth = 300*imgA.width/imgA.height;
  float imgAsize = imgAheight*imgAwidth;

  int imgDheight = 300;
  int imgDwidth = 300*imgD.width/imgD.height;
  int imgDsize = imgDheight*imgDwidth;

  int imgMheight = 300*imgM.height/imgM.width;
  int imgMwidth = 300;
  int imgMsize = imgMheight*imgMwidth;

float Ax = width/2 + margin - imgAwidth/2;
float Ay = margin/2 + imgAheight/2;


image(TV, width/2, TV.height/2+margin, TV.width, TV.height);

//  image(imgD, width/2 + 2*margin + imgDwidth/2,
//                margin/2 + imgDheight/2, imgDwidth, imgDheight);
//  image(imgM,  width/2,
//               margin + imgAheight + imgMheight/2,
//               imgMwidth, imgMheight);
//               image(imgA, Ax, Ay, imgAwidth, imgAheight);

}

void mouseDragged(){
  float imgAheight = 300;
  float imgAwidth = 300*imgA.width/imgA.height;
  float imgAsize = imgAheight*imgAwidth;

  int imgDheight = 300;
  int imgDwidth = 300*imgD.width/imgD.height;
  int imgDsize = imgDheight*imgDwidth;

  int imgMheight = 300*imgM.height/imgM.width;
  int imgMwidth = 300;
  int imgMsize = imgMheight*imgMwidth;

float Ax = width/2 + margin - imgAwidth/2;
float Ay = margin/2 + imgAheight/2;

if(mouseX > Ax-imgAsize/2 && mouseX < Ax+imgAsize/2 &&
   mouseY > Ay-imgAsize/2 && mouseY < Ay+imgAsize/2) {
    cursor(HAND);
      Ax = constrain(Ax, mouseX, 2);
      Ay = constrain(Ay, mouseY, 2);
  }
        image (imgA, Ax, Ay, imgAwidth, imgAheight);

//   else{
//     cursor(ARROW);
//   }





}


//The following code is made by Martin Anev (sf, Bulgaria) MartiAnev@gmail.com

Maxim maxim;
Accelerometer accel;
PFont arial;

AudioPlayer ADrums;
AudioPlayer ADrums2;
AudioPlayer AGuitar;
AudioPlayer ATamb;
AudioPlayer ATri;
AudioPlayer ATrump;

//images
PImage imgDrums;
PImage imgDrums2;
PImage imgGuitar;
PImage imgTamb;
PImage imgTri;
PImage imgTrump;

//for music
float powADrums;            //power of music
float powADrums2;
float powAGuitar;
float powATamb;
float powATri;
float powATrump;

//checks if instrument is playing
boolean ADrumsplaying = false;  
boolean ADrums2playing = false;
boolean AGuitarplaying = false;
boolean ATambplaying = false;
boolean ATriplaying = false;
boolean ATrumpplaying = false;

//for the waves
float theta=0.0;       //Start angle at 0
int xspacing=10;       //How far apart should each horizontal location be spaced
float amplitude = 7.0; //Height of wave
float dx;              //value for incrementing X, a function of period(speed) and xspacing
float[] yvalues;       //Using an array to store height values for the wave
int w;                 //width of enite wave
float period = 500;    //How many pixels before the wave repeats


void setup()
{
  maxim = new Maxim(this);
  // load sounds of:
  // ADrums;
  // ADrums2;
  // AGuitar;
  // ATamb;
  // ATri;
  // ATrump;
  loadInstrumentsAudio();
  loadInstrumentsPics();
  colorMode(HSB);
  noStroke();
  smooth();
  rectMode(CENTER);

  accel = new Accelerometer();
  arial = loadFont("arial.vlw");
  textFont(arial, 30);

  //for the wave
  w=width+16;
  yvalues = new float[w/xspacing];
}

void draw()
{  
  // set the background
  // colour based on the 3 accelerometer values
  int r, g, b;
  r = (int) (accel.getX() + 10) * 255/20;
  g = (int) (accel.getY() + 10) * 255/20;
  b = (int) (accel.getZ() + 10) * 255/20;

  //Average power of music
  float powADrums = ADrums.getAveragePower(); 
  float powADrums2 = ADrums2.getAveragePower();
  float powAGuitar = AGuitar.getAveragePower();
  float powATamb = ATamb.getAveragePower();
  float powATri = ATri.getAveragePower();
  float powATrump = ATrump.getAveragePower();

  //resizing pictures
  int imgDrumsH = 100;
  int imgDrumsW = 100*imgDrums.width/imgDrums.height;
  int imgDrums2H = 100;
  int imgDrums2W =100*imgDrums2.width/imgDrums2.height;
  int imgGuitarH = 100;
  int imgGuitarW = 100*imgGuitar.width/imgGuitar.height;
  int imgTambH = 100;
  int imgTambW = 100*imgTamb.width/imgTamb.height;
  int imgTriH = 100;
  int imgTriW = 100*imgTri.width/imgTri.height;
  int imgTrumpH = 100;
  int imgTrumpW = 100*imgTrump.width/imgTrump.height;

  background(r, g, b/4);

  //draw bubble moving with accelerometer and 
  //bouncing with the power of music
  fill(r, g, b);

  if (ADrumsplaying) {
    ellipse((-accel.getX()+ 10)*width/20, 
    (accel.getY()+10)*height/40, 
    map(powADrums, 0, 0.3, 100, 110), 
    map(powADrums, 0, 0.3, 100, 120));
  }
  if (ADrums2playing) {
    ellipse((-accel.getX()+ 10)*width/20, 
    (accel.getY()+10)*height/40, 
    map(powADrums2, 0, 0.3, 100, 110), 
    map(powADrums2, 0, 0.3, 100, 120));
  }

  if (AGuitarplaying) {
    ellipse((-accel.getX()+ 10)*width/20, 
    (accel.getY()+10)*height/40, 
    map(powAGuitar, 0, 0.3, 100, 110), 
    map(powAGuitar, 0, 0.3, 100, 120));
  }
  if (ATambplaying) {
    ellipse((-accel.getX()+ 10)*width/20, 
    (accel.getY()+10)*height/40, 
    map(powATamb, 0, 0.3, 100, 110), 
    map(powATamb, 0, 0.3, 100, 120));
  }
  if (ATriplaying) {
    ellipse((-accel.getX()+ 10)*width/20, 
    (accel.getY()+10)*height/40, 
    map(powATri, 0, 0.3, 100, 110), 
    map(powATri, 0, 0.3, 100, 120));
  }
  if (ATrumpplaying) {
    ellipse((-accel.getX()+ 10)*width/20, 
    (accel.getY()+10)*height/40, 
    map(powATrump, 0, 0.3, 100, 110), 
    map(powATrump, 0, 0.3, 100, 120));
  }
  else {
    ellipse((-accel.getX()+ 10)*width/20, 
    (accel.getY()+10)*height/40, 100, 100);
  }

  // set the speed of the player with the 
  // accelerometer
  float speed = map(accel.getX(), -10, 10, 1.5, 0.3);
  ADrums.speed(speed);
  ADrums2.speed(speed);
  AGuitar.speed(speed);
  ATamb.speed(speed);
  ATri.speed(speed);
  ATrump.speed(speed);
  float songvolume = map(accel.getY(), -10, 10, 0.03, 1);
  ADrums.volume(songvolume);
  ADrums2.volume(songvolume);
  AGuitar.volume(songvolume);
  ATamb.volume(songvolume);
  ATri.volume(songvolume);
  ATrump.volume(songvolume);

  //dx for the wave
  dx = (TWO_PI / speed) * xspacing;

  // display the functions of the bubble
  // on the screen using the text function
  fill(255);
  text("Vol-", width/2 - 50, 30);
  text("Vol+", width/2 - 50, height/2 -30);
  text("Speed -", 0, height/4);
  text("Speed +", width-130, height/4);
  if (!ADrumsplaying && !ADrums2playing &&!AGuitarplaying &&
      !ATriplaying && !ATambplaying && !ATrumpplaying) {
    text("Touch an instrument to play", width/4 , height/2 + 25);
  }

  //draw the lower part of the screen
  rectMode(CORNER);
  fill(0, 100);
  rect(0, height/2, width, height/2);
  imageMode(CENTER);

  //X,Y for pics
  int imgDrumsx = width/4;
  int imgDrumsy = 100 + height/2;
  int imgDrums2x = width/4;
  int imgDrums2y = 300 + height/2;
  int imgGuitarx = width/4;
  int imgGuitary = 500 + height/2;
  int imgTambx = width/4 + width/2;
  int imgTamby = 100 + height/2;
  int imgTrix = width/4 + width/2;
  int imgTriy = 300 + height/2;
  int imgTrumpx = width/4 + width/2;
  int imgTrumpy = 500 + height/2;
  
  image (imgDrums, imgDrumsx, imgDrumsy, imgDrumsW, imgDrumsH);
  image (imgDrums2, imgDrums2x, imgDrums2y, imgDrums2W, imgDrums2H);
  image (imgGuitar, imgGuitarx, imgGuitary, imgGuitarW, imgGuitarH);
  image (imgTamb, imgTambx, imgTamby, imgTambW, imgTambH);
  image (imgTri, imgTrix, imgTriy, imgTriW, imgTriH);
  image (imgTrump, imgTrumpx, imgTrumpy, imgTrumpW, imgTrumpH);


  //draw the wave
  if (ADrumsplaying || ADrums2playing || AGuitarplaying ||
  ATambplaying || ATriplaying || ATrumpplaying)
  {
    theta += 0.02;
    float x=theta;
    for (int i=0; i<yvalues.length; i++) {
      yvalues [i]=sin(x)*amplitude;
      x+=dx;
    }
    noStroke();
    fill(0);
    for (int p=0; p<yvalues.length; p++) {
      ellipse(p*xspacing, height/2+yvalues[p], 16, 16);
    }
  }
}



//interactions with pressing
void mousePressed() {
  // Drums.cue(0);
  if (mouseX > width/4 - 50 &&
    mouseX < width/4 + 50 &&
    mouseY > 100 + height/2 - 50 &&
    mouseY < 100 + height/2 + 50) {    
    ADrumsplaying = !ADrumsplaying;
    if (ADrumsplaying) {
      ADrums.play();
      //      ADrums2.play();
      //      AGuitar.play();
      //      ATamb.play();
      //      ATri.play();
      //      ATrump.play();
    } 
    else {
      ADrums.stop();
      //      ADrums2.stop();
      //      AGuitar.stop();
      //      ATamb.stop();
      //      ATri.stop();
      //      ATrump.stop();
      powADrums=0;
    }
  }

  if (mouseX > width/4 - 50 &&
    mouseX < width/4 + 50 &&
    mouseY > 300 + height/2 - 50 &&
    mouseY < 300 + height/2 + 50) {    
    ADrums2playing = !ADrums2playing;
    if (ADrums2playing) {
      ADrums2.play();
    } 
    else {
      ADrums2.stop();
      powADrums=0;
    }
  }

  if (mouseX > width/4 - 50 &&
    mouseX < width/4 + 50 &&
    mouseY > 500 + height/2 - 50 &&
    mouseY < 500 + height/2 + 50) {    
    AGuitarplaying = !AGuitarplaying;
    if (AGuitarplaying) {
      AGuitar.play();
    } 
    else {
      AGuitar.stop();
      powAGuitar=0;
    }
  }

  if (mouseX > width/2 + width/4 - 50 &&
    mouseX < width/2 + width/4 + 50 &&
    mouseY > 100 + height/2 - 50 &&
    mouseY < 100 + height/2 + 50) {    
    ATambplaying = !ATambplaying;
    if (ATambplaying) {
      ATamb.play();
    } 
    else {
      ATamb.stop();
      powATamb=0;
    }
  }

  if (mouseX > width/2 + width/4 - 50 &&
    mouseX < width/2 + width/4 + 50 &&
    mouseY > 300 + height/2 - 50 &&
    mouseY < 300 + height/2 + 50) {    
    ATriplaying = !ATriplaying;
    if (ATriplaying) {
      ATri.play();
    } 
    else {
      ATri.stop();
      powATri=0;
    }
  }


  if (mouseX > width/2 + width/4 - 50 &&
    mouseX < width/2 + width/4 + 50 &&
    mouseY > 500 + height/2 - 50 &&
    mouseY < 500 + height/2 + 50) {    
    ATrumpplaying = !ATrumpplaying;
    if (ATrumpplaying) {
      ATrump.play();
    } 
    else {
      ATrump.stop();
      powATrump=0;
    }
  }
}


void loadInstrumentsAudio() {
  ADrums = maxim.loadFile("congo_drum.wav");
  ADrums.setAnalysing(true);
  ADrums.setLooping(true);

  ADrums2 = maxim.loadFile("Drum.wav");
  ADrums2.setAnalysing(true);
  ADrums2.setLooping(true);

  AGuitar = maxim.loadFile("Guitar.wav");
  AGuitar.setAnalysing(true);
  AGuitar.setLooping(true);

  ATamb = maxim.loadFile("Tambourine.wav");
  ATamb.setAnalysing(true);
  ATamb.setLooping(true);

  ATri = maxim.loadFile("triangle.wav");
  ATri.setAnalysing(true);
  ATri.setLooping(true);

  ATrump = maxim.loadFile("Trumpet.wav");
  ATrump.setAnalysing(true);
  ATrump.setLooping(true);
}

void loadInstrumentsPics() {

  imgDrums = loadImage("Drum-256.png");
  imgDrums2 = loadImage("Drums2.png");
  imgGuitar= loadImage("guitar.png");
  imgTamb= loadImage("tambourine.png");
  imgTri= loadImage("triangle.png");
  imgTrump= loadImage("Trump.png");
}


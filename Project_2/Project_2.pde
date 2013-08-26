//if the Music Control menu is shown 
//the bubble is onlty at the top half of the screen


//Accelerometer 
Accelerometer accel;

//Images
PImage imgDrums;
PImage imgDrums2;
PImage imgGuitar;
PImage imgTamb;
PImage imgTri;
PImage imgTrump;


//Music 
Maxim maxim;
AudioPlayer sample1;
AudioPlayer sample2; 
AudioPlayer sample3; 
AudioPlayer sample4;
AudioPlayer ADrums;
AudioPlayer ADrums2;
AudioPlayer AGuitar;
AudioPlayer ATamb;
AudioPlayer ATri;
AudioPlayer ATrump;

boolean[] track1;
boolean[] track2;
boolean[] track3;
boolean[] track4;

int playhead;

int numBeats;
int currentBeat;
int buttonWidth;
int buttonHeight;


  
  //power of music
  float powSample1;
  float powSample2;
  float powSample3;
  float powSample4;
  float powADrums;            
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
  

PImage backgroundImage; 

boolean showGUI=false;
boolean showGUI2=false;

//Buttons
Button dr;
Button dr2;
Button gu;
Button ta;
Button tri;
Button tru;

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
  colorMode(HSB);
  noStroke();
  smooth();

  //Accelerometer
  accel = new Accelerometer();
  // arial = loadFont("arial.vlw");
  //  textFont(arial, 30);
  
  //music 
  numBeats = 16;
  currentBeat = 0;
  buttonWidth = width/numBeats;
  buttonHeight = height/8;

  maxim = new Maxim(this);
  loadMusic(); // loads the files
  loadInstrumentsPics();//loads the pictures of the instruments
  
  // set up the sequences
  track1 = new boolean[numBeats];
  track2 = new boolean[numBeats];
  track3 = new boolean[numBeats];
  track4 = new boolean[numBeats];
  //backgroundImage = loadImage("brushedm.jpg");
  frameRate(60);
  
  //for the wave
  w=width+16;
  yvalues = new float[w/xspacing];
}

void draw()
{
  //setting the background
  // colour based on the 3 accelerometer values
  int r,g,b;
  r = (int) (accel.getX() + 10) * 255/20;
  g = (int) (accel.getY() + 10) * 255/20;
  b = (int) (accel.getZ() + 10) * 255/20;  
  background(r+10, g+10, b/2);
  
  //Average power of music
  float powSample1 = sample1.getAveragePower();
  float powSample2 = sample2.getAveragePower();
  float powSample3 = sample3.getAveragePower();
  float powSample4 = sample4.getAveragePower();
  
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
  
  //draw bubble moving with accelerometer and 
  //bouncing with the power of music
  settingBubble();


  
  
  //displays the text for navigating the bubble
  displayText();
 // displayInstruments();  

  imageMode(CENTER);
  //X,Y for buttons
  int imgDrumsx = width/4;
  int imgDrumsy = - 200 + height/2;
  int imgDrums2x = width/4;
  int imgDrums2y = - 400 + height/2;
  int imgGuitarx = width/4;
  int imgGuitary = - 600 + height/2;
  int imgTambx = width/6 + width/2;
  int imgTamby = - 200 + height/2;
  int imgTrix = width/6 + width/2;
  int imgTriy = - 400 + height/2;
  int imgTrumpx = width/6 + width/2;
  int imgTrumpy = - 600 + height/2;
  
  //Buttons
  dr = new Button ("Drums", imgDrumsx, imgDrumsy, imgDrumsW, imgDrumsH);
  dr.setInactiveImage(imgDrums);
  dr2 = new Button ("Drums 2", imgDrums2x, imgDrums2y, imgDrums2W, imgDrums2H);
  dr2.setInactiveImage(imgDrums2);
  gu = new Button ("Guitar", imgGuitarx, imgGuitary, imgGuitarW, imgGuitarH);
  gu.setInactiveImage(imgGuitar);
  ta = new Button ("Tamborine", imgTambx, imgTamby, imgTambW, imgTambH);
  ta.setInactiveImage(imgTamb);
  tri = new Button ("Triangle", imgTrix, imgTriy, imgTriW, imgTriH);
  tri.setInactiveImage(imgTri);
  tru = new Button ("Trumpet", imgTrumpx, imgTrumpy, imgTrumpW, imgTrumpH);
  tru.setInactiveImage(imgTrump);
  
 if(showGUI)
 {//show the  music controller
   line(0, height/2, width, height/2);
   stroke(0);
   rectMode(CORNER);
   fill(0, 100);
   rect(0, height/2, width, height/2);
   displayController();
 }
 if(showGUI2)
 {//show the instruments
   stroke(0);
   line (0, height/2, width, height/2);
   rectMode(CORNER);
   fill(0, 100);
   rect(0, 0, width, height/2);
   imageMode(CENTER);  
   
    dr.display();
    dr2.display();
    gu.display();
    ta.display();
    tri.display();
    tru.display();
  }
 if(!showGUI && !showGUI2)   //main view
  {
    displayBottomPanel();    //the bottom panel
    displayUpperPanel();  //the upper panel
    
  }
  
 playhead ++;
 if (playhead % 4 == 0)
 {
   if (track1[currentBeat]) // track1 wants to play on this beat
    {
      sample1.cue(0);
      sample1.play();
    }
    if (track2[currentBeat]) {
      sample2.cue(0);
      sample2.play();
    }
    if (track3[currentBeat]) {
      sample3.cue(0);  
      sample3.play();
    }
    if (track4[currentBeat]) {
      sample4.cue(0);
      sample4.play();
    }
    // move to the next beat ready for next time
    currentBeat++;
    if (currentBeat >= numBeats)
      currentBeat = 0;
  }
  
  //dx for the wave
  float speed1 = map(accel.getX(), -10, 10, 1.5, 0.3);
  dx = (TWO_PI / speed1) * xspacing;  
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
      if(!showGUI && !showGUI2)
      ellipse(p*xspacing, (buttonHeight/2)+yvalues[p], 16, 16);
      if(showGUI2)
      ellipse(p*xspacing, (height/2)+yvalues[p], 16, 16);
     }
  }
}

void mousePressed()
{
  if(showGUI)//if showing the bottom menu
  { 
     if(mouseY>height/2) //if interacting with the bottom menu
     {
         int index = (int) Math.floor(mouseX*numBeats/width);   
         int track = (int) Math.floor((height/2 +mouseY)/ buttonHeight)-8;
         println("index "+index);
         println("track "+track);
         if (track == 0)
           track1[index] = !track1[index];
         if (track == 1)
           track2[index] = !track2[index];
         if (track == 2)
           track3[index] = !track3[index];
          if (track == 3)
           track4[index] = !track4[index];
   }
   else{
         println("Changing the GUI");
         showGUI=!showGUI;
        }
  }
  
  if(showGUI2)//if showing the upper menu
  {
      if(mouseY<height/2)//if interacting with the upper menu
      {
         if(dr.mousePressed())
          { 
              ADrumsplaying= !ADrumsplaying;
              if(ADrumsplaying)
              {
               ADrums.cue(0);
               ADrums.play();
               }
              else
                  {
                      ADrums.stop();
                      powADrums=0;
                    }
           }
                 
           if(dr2.mousePressed())
            { 
              ADrums2playing= !ADrums2playing;
              if(ADrums2playing)
               {
                 ADrums2.cue(0);
                 ADrums2.play();
               }
               else
                {
                  ADrums2.stop();
                  powADrums2=0;
                }
              }
        
          if(gu.mousePressed())
            { 
              AGuitarplaying = !AGuitarplaying;
              if (AGuitarplaying) {
                  AGuitar.play();
              } 
              else {
                    AGuitar.stop();
                    powAGuitar=0;
              }
            }
  
          if(ta.mousePressed())
          {
            ATambplaying = !ATambplaying;
            if (ATambplaying) {
                                ATamb.play();
            } 
            else {
                  ATamb.stop();
                  powATamb=0;
            }
          }
          if(tri.mousePressed())
          {  
            ATriplaying = !ATriplaying;
            if (ATriplaying) {
                              ATri.play();
             } 
            else {
                    ATri.stop();
                    powATri=0;
            }
          }
  
          if(tru.mousePressed())
          {
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
  
    else {
           println("Changing the GUI");
           showGUI2=!showGUI2;
    }
  }
}

void mouseReleased(){
  if(!showGUI)//opens the bottom menu
  if(mouseY>= height-buttonHeight/2)
  {
    println("Changing the GUI");
    showGUI=!showGUI;
  }
  if(!showGUI2)//opens the upper menu
  if(mouseY<=buttonHeight/2)
  {
    println("Changing the GUI");
    showGUI2=!showGUI2;}
}



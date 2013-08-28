//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

Maxim maxim;
AudioPlayer sample1;
AudioPlayer sample2; 
AudioPlayer sample3; 
AudioPlayer sample4;

boolean[] track1;
boolean[] track2;
boolean[] track3;
boolean[] track4;

int playhead;

int numBeats;
int currentBeat;
int buttonWidth;
int buttonHeight;

PImage backgroundImage; 


void setup() {
  size(1024, 768);
  numBeats = 16;
  currentBeat = 0;
  buttonWidth = width/numBeats;
  buttonHeight = height/12;

  maxim = new Maxim(this);
  sample1 = maxim.loadFile("bd1.wav");
  sample1.volume(0.5);
  sample1.setLooping(false);
  sample2 = maxim.loadFile("sn1.wav");
  sample2.setLooping(false);
  sample2.volume(1);
  sample3 = maxim.loadFile("hh1.wav");
  sample3.volume(0.5);
  sample3.setLooping(false);
  sample4 = maxim.loadFile("sn2.wav");
  sample4.setLooping(false);

  // set up the sequences
  track1 = new boolean[numBeats];
  track2 = new boolean[numBeats];
  track3 = new boolean[numBeats];
  track4 = new boolean[numBeats];
  backgroundImage = loadImage("brushedm.jpg");
  frameRate(60);
  
  // test the timing
//  for (int i=0;i<track3.length;i++){
//    track2[i] = true;
//    track3[i] = true;
//  }
  
}

void draw() {
  image(backgroundImage, 0, 0);
  //background(0);

  stroke(255);
  for (int i = 0; i < 5; i++)
    line(0, 500+(i*height/12), width, 500+(i*height/12));
  for (int i = 0; i < numBeats + 1; i++)
    line(i*width/numBeats, 500, i*width/numBeats, 500+(4*height/12));


  // draw a moving square showing where the sequence is 
  fill(0, 0, 200, 120);
  rect(currentBeat*buttonWidth, 500, buttonWidth, height);

  for (int i = 0; i < numBeats; i++)
  {
    noStroke();
    fill(200, 0, 0);

    if (track1[i])
      rect(i*buttonWidth, 500+(0*buttonHeight), buttonWidth, buttonHeight);
    if (track2[i])
      rect(i*buttonWidth, 500+(1*buttonHeight), buttonWidth, buttonHeight);
    if (track3[i])
      rect(i*buttonWidth, 500+(2*buttonHeight), buttonWidth, buttonHeight);
    if (track4[i])
      rect(i*buttonWidth, 500+(3*buttonHeight), buttonWidth, buttonHeight);
  }

  playhead ++;
  //if (frameCount%4==0) {// 4 frames have passed check if we need to play a beat
  if(playhead % 4 == 0){
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
}

void mousePressed() {
  int index = (int) Math.floor(mouseX*numBeats/width);   
  int track = (int) Math.floor((mouseY-500)*(12/(float)height));

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


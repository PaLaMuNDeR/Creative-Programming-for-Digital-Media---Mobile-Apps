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
  //size(1024, 750);
  numBeats = 16;
  currentBeat = 0;
  buttonWidth = width/numBeats;
  buttonHeight = height/4;

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
  //backgroundImage = loadImage("brushedm.jpg");
  frameRate(120);

  // test the timing with this code
  // we found the Processing framerate to be quite unreliable 
  // on Android...the Desktop Java one was more reliable
  // this is interesting: 
  //http://www.gamasutra.com/view/feature/171774/getting_high_precision_timing_on_.php?page=3
  // you might want to look into creating your own thread 
  // to get the timing more accurate:
  // http://developer.android.com/reference/java/lang/Thread.html
  //  for (int i=0;i<track3.length;i++){
  //    track2[i] = true;
  //    track3[i] = true;
  //  }
}

void draw() {
  //image(backgroundImage, 0, 0);
  background(0);

  stroke(255);
  for (int i = 0; i < 5; i++)
    line(0, i * buttonHeight, width, i*buttonHeight);
  for (int i = 0; i < numBeats + 1; i++)
    line(i*width/numBeats, 0, i*width/numBeats, height);


  // draw a moving square showing where the sequence is 
  fill(0, 0, 200, 120);
  rect(currentBeat*buttonWidth, 0, buttonWidth, height);

  for (int i = 0; i < numBeats; i++)
  {
    noStroke();
    fill(200, 0, 0);

    if (track1[i])
      rect(i*buttonWidth, (0), buttonWidth, buttonHeight);
    if (track2[i])
      rect(i*buttonWidth, (1*buttonHeight), buttonWidth, buttonHeight);
    if (track3[i])
      rect(i*buttonWidth, (2*buttonHeight), buttonWidth, buttonHeight);
    if (track4[i])
      rect(i*buttonWidth, (3*buttonHeight), buttonWidth, buttonHeight);
  }

  playhead ++;
  //if (frameCount%4==0) {// 4 frames have passed check if we need to play a beat
  if (playhead % 4 == 0) {
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
  int track = (int) Math.floor(mouseY / buttonHeight);

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


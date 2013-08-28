//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;
WavetableSynth waveform;
int playhead;
int[] notes = {
  0, 0, 0, 12, 12, 12, 10, 10, 10, 7, 7, 7, 6, 6, 3, 3
};
boolean playit=false;

float fc, res, attack, release;
Slider dt, dg, a, r, f, q;
MultiSlider seq;

float[] wavetable = new float[514]; 

void setup()
{
  size(600, 400);
  maxim = new Maxim(this);
  waveform = maxim.createWavetableSynth(128);
  // name, value, min, max, pos.x, pos.y, width, height
  dt = new Slider("delay time", 1, 0, 100, 50, 10, 200, 20, HORIZONTAL);
  dg = new Slider("delay amnt", 1, 0, 100, 50, 30, 200, 20, HORIZONTAL);
  a = new Slider("attack", 1, 0, 100, 50, 50, 200, 20, HORIZONTAL);
  r = new Slider("release", 20, 0, 100, 50, 70, 200, 20, HORIZONTAL);
  f = new Slider("filter", 20, 0, 100, 50, 90, 200, 20, HORIZONTAL);
  q = new Slider("res", 20, 0, 100, 50, 110, 200, 20, HORIZONTAL);
  seq = new MultiSlider(notes.length, 0, 256, 0, 300, width/18/2, 150, UPWARDS);

  frameRate(32);

  for (int i = 0; i < 514 ; i++) {

    wavetable[i]=((float)i/514)-0.5;
  }

  waveform.waveTableSize(514);
  waveform.loadWaveTable(wavetable);
}

void draw()
{
  background(200);
  waveform.play();
  if (f.get()!=0) {
    fc=f.get()*100;
    waveform.setFilter(fc, res);
  }

  if (dt.get()!=0) {
    waveform.setDelayTime((float) dt.get()/50);
  }

  if (dg.get()!=0) {
    // delay effect not implemented in java/ android yet....
    //waveform.setDelayAmount((int)dg.get()/100);
  }

  if (q.get() !=0 ) {
    res=q.get() / 50;
    println("res "+res);
    waveform.setFilter(fc, res);
  }

  if (a.get()!= 0) {
    attack=a.get()*10;
  }

  if (r.get() !=0 ) {
    release=r.get()*10;
  }

  dt.display();
  dg.display();
  a.display();
  r.display();
  f.display();
  q.display(); 
  seq.display();

  playhead ++;
  if (playhead%4==0) {
    //waveform.ramp(0.5,attack);
    //waveform.ramp(1, attack); 
    waveform.setFrequency(mtof[notes[playhead/4%16]+30]);
  }

  if (playhead%4==1) {
    //waveform.ramp(0., release);
  }
}


void mousePressed()
{

  //  waveform.ramp(0.5,1);
  dt.mousePressed();
  dg.mousePressed();
  a.mousePressed();
  r.mousePressed();
  f.mousePressed();
  q.mousePressed();
  seq.mousePressed();
}

void mouseDragged()
{
  dt.mouseDragged();
  dg.mouseDragged();
  a.mouseDragged();
  r.mouseDragged();
  f.mouseDragged();
  q.mouseDragged();
  seq.mouseDragged();

  //waveform.filterCutoff(200+mouseX,10);
}

void mouseReleased()
{
  for (int i=0;i<notes.length;i++) {

    notes[i]=(int) Math.floor(seq.get(i)/256*12);
  }
  //   waveform.ramp(0.,1000);
}

void keyPressed() 
{
}


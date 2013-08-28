Maxim maxim;
AudioPlayer player;

void setup(){
  size(640, 500);
  maxim = new Maxim(this);
  player = maxim.LoadFile("Ding.wav");
  player.setLooping(false);
  background(255);
}
void draw(){
}
void mouseDragged(){
  line(pmouseX, pmouseY, mouseX, mouseY);
}


void mousePressed()
{
  player.cue(0);
  player.play();
}

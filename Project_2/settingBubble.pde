void settingBubble(){
  //setting the background
  // colour based on the 3 accelerometer values
  int r,g,b;
  r = (int) (accel.getX() + 10) * 255/20;
  g = (int) (accel.getY() + 10) * 255/20;
  b = (int) (accel.getZ() + 10) * 255/20;

  fill(r, g, b);
 //draw bubble moving with accelerometer and 
  //bouncing with the power of music
  float xpos=(-accel.getX()+10)*width/20; //x position of the bubble
  float ypos=(accel.getY()+10)*height/20; //y position of the bubble
   if(showGUI) ypos=ypos/2; 
   //if the Music Control menu is shown 
   //the bubble is onlty at the top half of the screen
   if(showGUI2) ypos=ypos/2+height/2;
   //and the oposite
 
   if (ADrumsplaying) {
    ellipse(xpos,ypos, 
    map(powADrums, 0, 0.3, 100, 130), 
    map(powADrums, 0, 0.3, 100, 160));
  }
  if (ADrums2playing) {
    ellipse(xpos,ypos, 
    map(powADrums2, 0, 0.3, 100, 130), 
    map(powADrums2, 0, 0.3, 100, 160));
  }

  if (AGuitarplaying) {
    ellipse(xpos,ypos, 
    map(powAGuitar, 0, 0.3, 100, 130), 
    map(powAGuitar, 0, 0.3, 100, 160));
  }
  if (ATambplaying) {
    ellipse(xpos,ypos, 
    map(powATamb, 0, 0.3, 100, 130), 
    map(powATamb, 0, 0.3, 100, 160));
  }
  if (ATriplaying) {
    ellipse(xpos,ypos, 
    map(powATri, 0, 0.3, 100, 130), 
    map(powATri, 0, 0.3, 100, 160));
  }
  if (ATrumpplaying) {
    ellipse(xpos,ypos, 
    map(powATrump, 0, 0.3, 100, 130), 
    map(powATrump, 0, 0.3, 100, 160));
  }
    else ellipse(xpos, ypos, 100, 100);
  
 
   // set the speed of the player with the 
  // accelerometer

  float speed = map(accel.getX(), -10, 10, 300, 10);
  frameRate(speed);
  //set the speed of the instruments
  float speed1 = map(accel.getX(), -10, 10, 1.5, 0.3);
  ADrums.speed(speed1);
  ADrums2.speed(speed1);
  AGuitar.speed(speed1);
  ATamb.speed(speed1);
  ATri.speed(speed1);
  ATrump.speed(speed1);
  
  
  
  //set the volume of the player with the
  //accelerometer
  float songvolume = map(accel.getY(), -10, 10, 0.3, 3);
  sample1.volume(songvolume);
  sample2.volume(songvolume);
  sample3.volume(songvolume);
  sample4.volume(songvolume);
  ADrums.volume(songvolume);
  ADrums2.volume(songvolume);
  AGuitar.volume(songvolume);
  ATamb.volume(songvolume);
  ATri.volume(songvolume);
  ATrump.volume(songvolume);
 
 
 
}

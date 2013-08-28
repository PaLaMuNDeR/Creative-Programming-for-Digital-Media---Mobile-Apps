void displayText(){
    // display the functions of the bubble
  // on the screen using the text function
  fill(255);
 // PFont arial = loadFont("arial.ttf");
 // textFont(arial, 30);
  createFont("arial", 50);
  textSize(40);
  if(showGUI){//if bottom menu appears
  text("Vol-", width/2 - 50, 50);
  text("Vol+", width/2 - 50, height/2 - 50);
  text("Speed -", 0, height/4);
  text("Speed +", width-150, height/4);
  }
  if(showGUI2){//if upper menu appears
  text("Vol-", width/2 - 50, height/2 + 50);
  text("Vol+", width/2 - 50, height - 50);
  text("Speed -", 0, height/4 + height/2);
  text("Speed +", width-150, height/4 + height/2);
  }
  if(!showGUI && !showGUI2)
  {
  text("Vol-", width/2 - 50, 150);
  text("Vol+", width/2 - 50, height- buttonHeight/2 - 50);
  text("Speed -", 0, height/2);
  text("Speed +", width-150, height/2);
  text("Instruments", width/2 - 100, 50);
  }
}

void displayBottomPanel(){
  
  //draws a line that seperates the two displays
  stroke(0);
  line (0, height-buttonHeight/2, width, height-buttonHeight/2);

  
    // draw a moving square showing where the sequence is 

    fill(0, 0, 200, 120);
    rect(currentBeat*buttonWidth, height - buttonHeight/2, buttonWidth, height);
    
    //indicators of tracks and idexes
     for (int i = 0; i < numBeats; i++)
          {
            noStroke();
            fill(200, 0, 0);
        
            if (track1[i])
              rect(i*buttonWidth, height - buttonHeight/2 + (0), buttonWidth,  buttonHeight/8);
            if (track2[i])
              rect(i*buttonWidth, height - buttonHeight/2 + (1*buttonHeight/8), buttonWidth,  buttonHeight/8);
            if (track3[i])
              rect(i*buttonWidth, height - buttonHeight/2 + (2*buttonHeight/8), buttonWidth,  buttonHeight/8);
            if (track4[i])
              rect(i*buttonWidth, height - buttonHeight/2 + (3*buttonHeight/8), buttonWidth,  buttonHeight);
          }
 
}

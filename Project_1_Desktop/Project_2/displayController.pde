void displayController()
{
   for (int i = 0; i < 5; i++)
            {line(0, (height/2 + (i * buttonHeight)), width, (height/2 + (i * buttonHeight)));
              stroke(0);}
          for (int i = 0; i < numBeats + 1; i++)
            {line(i*width/numBeats, height/2, i*width/numBeats, height);
            stroke (255);}
        
          // draw a moving square showing where the sequence is 
          fill(0, 0, 200, 120);
          rect(currentBeat*buttonWidth, height/2, buttonWidth, height);
        
          for (int i = 0; i < numBeats; i++)
          {
            noStroke();
            fill(200, 0, 0);
        
            if (track1[i])
              rect(i*buttonWidth, height/2 + (0), buttonWidth,  buttonHeight);
            if (track2[i])
              rect(i*buttonWidth, height/2 + (1*buttonHeight), buttonWidth,  buttonHeight);
            if (track3[i])
              rect(i*buttonWidth, height/2 + (2*buttonHeight), buttonWidth,  buttonHeight);
            if (track4[i])
              rect(i*buttonWidth, height/2 + (3*buttonHeight), buttonWidth,  buttonHeight);
          }
}
  


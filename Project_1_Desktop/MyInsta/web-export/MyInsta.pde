PImage originalImage;

Button fileButton;
Button FBButton;

boolean updateImage = false;
void setImage(String url){
  //console.log("Loading: "+url);
  originalImage = loadImage(url);
  updateImage=true;
  loop();
}
void setup()
{
  size (480, 640);
  originalImage = loadImage("synthesizer.jpg");
  filebButton = new Button ("file", 10, height-50, 50, 36);
  FBButton = new Button ("Facebook", 70, height-50, 70, 36);
}
void draw()
{  
  background(100);
  if(!updateImage)
  {
  float imageWidth = (height*originalImage.width)/originalImage.height;
  imageMode(CENTER);
  image(originalImage, width/2, width/2, imageWidth, height);
  
  FBButton.display();
  fileButton.display();
  }
  else
  {
    textAlign(CENTER, CENTER);
    text("updating", width/2, width/2);
    updateImage=false;
  }
}
void mouseReleased()
{
  if(FBButton.mouseReleased())
  {println("push to FB");
  }
  if(fileButton.mouseReleased())
  {
    println("import from camera");
  }
}



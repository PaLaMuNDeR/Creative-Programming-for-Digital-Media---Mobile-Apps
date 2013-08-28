// OOP Car
class Car{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Car(){
    c=color(255);
    xpos=width/2;
    ypos=height/2;
    xspeed=2;
  }
  void display(){
    rectMode(CENTER);
    fill(c);
    rect(xpos,ypos,20,10);
  }
  void drive(){
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}


Car myCar;
Car myBlackCar;
Car myGreenCar;


void setup()  {    
  myCar = new Car();   
  myBlackCar = new Car();
  myGreenCar = new Car();

}    

void draw()  {      
  myCar.drive();   
  myCar.display();   
  background(255);
  myBlackCar.c=0;
  myGreenCar.c=color(204, 153, 0);
  
  myBlackCar.drive();
  myBlackCar.display();
  
  myGreenCar.drive();
  myGreenCar.display();
  myGreenCar.xspeed=1;
  


}

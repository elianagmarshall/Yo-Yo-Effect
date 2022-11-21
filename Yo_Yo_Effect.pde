float size=20; //size of the small circles
int pressed=0; //number of times the mouse has been pressed
float x,y; //x and y coordinates of the small circles and lines

float[] speed = new float[20]; //array with length of 20 for the speed of the small circles
float[] percent = new float[20]; //array with length of 20 for the percentage between the start and stop of the small circles
float[] startX = new float[20]; //array with length of 20 for the start x-coordinates of the small circles
float[] startY = new float[20]; //array with length of 20 for the start y-coordinates of the small circles

void setup() {
  size(600,600); //size of the run window
  for(int index=0;index<speed.length;index++) { //index variable has an initial value of 0, must be less than the length of speed array, and increases by increments of 1
    speed[index]=random(0.05); //randomizer for the speeds of the small circles
  }
}

void draw() {
  background(#AAAAAA); //grey background colour
  mouseText();  //draws the text
  shapes(); //draws the shapes
}
  
void shapes() {
  if(pressed==20) { //if the mouse is pressed 20 times
    for(int index=0;index<speed.length;index++) { //index variable has an initial value of 0, must be less than the length of speed array, and increases by increments of 1
      line(x,y,width/2,height/2); //draws lines from the centre of the run window to each small circle
      circle(x,y,size); //draws a circle at each point that was clicked on the run window
      x=lerp(startX[index],width/2,percent[index]); //moves the x-coordinate of each circle
      y=lerp(startY[index],height/2,percent[index]); //moves the y-coordinate of each circle
      percent[index]+=speed[index]; //the percentage between each circle and the centre of the run window is equal to itself plus a randomized speed
      if(percent[index]>1 || percent[index]<0) { //if the circle goes past the start or stop coordinates
        speed[index]-=speed[index]*2; //the circles change direction
      }
    circle(width/2,height/2,size*2); //draws a larger circle in the centre of the run window
    }
  }
}
  
void mouseText() {
  fill(255); //white fill colour for text
  textSize(30); //text size of 30
  text("MOUSEPRESSED:",10,30); //text that says, "MOUSEPRESSED:"
  text(pressed,230,30); //text that displays the number of times the mouse has been pressed
}
  
void mousePressed() {
  if(pressed<20) { //if the mouse has been pressed less than 20 times
    startX[pressed]=mouseX; //assigns x-coordinate to a circle where the mouse is pressed
    startY[pressed]=mouseY; //assigns y-coordinate to a circle where the mouse is pressed
    pressed++; //counter for the number of times the mouse has been pressed increases by 1
  }
}

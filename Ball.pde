class Ball {
  float x; //Ball position x-axis
  float y; //Ball position y-axis
  float diam; // Ball diameter for sizing
  float speedX;//Speed of ball
  float speedY;
  color ballColor; // color of the ball

  //Constructor
  Ball(float tmpX, float tmpY, float tmpDiam) {
    x = tmpX;
    y = tmpY;
    diam = tmpDiam;
    speedX = 0;
    speedY = 0;
    ballColor = (190);
  }

  void speed() {
    //Add speed to position of ball to make it move
    x = x + speedX;
    y = y + speedY;
  }

  void drawBall() {
    // Function for drawing the ball
    fill(ballColor); //color for the ball
    ellipse(x, y, diam, diam); //drawing the ball
  }
  
  //Function that make the ball go back to center of the screen
  void centerBall(){
    x = width/2;
    y = height/2;
    speedX = 0;
    speedY = 0;
    
    
  }
  
  //Helping funtions for collision
  // Using radius of ball, so its edge not center point hits
   float top(){
   return  y - diam/2;
   }
   float bottom(){
    return y + diam/2; 
   }
   
   float right(){
    return x + diam/2;
   }
   
   float left(){
    return x - diam/2; 
   }
   
   
}

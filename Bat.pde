class Bat {

  float x; //Bat position on x-axis
  float y; //Bat position on y-axis
  float sizeW; // width of the bat
  float sizeH; // height of the bat
  float speed; // speed of the bat
  color batColor; //Color of the bat

  //Construcot
  Bat(float tmpX, float tmpY, float tmpSizeW, float tmpSizeH) {
    x = tmpX;
    y = tmpY;
    sizeW = tmpSizeW;
    sizeH = tmpSizeH;
    speed = 0;
    batColor = (190);
  }

  // function for setting speed of the bat and making it move
  void speed() {
    y += speed;
  }

  // Function that displays bat on screen
  void drawBat() {
    fill(batColor);
    rect(x-sizeW/2, y-sizeH/2, sizeW, sizeH);
  }

  //helper functions for bat moving
  float top() {
    return y-sizeH/2;
  }
  float bottom() {
    return y+sizeH/2;
  }

  // helper functions for ball-bat colliding
  float rightBatCol() {
    return x - sizeW/2;
  }

  float leftBatCol() {
    return x + sizeW/2;
  }
}

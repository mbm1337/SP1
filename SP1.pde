
//Making ball and bats as global objects so i can us in draw and setup
Ball ball;
Bat rightBat;
Bat leftBat;


float topOfScreen = 0;
// float bottomOfScreen = height; // wanted to use this, but wont work

// Array that holds the scores
int[] scores = {0, 0};

// Declares helping varibles that makes the code more readable
int playerOneScore;
int playerTwoScore;



void setup() {
  size(600, 600);
  // declaring size of the ball
  float ballSize = 15;

  //Object of the ball in center of screen
  ball = new Ball(width/2, height/2, ballSize);
  ball.speedX = 0;
  ball.speedY = 0;

  // declaring size of the bat
  float batHeight = 100;
  float batWidth = 15;
  float batPosition = 20;

  // Objects of the bat, one for each player
  rightBat = new Bat(width-batPosition, height/2, batWidth, batHeight);
  leftBat = new Bat(batPosition, height/2, batWidth, batHeight);
}

void draw() {
  String playerOne = "Player One";
  String playerTwo = "Player Two";
  String start = " Press G to start game";
  background(30); //Background in draw for clearing canvas when objects moving

  // Centerline of the field for decoration
  stroke(255);
  line(width/2, 0, width/2, height/2 - 30) ;
  line(width/2, height, width/2, height/2 + 30) ;
  noFill();
  ellipseMode(CENTER);
  ellipse(width/2, height/2, 60, 60);

  int goalLineSpace = 10;

  // While loops for dotted lines as goallines
  int playerOneGoalLine = 0;
  while (playerOneGoalLine < height) {
    line(10, playerOneGoalLine, goalLineSpace, playerOneGoalLine + goalLineSpace);
    playerOneGoalLine = playerOneGoalLine +(goalLineSpace*2);
  }

  int playerTwoGoalLine = 0;
  while (playerTwoGoalLine < height) {
    line(width - goalLineSpace, playerTwoGoalLine, width - goalLineSpace, playerTwoGoalLine + goalLineSpace);
    playerTwoGoalLine = playerTwoGoalLine +(goalLineSpace*2);
  }


  // Displays player one and two on each side, with a score
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(20);
  text(playerOne, width/4, height/6);
  text(playerTwo, width/2 + width/4, height/6);
  textSize(100);
  text(playerOneScore, width/4, height/4); // Left side score
  text(playerTwoScore, width/2 + width/4, height/4); // Right side score


  ball.drawBall(); // Calling function to display the ball on screen
  ball.speed(); // Calling function so the ball is able to move

  //Drawing bats and making them able to move
  rightBat.drawBat();
  rightBat.speed();
  leftBat.drawBat();
  leftBat.speed();

  //Telling players how to start game
  if (ball.speedX == 0) {
    textSize(40);
    text(start, width/2, height/2 + height/4);
  }

  //If ball hits bottom or top reverse speed to go oposite direction
  if (ball.top() < topOfScreen || ball.bottom() > height) {
    ball.speedY = -ball.speedY;
  }

  //Ball collides with bat code so the ball change direction
  if ( ball.left() < leftBat.leftBatCol() && ball.y > leftBat.top() && ball.y < leftBat.bottom()) {
    ball.speedX = 0 + (random(4, 9));
    ball.speedY = random(-5, 5);
  }

  if ( ball.right() > rightBat.rightBatCol() && ball.y > rightBat.top() && ball.y < rightBat.bottom()) {
    ball.speedX = 0 + (random(-9, -4));
    ball.speedY = random(-5, 5);
  }


  // Score goes up by one every time ball hits opponents wall
  if (ball.right() > width) {
    scores[0] = scores[0] + 1;
    ball.centerBall();
    playerOneScore = scores[0];
  }
  if (ball.left() < 0) {
    scores[1] = scores[1] + 1;
    ball.centerBall();
    playerTwoScore = scores[1];
  }

  // Keeping bats in screen
  if (rightBat.bottom() > height ) {
    rightBat.y = height-rightBat.sizeH/2;
  } else if (rightBat.top() < 0) {
    rightBat.y = rightBat.sizeH/2;
  }

  if (leftBat.bottom() > height) {
    leftBat.y = height-leftBat.sizeH/2;
  } else  if (leftBat.top() < 0) {
    leftBat.y = leftBat.sizeH/2;
  }
}

void keyPressed() {
  // Controls for player two
  if (key == 'o') {
    rightBat.speed=-6;
  }
  if (key == 'l') {
    rightBat.speed=6;
  }

  // Controls for player one
  if (key == 'w') {
    leftBat.speed=-6;
  }
  if (key == 's') {
    leftBat.speed=6;
  }

  // Start button
  if (key == 'g') {
    ball.speedX = random(-4, 4);
    ball.speedY = random(-3, 3);
  }
}

// Makes bats stop when player is not pressing key
void keyReleased() {
  if (key == 'o') {
    rightBat.speed=0;
  }
  if (key == 'l') {
    rightBat.speed=0;
  }
  if (key == 'w') {
    leftBat.speed=0;
  }
  if (key == 's') {
    leftBat.speed=0;
  }
}

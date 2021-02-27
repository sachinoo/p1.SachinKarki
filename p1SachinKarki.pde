import controlP5.*;                //Imports the controlP5 library.
import ddf.minim.*;

PImage img;
PImage img1;
PImage img2;
Minim minim;
AudioPlayer player;
AudioInput input;
ControlP5 cp5;
Timer startTimer;

boolean button = false;    // State of the button.
boolean doorOpen = false;
boolean add30 = false;
boolean start = false;
boolean stop = false;
int begin ;             // This is used for positioning of the number buttons.
float duration ;      // This is used for positioning of the number buttons.
float display;
float min;
float sec;
float time ;         // This is used for positioning of the number buttons.
int x = 1180 ;         // This is used for positioning of the number buttons.
int y = 200;          // This is used for positioning of the number buttons.

int x1 = 1160;
int y1 = 800;
int w1 = 100;
int h1 = 50;

int ex;
int ey;



void setup() {
  size(1500, 900);
  startTimer = new Timer(30);
  cp5 = new ControlP5(this);
  begin = millis();  
  img = loadImage("pasta.png");
  img1 = loadImage("voice.png");
  img2 = loadImage("EXPRESS2.png");
  // Creates on/ off button
  cp5.addButton("ON/OFF")
    .setPosition(x1, y1)
    .setImages(loadImage("ONANDOFF.png"), loadImage("ONANDOFF_pressed.png"), loadImage("ONANDOFF.png"))
    .updateSize()
    .setSize(100, 50);

  // This creates the voice button
  cp5.addButton("voice")
    .setPosition(1270, 700)
    .setImages(loadImage("voice.png"), loadImage("voice_pressed.png"), loadImage("voice.png"))
    .updateSize()
    .setSize(50, 50);

  //Creates Start button.  
  cp5.addButton("START")
    .setPosition(x1+100, y1)
    .setImages(loadImage("start.png"), loadImage("start_pressed.png"), loadImage("start.png"))
    .updateSize()
    .setSize(100, 50);

  //Creates Stop button.  
  cp5.addButton("STOP")
    .setPosition(x1+200, y1)
    .setImages(loadImage("stop.png"), loadImage("stop_pressed.png"), loadImage("stop.png"))
    .updateSize()
    .setSize(100, 50);

  cp5.addButton("OPEN")
    .setPosition(x1, y1+48)
    .setImages(loadImage("door.png"), loadImage("door_pressed.png"), loadImage("door.png"))
    .updateSize()
    .setSize(100, 50);   

  cp5.addButton("express")
    .setPosition(x1+100, y1+48)
    .setImages(loadImage("express.png"), loadImage("express_pressed.png"), loadImage("express.png"))
    .updateSize()
    .setSize(100, 50);  

  cp5.addButton("add30")
    .setPosition(x1+200, y1+48)
    .setImages(loadImage("add30.png"), loadImage("add30_pressed.png"), loadImage("add30.png"))
    .updateSize()
    .setValue(30)
    .setSize(100, 50);  



  // This section defines all the number buttons.
  cp5 = new ControlP5(this);
  cp5.addButton("nine")
    .setValue(9)
    .setPosition(x, y)
    .setImages(loadImage("nine.png"), loadImage("nine_pressed.png"), loadImage("nine.png"))
    .updateSize();

  cp5.addButton("8")
    .setValue(8)
    .setPosition(x+90, y)
    .setImages(loadImage("eight.png"), loadImage("eight_pressed.png"), loadImage("eight.png"))
    .updateSize();

  cp5.addButton("7")
    .setValue(7)
    .setPosition(x+180, y)
    .setImages(loadImage("seven.png"), loadImage("seven_pressed.png"), loadImage("seven.png"))
    .updateSize();
  cp5.addButton("6")
    .setValue(6)
    .setPosition(x, y+90)
    .setImages(loadImage("six.png"), loadImage("six_pressed.png"), loadImage("six.png"))
    .updateSize();

  cp5.addButton("5")
    .setValue(5)
    .setPosition(x+90, y+90)
    .setImages(loadImage("five.png"), loadImage("five_pressed.png"), loadImage("five.png"))
    .updateSize();
  cp5.addButton("4")
    .setValue(4)
    .setPosition(x+180, y+90)
    .setImages(loadImage("four.png"), loadImage("four_pressed.png"), loadImage("four.png"))
    .updateSize();
  cp5.addButton("3")
    .setValue(3)
    .setPosition(x, y+180)
    .setImages(loadImage("three.png"), loadImage("three_pressed.png"), loadImage("three.png"))
    .updateSize();
  cp5.addButton("2")
    .setValue(2)
    .setPosition(x+90, y+180)
    .setImages(loadImage("two.png"), loadImage("two_pressed.png"), loadImage("two.png"))
    .updateSize();

  cp5.addButton("1")
    .setValue(1)
    .setPosition(x+180, y+180)
    .setImages(loadImage("one.png"), loadImage("one_pressed.png"), loadImage("one.png"))
    .updateSize();
  cp5.addButton("0")
    .setValue(0)
    .setPosition(x+90, y+270)
    .setImages(loadImage("zero.png"), loadImage("zero_pressed.png"), loadImage("zero.png"))
    .updateSize(); 

  cp5.addButton("popcorn")
    .setValue(0)
    .setPosition(x, y+370)
    .setImages(loadImage("POPCORN.png"), loadImage("POPCORN_pressed.png"), loadImage("POPCORN.png"))
    .updateSize(); 

  cp5.addButton("PIZZA")
    .setValue(0)
    .setPosition(x+122, y+370)
    .setImages(loadImage("PIZZA.png"), loadImage("PIZZA_pressed.png"), loadImage("PIZZA.png"))
    .updateSize(); 

  cp5.addButton("hot")
    .setValue(0)
    .setPosition(x+215, y+370)
    .setImages(loadImage("HOT.png"), loadImage("HOT_pressed.png"), loadImage("HOT.png"))
    .updateSize(); 

  cp5.addButton("DEFROST")
    .setValue(0)
    .setPosition(x, y+420)
    .setImages(loadImage("DEFROST.png"), loadImage("DEFROST_pressed.png"), loadImage("DEFROST.png"))
    .updateSize(); 
  cp5.addButton("potato")
    .setValue(0)
    .setPosition(x+122, y+420)
    .setImages(loadImage("POTATOE.png"), loadImage("POTATOE_pressed.png"), loadImage("POTATOE.png"))
    .updateSize(); 


  // This section handles the sound part.

  minim = new Minim(this);
  player = minim.loadFile("food.mp3");
  input = minim.getLineIn();
}



void draw() {
  background(128, 190, 100);
  fill (255);
  strokeWeight(20);
  rect(10, 20, 1100, 875);              // This is the door 
  image(img, 350, 300, 500, 400);
  image(img1, 1270, 700, 75, 75);
  //image (img2,1170,600,300,60);
  // Defines the door 
  fill (0, 50);
  rect(10, 10, 1100, 875);

  // This section is for the timer.
  fill(255);
  strokeWeight(0);
  rect(1180, 5, 250, 185, 7);


  if (mouseX>1360 && mouseX < 1360+100 && mouseY > 848 && mouseY < 898 && mousePressed) {
    background(255, 0, 0);
    add30 = true;
    time += 30;
  }
  if (mouseX>1260 && mouseX < 1260+100 && mouseY > 800 && mouseY < 850 && mousePressed) {
    //background(255,100,0);
    start = true;
  }


  if (button) {
    textSize(40);
    fill(0, 255, 0);
    text("ON", 1240, 180);
    textSize(40);
    fill(255, 255, 255);
    text("OFF", 1300, 180);

    //stroke(0);
  } else {
    textSize(40);
    fill(255, 0, 0);
    text("OFF", 1300, 180);

    // background(0);   // background is black
    stroke(255);
  } 


  if (button == true && start ==true && add30 == true) {

    time = startTimer.getTime();


    if (time >  0) {  
      startTimer.countDown();
      fill(0, 0, 0);
      textSize(80);
      text(nfs(time, 0, 2), 1180, 90);
      println(time);
    } else {
      textSize(80);
      fill(0);
      text("00:00", 1185, 90);
      textSize(50);
      fill(0);
      text("READY", 1230, 130); 
      soundplay();
      time = 0.00;
    }
  } 

  // This section is for the On/Off button.
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getValue());
}

void soundplay() {
  player.play();
}

void voicecommand() {
  player = minim.loadFile("voice.mp3");
  input = minim.getLineIn();
  player.play();
}

void mousePressed() {
  if (mouseX > x1 && mouseX < x1+w1 && mouseY > y1 && mouseY < y1+h1) 
  {
    button =  ! button;
  }
}

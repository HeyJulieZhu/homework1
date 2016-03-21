import processing.video.*;
Capture cam;


PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

int k=300;
int g=300;
int m, m2;



void setup() {
  fullScreen();
  img1 = loadImage("bg.png");
  img = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");


  m=(width-3*k)/4;
  m2=(height-2*g)/3;

  String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 640, 480);
  } 
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}
//
void draw() { 
  background(255);
  //image(img, 0, 0,width/2,height/2); 
  //if(inside(0,0,width/2,height/2)){
  //rect(0,0,width/2,height/2);
  //}



  drawImage(img1, 0, 0, width, height);
  drawImage(img, m, m2, k, g);
  drawImage(img2, 2*m+k, m2, k, g);
  drawImage(img3, 3*m+2*k, m2, k, g);
  drawImage(img4, m, 2*m2+g, k, g);
  drawImage(img5, 2*m+k, 2*m2+g, k, g);


  if (cam.available() == true) {
    cam.read();
  }
  drawImage(cam, 3*m+2*k+25, 2*m2+g+15, k-70, g-90);
  drawImage(img6, 3*m+2*k, 2*m2+g, k, g);
}
//
void drawImage(PImage img, int x, int y, int w, int h) {
  if (mousePressed) {
    if (inside(x, y, w, h)) {

      image(img, 0, 0, width, height);
    }
  } else {
    image(img, x, y, w, h);
  }
}




boolean inside(int x, int y, int w, int h) {  
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    return true;
  } else {
    return false;
  }
} 
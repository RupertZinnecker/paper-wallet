PImage img;

void setup()
{
  size(420,595);
  background(0,51,102);
  drawLine();
  //saveFrame("D:/Crypto Money/Moneyart/artwork/k7.png");
  //img = loadImage("../../images/top6.png");  
}

void drawLine(){
  for(int i = 1; i < 150;i++){
    stroke(255+random(1)*10,222+random(1)*10,random(1)*200);
    strokeWeight(random(3));
    float rand1 = random(600);
    float rand2 = random(600);
    float rand3 = random(-250,250);
    line(rand1,rand2,rand1 - rand3,rand2 + rand3);  
  }
}

void draw()
{
  //image(img, 60, 300, 305, 150);
}

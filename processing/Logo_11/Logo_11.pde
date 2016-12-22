PImage img;

void setup(){
  //size(420,595);
  size(2048,1024);
  background(0,80,0);
  img = loadImage("../../images/top6.png");
  drawCircles();
  //image(img, 60, 300, 305, 150);
  saveFrame("/home/cryp71x/Downloads/moneyart11.png");
}

void draw(){
  
}

void drawCircles(){
  noFill();
  color c1 = #FFFF00;
  stroke(c1);
  int number = 10;
  float radius = 400/number;
  float rand, r;
  for(int i=0;i<number*6;i++){
    for(int j=0;j<number*4;j++){
      rand = random(0.2,1);
      r = rand*radius;
      ellipse(i*(radius + 4)+(radius/2),j*(radius + 4)+(radius/2),r,r);
    }
  }
  
}

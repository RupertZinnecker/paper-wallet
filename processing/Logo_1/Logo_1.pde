PImage img;

void setup()
{
  size(420,595);
  double angle;
  double radius;
  background(246, 150, 25);
  drawSpiral(0);
  drawSpiral(2*PI/3);
  drawSpiral(4*PI/3); 
  //saveFrame("D:/Dokumente/Moneyart/moneyart website/processing/Logo/k1.png");
  //img = loadImage("../images/top6.png");
}

void drawSpiral(float startAngle)
{
  float xKoordOld;
  float yKoordOld;
  float xKoord = 50;
  float yKoord = 50;
  float xMidpoint = 210;
  float yMidpoint = 300; 
  float radius;  
  float weight; 
  smooth(8);
  for(int i=1;i<=40000;i++ )
  { 
      radius = 0.0125 * i;  
      xKoordOld = xKoord;
      yKoordOld = yKoord;
      xKoord = xMidpoint + radius * sin((i*PI/1000) + startAngle);
      yKoord = yMidpoint + radius * cos((i*PI/1000) + startAngle);
                 
      colorMode(RGB, 100);
      float j = 255*(20001-i)/20000;
      float k = 255*i/20000;  
      stroke(255, 255, 255);
      float fat = random(20000);
      if(0 <= fat && fat <= 30)
      {
        strokeWeight((fat-5)*3/5 + 5);
        stroke(255,255,255);      
      }
      point(xKoord, yKoord);
      strokeWeight(1);      
  }  
}

void draw()
{
  //image(img, 60, 300, 305, 150);  
}



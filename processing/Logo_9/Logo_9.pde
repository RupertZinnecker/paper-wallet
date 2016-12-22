PImage img;

void setup()
{
  size(420,595);
  background(255,255,255); 
  int maxDepth = 10;
  int printDepth = 8;
  int printDepthCircle = 7;
  int minCircleDepth = 1;
  float probCircle = 0.4;
  float facRedProbCirc = 0.8;
  float probDiv = 0.05;
  float facRedProb = 0.8;
  float maxlength;
  float colRed = 71;
  float colGreen = 71;
  float colBlue = 71;
  drawSquare(-10, -10, true, probDiv, facRedProb, 1024, maxDepth, printDepth, 0, true, probCircle, 1024, colRed, colGreen, colBlue, 1, minCircleDepth, printDepthCircle);  
  maxDepth = 12;
  printDepth = 8; 
  //saveFrame("D:/Dokumente/Moneyart/moneyart website/processing/Logo/k9.png");
  //img = loadImage("../../images/top6.png");
}

void drawSquare(float x, float y, boolean divide, float probDiv, float facRedProb, float maxlength, int maxDepth, int printDepth, int depth, boolean circle, float probCircle, float radius, float colRed, float colGreen, float colBlue, float fadeOut, int minCircleDepth, int printDepthCircle)
{
    //float error = 0.001;
    depth++;
    //boolean drawCircle = true;
    if(depth < maxDepth)
    {
      
      if(depth < printDepth)
      {
      noFill();  
      stroke(0,0,0);
      rect(x,y,maxlength,maxlength);
      }

      for(int i=0;i<2;i++)
      {
        for(int j=0;j<2;j++)
        {
          float rand = random(1);
          if(rand * facRedProb>probDiv || depth < 4)
          {              
              drawSquare(x + i*maxlength/2, y + j*maxlength/2, divide, probDiv*facRedProb, facRedProb, maxlength/2, maxDepth, printDepth, depth, circle, probCircle, radius/2, colRed*fadeOut, colGreen, colBlue, fadeOut, minCircleDepth, printDepthCircle);                        
          } 
          else 
          {  
            
            if(rand < probCircle && depth < printDepthCircle)
            {
              stroke(colRed,colGreen,colBlue);
              fill(colRed,colGreen,colBlue);
              //noFill();  
              //stroke(255,255,255);              
              //ellipse(x + maxlength/4, y + maxlength/4, maxlength/4, maxlength/4);
              drawSpiral(x + maxlength/4, y + maxlength/4, 1, pow(2,depth));
            }
          }      

          
        }
      
      }
      
      
      
      
    }  
      
}


void draw()
{
  //image(img, 60, 300, 305, 150);
}

void drawSpiral(float x, float y, float startAngle, float max)
{
  //float xKoordOld;
  //float yKoordOld;
  float xKoord;
  float yKoord;
  float xMidpoint = x;
  float yMidpoint = y; 
  float radius;  
  float weight; 
  smooth(8);
  for(int i=1;i<=1000;i++ )
  { 
      radius = 0.75/max * i;  
      //xKoordOld = xKoord;
      //yKoordOld = yKoord;
      xKoord = xMidpoint + radius * sin((i*PI/(100)) + startAngle);
      yKoord = yMidpoint + radius * cos((i*PI/(100)) + startAngle);
                 
     // colorMode(RGB, 100);
     // float j = 255*(20001-i)/20000;
     // float k = 255*i/20000;  
     // stroke(255, 255, 255);
     // float fat = random(20000);
     // if(0 <= fat && fat <= 30)
     // {
     //   strokeWeight((fat-5)*3/5 + 5);
     //   stroke(255,255,255);      
     // }
     stroke(25,25,112);
     point(xKoord, yKoord);
     // strokeWeight(1);      
  }  
}

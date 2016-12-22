PImage img;

void setup()
{
  size(420,595);
  background(25,25,112);
  int maxDepth = 10;
  int printDepth = 8;
  int minCircleDepth = 1;
  float probCircle = 1;
  float facRedProbCirc = 0.8;
  float probDiv = 0.05;
  float facRedProb = 0.8;
  float maxlength;
  float colRed = 171;
  float colGreen = 171;
  float colBlue = 171;
  drawSquare(-10, -10, true, probDiv, facRedProb, 1024, maxDepth, printDepth, 0, true, probCircle, 1024, colRed, colGreen, colBlue, 1, minCircleDepth);  
  maxDepth = 12;
  printDepth = 8;
  //saveFrame("D:/Dokumente/Moneyart/moneyart website/processing/Logo/k5.png");
  //img = loadImage("../../images/top6.png");
}

void drawSquare(float x, float y, boolean divide, float probDiv, float facRedProb, float maxlength, int maxDepth, int printDepth, int depth, boolean circle, float probCircle, float radius, float colRed, float colGreen, float colBlue, float fadeOut, int minCircleDepth)
{
    //float error = 0.001;
    depth++;
    //boolean drawCircle = true;
    if(depth < maxDepth)
    {
      
      if(depth < printDepth)
      {
      noFill();
      stroke(255,255,255);
      rect(x,y,maxlength,maxlength);
      }

      for(int i=0;i<2;i++)
      {
        for(int j=0;j<2;j++)
        {
          float rand = random(1);
          if(rand * facRedProb>probDiv || depth < 4)
          {              
              drawSquare(x + i*maxlength/2, y + j*maxlength/2, divide, probDiv*facRedProb, facRedProb, maxlength/2, maxDepth, printDepth, depth, circle, probCircle, radius/2, colRed*fadeOut, colGreen, colBlue, fadeOut, minCircleDepth);                        
          } 
          else 
          {  
            
            if(rand < probCircle) // && depth > minCircleDepth)
            {
              noFill();
              stroke(255,255,255);
              ellipse(x + maxlength/4, y + maxlength/4, maxlength/4, maxlength/4);
              
              
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

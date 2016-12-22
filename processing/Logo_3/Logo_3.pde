PImage img;

void setup()
{
  size(420,595);
  background(205, 133, 0);  
  int maxDepth = 8;
  int printDepth = 6;
  int minCircleDepth = 1;
  float probCircle = 0.2;
  float maxlength;
  drawSquare(-10, -10, true, 1, 0.99, 1024, maxDepth, printDepth, 0, true, probCircle, 1024, 255, 1, minCircleDepth);  
  maxDepth = 12;
  printDepth = 8;
  drawSquare(-10, -10, true, 1, 0.7, 1024, maxDepth, printDepth, 0, true, 0.25, 512, 255, 0.8, 5);    
  //saveFrame("D:/Dokumente/Moneyart/moneyart website/processing/Logo/k3.png");
  //img = loadImage("../../images/top6.png");
}

void drawSquare(float x, float y, boolean divide, float probDiv, float facRedProbDiv, float maxlength, int maxDepth, int printDepth, int depth, boolean circle, float probCircle, float radius, float colRed, float fadeOut, int minCircleDepth)
{
    float error = 0.001;
    depth++;
    //boolean drawCircle = true;
    if(divide && depth < maxDepth)
    {
      
      //if(depth < printDepth)
      //{
        noFill();
        stroke(255,255,255);
        rect(x,y,maxlength,maxlength);
      //}
      
      for(int i=0;i<2;i++)
      {
        for(int j=0;j<2;j++)
        {
          float rand = random(1);
          if(rand>probCircle)
          {
              
              drawSquare(x + i*maxlength/2, y + j*maxlength/2, divide, probDiv*facRedProbDiv, facRedProbDiv, maxlength/2, maxDepth, printDepth, depth, circle, probCircle, radius/2, colRed*fadeOut, fadeOut, minCircleDepth);
                        
          } 
          else 
          {  
            
            //if(rand < probCircle && depth > minCircleDepth)
            //{
             
              
              stroke(255,255,255);
              ellipse(x + maxlength/2, y + maxlength/2, maxlength/2, maxlength/2);
              
            //}
          }      

          
        }      
      }      
    }        
}

void draw()
{
  //image(img, 60, 300, 305, 150);
}

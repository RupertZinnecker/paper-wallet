PImage img;

void setup()
{
  size(420,595);
  background(25, 25, 112);  
  int maxDepth = 5;
  drawSquare(-10, -10, true, 1, 1, 1024, 6, 5, 0, true, 0.25, 1024, 255, 1 );  
  //saveFrame("D:/Dokumente/Moneyart/moneyart website/processing/Logo/k2.png");
  //img = loadImage("../../images/top6.png");
}

void drawSquare(float x, float y, boolean divide, float probDiv, float facRedProbDiv, float maxlength, int maxDepth, int printDepth, int depth, boolean circle, float probCircle, float radius, float colRed, float fadeOut)
{
    float error = 0.001;
    if(divide && depth < maxDepth)
    {
      depth++;
      noFill();
      stroke(255,255,255);
      rect(x,y,maxlength,maxlength);
      for(int i=0;i<2;i++)
      {
        for(int j=0;j<2;j++)
        {
          float rand = random(1);
          if(rand<probDiv)
          {
            drawSquare(x + i*maxlength/2, y + j*maxlength/2, divide, probDiv*facRedProbDiv, facRedProbDiv, maxlength/2, maxDepth, printDepth, depth, circle, probCircle, radius/2, colRed*fadeOut, fadeOut);          
          }
        }
      }
    }
    else
    {
      if(circle)
      {
        float rand = random(1);
        if(rand < probCircle)
        {
          stroke(255,255,255);
          ellipse(x + radius/2, y + radius/2, radius, radius);
          
        }
      }
    }    
}

void draw()
{
  //image(img, 60, 300, 305, 150);
}

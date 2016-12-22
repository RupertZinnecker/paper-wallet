//import processing.pdf.*;

PImage img;  
int numberOfLines = 10;
int numberOfPoints = 20;
int iArea;
float[][] koordinates = new float[20][20];
float[] sizes = new float[20];
boolean insideArea;
boolean locked;
float bx;
float by;
float xOffset = 0.0; 
float yOffset = 0.0; 
int vertex1[] = new int[numberOfLines];
int vertex2[] = new int[numberOfLines];


void setup()
{
  //first width second height
  size(420,595);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("../processing/Bitcoin/bitcoin-logo-plain.png");
  background(0,0,0);
 
  
  for(int i=0;i<numberOfPoints;i++)
  {
    float x = random(575);
    float y = random(400);
    float size = random(10) + 10;
     koordinates[i][0] = x;
     koordinates[i][1] = y;
    // Draw the image to the screen at coordinate (0,0)
    image(img,x+20,y+20,size,size);
    sizes[i] = size;
    
  }

  for(int j=0;j<numberOfLines;j++)
  {
    int v1 = (int) random(numberOfPoints);
    int v2 = (int) random(numberOfPoints); 
    vertex1[j] = v1;
    vertex2[j] = v2;
    stroke(255);
  }
  for(int j=1;j<numberOfLines;j++)
  {
    line(koordinates[vertex1[j]][0] + 20 + sizes[vertex1[j]]/2, koordinates[vertex1[j]][1] + 20 + sizes[vertex1[j]]/2, koordinates[vertex2[j]][0] + 20 + sizes[vertex2[j]]/2, koordinates[vertex2[j]][1] + 20 + sizes[vertex2[j]]/2);
    stroke(255);
  }
}

void draw()
{
  background(0);
  insideArea = false;
  for(int i=0;i<numberOfPoints;i++)
  {
    if(mouseX < (koordinates[i][0] + 20 + sizes[i]) && mouseX > (koordinates[i][0] + 20) && mouseY < (koordinates[i][1] + 20 + sizes[i]) && mouseY > (koordinates[i][1] + 20))
    {  
      insideArea = true;
      iArea = i;      
    }
    image(img,koordinates[i][0]+20,koordinates[i][1]+20,sizes[i],sizes[i]);    
  }
  
  for(int j=1;j<numberOfLines;j++)
  {
    line(koordinates[vertex1[j]][0] + 20 + sizes[vertex1[j]]/2, koordinates[vertex1[j]][1] + 20 + sizes[vertex1[j]]/2, koordinates[vertex2[j]][0] + 20 + sizes[vertex2[j]]/2, koordinates[vertex2[j]][1] + 20 + sizes[vertex2[j]]/2);
    stroke(255);
  }  
  
}

/*
void printButtonPressed()
{
  function changeWords()
  {
    document.getElementById("").innerHTML = "<img> lets do it </p>";
  }  
  changeWords();
}*/

void mousePressed()
{
  //printButtonPressed();
  if(insideArea)
  {
    locked = true;
  }
  else
  {
    locked = false;
  } 
}

void mouseDragged() {
  if(locked == true)
  {
    koordinates[iArea][0] = mouseX - sizes[iArea]/2.0 - 20;
    koordinates[iArea][1] = mouseY - sizes[iArea]/2.0 - 20;
  }
}

void mouseReleased() {
  locked = false;
}

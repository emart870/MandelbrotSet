import java.*;

float times = 1;
PGraphics canvas;


void setup()
{
  size(1200, 800);  //Set the size of the window
  canvas = createGraphics(width, height);  
  canvas.beginDraw();
  canvas.background(0);
  canvas.endDraw();
}

//Iterating through the algorithm and seeing if the point is in the set or not
String repeater(Complex num, float times)
{
  Complex result = num;
  for(int i = 0; i < times; i++)
  {
    result = result.multiply(result).addition(num);
    if(result.distSquared() > 4)
    {
      return false + " " + i;
    } 
  }
  return true + " " + 0;
  
  
}

void draw()
{
  
  image(canvas, 0, 0);
  
  strokeWeight(2);
  stroke(255);
  line(0, height/2, width, height/2);
  line(height, 0, height, width);
  
  float unit = height/2;
  translate(unit*2, unit);
  
  mandelSetMaker(times, unit, 200, 63, 222);
  times += 5;
}

void mandelSetMaker(float times, float unit, float r, float g, float b)
{
  for(float col = -unit*2; col < unit; col++)
  {
    for(float row = unit; row > -unit; row--)
    {
      float real = col * (1/unit);
      float imag = row * (1/unit);
      Complex num = new Complex(real, imag);
      if (repeater(num, times).split(" ")[0].equals("true"))
      {
        strokeWeight(2);
        stroke(r, g, b);
        point(col, row);
      }
      //if you want the gradiant. Makes it slower though
      else
      {
        strokeWeight(2);
        
        float i = (Integer.parseInt(repeater(num, times).split(" ")[1])/times);
        stroke(i*r, i*g, i*b);
        
        point(col, row);
      }
        
    }
  }
}

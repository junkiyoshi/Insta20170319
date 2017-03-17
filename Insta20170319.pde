ArrayList<Particle> particles;
color body_color;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  colorMode(HSB);
  
  particles = new ArrayList<Particle>();
  for(int i = 0; i < 256; i++)
  {
    particles.add(new Particle(200));
  }
}

void draw()
{
  background(0);
  translate(width / 2, height / 2, 0);
  
  float angle = frameCount % 360;
  float camera_x = 500 * cos(radians(angle));
  float camera_z = 500 * sin(radians(angle));   
  camera(camera_x, 0, camera_z, 
         0, 0, 0, 
         0, 1, 0);


  noStroke();
  fill(color((frameCount / 2) % 255, 255, 255), 128);
  
  for(int i = 0; i < particles.size(); i++)
  {
    ArrayList<PVector> nearPoint = new ArrayList<PVector>();
    for(int j = 0; j < particles.size(); j++)
    {
      float distance = PVector.dist(particles.get(i).location, particles.get(j).location);
      if(distance < 40)
      {
        nearPoint.add(particles.get(j).location);
      }
    }
    
    beginShape();
    for(PVector p : nearPoint)
    {
      vertex(p.x, p.y, p.z);
    }
    endShape(CLOSE);
    
    particles.get(i).update();
    particles.get(i).display();
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 900)
  {
     exit();
  }
  */
}
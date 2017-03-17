class Particle
{
  PVector location;
  float len;
  float noise_x;
  float noise_y;
  float noise_z;
  color body_color;
  
  Particle(float l)
  {
    location = new PVector(0, 0, 0);
    len = l;
    
    noise_x = random(100);
    noise_y = random(100);
    noise_z = random(100);
    
    body_color = color(128, 255, 255);
  }
  
  void update()
  {
    float x = map(noise(noise_x), 0, 1, -200, 200);
    float y = map(noise(noise_y), 0, 1, -200, 200);
    float z = map(noise(noise_z), 0, 1, -200, 200);
    noise_x += 0.005;
    noise_y += 0.005;
    noise_z += 0.005;
  
    PVector direction = PVector.sub(new PVector(0, 0, 0), new PVector(x, y, z));
    direction.normalize();
    direction.mult(len);
  
    x = direction.x;
    y = direction.y;
    z = direction.z;
    
    location = new PVector(x, y, z);
  }
  
  void display()
  {    
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphere(1);
    popMatrix();
  }
}
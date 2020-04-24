int num, px, py;
Particle[] particles;

float r = 300;
float theta = 0;
float r_noise = random(30000);
int lastx = 0, lasty = 0;

void setup(){
  size(1600, 900);
  //fullScreen();
  background(255);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
  background(240);
  ///frameRate(20);
  
  num = 150;
  particles = new Particle[num];
  for(int i=0; i<num; i++){
    particles[i] = new Particle();
  }
}


void draw(){
  saveFrame("Frames/######.png");
  
  if(frameCount % 80== 0){
    println(frameCount);
    fill(255, 10);
    ellipse(width/2, height/2, 2*r, 2*r);
  }
  int i;
  float dir;
  float this_r = r;// + (3*r*noise(r_noise) - 3*r/2);
  px = int(width/2 + this_r * cos(radians(theta)));
  py = int(height/2 +this_r * sin(radians(theta)));
  dir = degrees(atan2(py-lasty, px-lastx)) - 90;
    
  
  i = 0;
  while(i < num){
    if(particles[i].age < 1){
      particles[i].init(dir, px, py);
      break;
    }
    i++;
  }

  
  for(Particle p: particles){
    if(p.age > 0) p.update();
  }
  
  lastx = px;
  lasty = py;
  theta+=5;
  r_noise += 0.01;
 
}

void keyPressed(){
  saveFrame("ScreenShots/#######.png");
}

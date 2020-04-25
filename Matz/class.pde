class Particle {
  PVector v, vD;
  float dir, dirMod, speed;
  int col, age, stateCnt, type;

  Particle() {
    v = new PVector(0, 0);
    vD = new PVector(0, 0);
    age = 0;
  }

  void init(float _dir, int _px, int _py) {
    dir = _dir;

    float prob = random(100);
    if (prob <  80) age = 15+int(random(50));
    else if (prob < 99) age = 45+int(random(50));
    else age = 300+int(random(100));

    if (random(100) < 80) speed = random(2) + 0.5;
    else speed = random(2) + 2;

    if (random(100) < 80) dirMod = 20;
    else dirMod = 60;

    v = new PVector(_px, _py);
    initMove();
    dir = _dir;
    stateCnt = 10;
    if (random(100) < 50) col = 0;
    else col = 1;
    type = int(random(30000))%2;
  }


  void initMove() {
    //if(random(100) > 50) dirMod = -dirMod;
    dir += dirMod;

    vD = new PVector(speed, 0);
    vD.rotate(radians(dir + 90));

    stateCnt = 10 + int(random(5));
    if (random(100) < 10) stateCnt += 30;
  }


  void update() {
    age--;

    if (age>=30) {
      vD.rotate(radians(1));
      vD.mult(1.01f);
    }

    v.add(vD);

    color col1 = color(0, 8+age/2, 68, 80);
    color col2 = color(3, 16+age/2, 255, 80);
    color col3 = color(235+age/2, 230, 232, 80);
    color col4 = color(229+age/2, 225, 0, 80);
    color pcol3 = color(235, 230, 232);
    color pcol4 = color(229, 225, 0);

    if (col==0) fill(col1);
    else fill(col2);

    if (type==1) {
      if (col==0) fill(col3);
      else fill(col4);
    }
    push();
    translate(v.x, v.y);
    rotate(radians(dir));
    rect(0, 0, 1, 20);
    pop();

    if (age==0) {
      if (random(100) < 50) fill(pcol3);
      else fill(pcol4);
      float size = 2+random(4);
      if (random(100) < 5) size += 5;
      ellipse(v.x, v.y, size, size);
    }
    if (v.x<0 || v.x>width || v.y<0 || v.y>height) age = 0;

    if (age < 30) {
      stateCnt--;
      if (stateCnt==0) {
        initMove();
      }
    }
  }
}

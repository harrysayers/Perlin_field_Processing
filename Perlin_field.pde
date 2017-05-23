int cols;
int rows;
int scl = 20;
int w=4000;
int h=6600;
float fly = 30;
float[][] terrain;


void setup() {
  size(1500,800 , P3D);
 
  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
}

void draw() {
  frameRate(30);
    background(0);
  fly-=0.05;
  float yoff=fly;
  for(int y=0; y<rows; y++){
    float xoff=0;
    for(int x=0; x<cols; x++){
      terrain[x][y] = noise(xoff,yoff);
      terrain[x][y] = map(terrain[x][y],0,1,-80,80);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  stroke(225);
  noFill();
  translate(width/2,height/2);
  rotateX(PI/6);
  translate(-w/2,-h/2);
  for(int y=0; y<rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x=0; x<cols; x++){
      vertex(x*scl,y*scl, terrain[x][y]);
      stroke(map(terrain[x][y+1],-0,25,25,125),25,25);
      vertex(x*scl,(y+1)*scl,terrain[x][y+1]);
    }
    endShape();
  }
}
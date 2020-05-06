import ddf.minim.*;

Minim minim;
AudioPlayer in;

void setup(){
  size(800, 800);
  minim = new Minim(this);
  in = minim.loadFile("../シリウス.mp3", 1024);
  in.loop();
  background(0);
}

void draw(){
  colorMode(RGB, 255);
  fill(0, 150);
  rect(-1, -1, width, height);
  colorMode(HSB, 360, 100, 100);
  float brightness = 50 + map(in.mix.level(), 0, 0.5, 0, 50);
  fill(random(360), 100, brightness);
  float radious = 8 + map(in.mix.level(), 0, 0.5, 0, 50);
  for(int x = 0; x < 10; x++){
    for(int y = 0; y < 10; y++){
      ellipse(70 + x * 100, 70 + y * 100, radious * 2, radious * 2);
    }
  }
}

void stop(){
  in.close();
  minim.stop();
  super.stop();
}
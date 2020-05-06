import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
FFT fft;
int fftSize;

void setup()
{
size(1024,480,P2D);
noStroke();
colorMode(HSB,360,100,100,100);
minim=new Minim(this);
fftSize=512;
player=minim.loadFile("../シリウス.mp3",fftSize);
player.loop();
fft= new FFT(player.bufferSize(),player.sampleRate());
}

void draw()
{
background(0);
fft.forward(player.left);
for(int i = 0;i<fft.specSize();i++)
{
float h = map(i,0,fft.specSize(),0,180);
float a = map(fft.getBand(i),0,fftSize/64.0,0,255);
float x = map(i,0,fft.specSize(),width/2,0);
float w = width / float(fft.specSize()) / 2;
fill(h,80,80,a);
rect(x,0,w,height);
}
fft.forward(player.right);
for (int i=0;i<fft.specSize();i++)
{
float h = map(i,0,fft.specSize(),0,180);
float a = map(fft.getBand(i),0,fftSize/64.0,0,255);
float x = map(i,0,fft.specSize(),width/2,width);
float w = width / float(fft.specSize()) / 2;
fill(h,80,80,a);
rect(x,0,w,height);
}
}
import ddf.minim.*;  //minimライブラリのインポート
 
Minim minim;  //Minim型変数であるminimの宣言
AudioPlayer groove;
int waveH = 100;  //波形の高さ
 
void setup(){ 
  size(512, 512);
 
  minim = new Minim(this);  //初期化
 
  //バッファ（メモリ上のスペース。この場合は512要素のfloat型の配列）を確保し、マイク入力用の変数inを設定する。
//   in = minim.getLineIn(Minim.STEREO, 512);
  groove = minim.loadFile("../シリウス.mp3", 1024);
  groove.loop();
}
 
void draw(){ 
  background(0);
  stroke(255);

  //波形を描く
  //left.get()とright.get()が返す値は-1から+1なので、見やすくするために、
  //waveH（初期値は100）を掛けている。
  for(int i = 0; i < groove.bufferSize()-1; i++){ 
    line( i, 150 + groove.left.get(i)*waveH, i+1, 150 + groove.left.get(i+1)*waveH );
    line( i, 350 + groove.right.get(i)*waveH, i+1, 350 + groove.right.get(i+1)*waveH );
  }
}
 
void stop(){ 
  groove.close();
  minim.stop();  
  super.stop();
}
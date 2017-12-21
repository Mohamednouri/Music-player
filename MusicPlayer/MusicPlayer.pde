import processing.sound.*;

//Variables
PImage[] pic = new PImage[6]; //Array; .length is "5"
float imageX = 225, imageY = 225;
float scaleX, scaleY, scale;
float imageXscaled;
float imageYscaled;

int totalSongs= 3;
SoundFile[] song = new SoundFile[totalSongs];
int indexSong = 0;


void setup () {
  
song[0] = new SoundFile (this, "Standing_Here.mp3");
song[1] = new SoundFile (this, "Cielo.mp3");
song[2] = new SoundFile (this, "Avant_Jazz_Disco_Ultralounge");

size (300, 300);
fill (0);
rect (120,150,60,60); // play button
rect (125,90,50,50); //pause button
rect (190,155,50,50); // skip to next song
rect (60, 155, 50, 50); //back a song
rect (75, 0,150,50); //title
rect (249, 0, 50,50);//quit button

rect (0,0,300,300);// fullscreen


 float rectWidth = width, rectHeight = height; //width and hieght must be called after size
  pic[0] = loadImage("download.png"); //play button
  pic[1] = loadImage("images.png"); //skip button
  pic[2] = loadImage("back.png");// back a song
  pic[3] = loadImage("music pic.fw.png");// title
  pic[4] = loadImage("close-button.png");//quit button
  pic[5] = loadImage("pause button.png");////pause button

  //Scale: rect / image
  scaleX = rectWidth / imageX;
  println ("ScaleX: " + scaleX);
  scaleY = rectHeight / imageY;
  println ("ScaleY: " + scaleY);



 //Scale: rect / image
  scaleX = rectWidth / imageX;
  println ("ScaleX: " + scaleX);
  scaleY = rectHeight / imageY;
  println ("ScaleY: " + scaleY);

  //Pick the smallest scale, always!
  if ( scaleX < scaleY ) {
    scale = scaleX;
  } else {
    scale = scaleY;
  }

  //Scale the image dimensions
  imageXscaled = imageX * scale;
  imageYscaled = imageY * scale;

  if (imageXscaled > rectWidth | imageYscaled > rectHeight) {
    while ( imageXscaled > rectWidth | imageYscaled > rectHeight ) {
      if (imageXscaled <= rectWidth) { 
        imageX = imageXscaled; //Rewrites the origonal imageX dimension
      } else {
        float i = 1.000;
        while (imageXscaled > rectWidth) {
          //scaleXtest = scaleXtest * i;
          i = i - 0.005;
          imageXscaled = imageXscaled * i;
        }
        imageX = imageXscaled;
      }
      if (imageYscaled <= rectHeight) {
        imageY = imageYscaled;
      } else {
        float i = 1.000;
        while (imageYscaled > rectHeight) {
          i = i - 0.005;
          imageYscaled = imageYscaled * i;
        }
        imageY = imageYscaled;
      }
    }
    imageX = imageXscaled; 
    imageY = imageYscaled;
  } else {
    imageX = imageXscaled; 
    imageY = imageYscaled;
  }
  image(pic[0], 120,150,60,60);//play button
  image (pic[5],125,90,50,50);//stop button
  image (pic[1],190,155,50,50);//skip button
  image (pic[2], 60, 155, 50, 50);// back a song
  image (pic[3],75, 0,150,50);//title
  image (pic[4],249, 0, 50,50);//quit button
}

void draw () {

}

void mousePressed () {
  if (mouseX>=249 && mouseX <=300 && mouseY>=0 && mouseY<=300) {
    exit ();
  } //End of Exit() QuitButton

 if (mouseX>=120 && mouseX <=180 && mouseY>=150 && mouseY<210) {
   song[indexSong] .play();
 }

 if (mouseX>=125 && mouseX <=175 && mouseY>=90 && mouseY<140) {
   song[indexSong].stop();
 }
 //rect (190,155,50,50); // skip to next song
 if (mouseX>=190 && mouseX <=240 && mouseY>=155 && mouseY<205){
   indexSong=indexSong +1;
   song[indexSong].stop();
 }
}
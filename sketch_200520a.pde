import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

Capture video;
OpenCV opencv;
Rectangle[] faces;
PImage face_img; 


void setup() {
  size(640,480);
  
  //opencv = new OpenCV(this, "test.jpg");
  opencv = new OpenCV(this,640,480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  face_img = loadImage("face.png");
  
  video = new Capture(this,640,480);
  video.start();
  
}


void draw() {

  if (video.available()) {
    video.read();
  }
  
  while(video.height == 0) 
    delay(10);
    
  image(video,0,0);
  opencv.loadImage(video);
  faces = opencv.detect();
  
  if(faces != null){
    for(int i = 0; i < faces.length; i++){
      
      //scale(1.0);
      /**
       * Al pasar las posiciones del rotro detectado permiten a la imagen
       * cambiar su posicion y su tamaño en relación al rostro.
       */
      image(face_img, faces[i].x, faces[i].y, faces[i].width, faces[i].height);    
      
    }
  }
  
}

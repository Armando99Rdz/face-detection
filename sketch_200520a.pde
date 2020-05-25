import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

Capture video;
OpenCV opencv;
Rectangle[] faces;


void setup() {
  size(640,480);
  
  //opencv = new OpenCV(this, "test.jpg");
  opencv = new OpenCV(this,640,480);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
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
      strokeWeight(2);
      stroke(0,255,0);
      noFill();
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
      //if(faces[i].x < (640/2) - faces[i].x){
       
    }
  }
  
}

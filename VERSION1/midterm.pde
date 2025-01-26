color pix[][] = new color[900][1040];
void setup(){
  
  size(900,1039);
  background(255);
  fractal(900,1040,0);
  for(int i =0;i<6;i++){
    if(i==0)translate(600,0);
    else if(i==1)translate(-300,520);
    else if(i==2)translate(-600,0);
    else if(i==3)translate(-300,-520);
    else if(i==4)translate(300,-520);
    else if(i==5)translate(600,0);
    fractal(900,1040,0);
  }
  for(int y =0;y<height;y++){
      for(int x =0;x<width;x++){
        pix[x][y] = get(x,y);
      }
  }
}

void draw(){
  
  color c= pix[mouseX][mouseY];
  fill(c);
  double t = 100000000;
  int x=0;
  int y=0;
  for(int i =0; i<7;i++){
    if(i==0){x=450;y=520;}
    else if(i==1){x=150;y=0;}
    else if(i==2){x=750;y=0;}
    else if(i==3){x=-150;y=520;}
    else if(i==4){x=1050;y=520;}
    else if(i==5){x=150;y=1040;}
    else if(i==6){x=750;y=1040;}
    if(Math.sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y))<=t){
      t=Math.sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y));
    }
  }
  double size = t/6;
  if(size<12){
    size=12;
  }
  circle(mouseX,mouseY,(int)size);
}
void mousePressed() {  
  
  background(255);
  fractal(900,1040,0);
  for(int i =0;i<6;i++){
    if(i==0)translate(600,0);
    else if(i==1)translate(-300,520);
    else if(i==2)translate(-600,0);
    else if(i==3)translate(-300,-520);
    else if(i==4)translate(300,-520);
    else if(i==5)translate(600,0);
    fractal(900,1040,0);
  }
  for(int y =0;y<height;y++){
      for(int x =0;x<width;x++){
        pix[x][y] = get(x,y);
      }
  }
}

void fractal(float x, float y,float z){
  
  noStroke();
  fill(z); 
  pushMatrix();
  translate(450,520);
  for(int i =0;i<6;i++){
    triangle(0,-y/2,-x/6,-y/4,x/6,-y/4);
    rotate(PI/3);
  }
  popMatrix();
  pushMatrix();
  translate(450,520);
  rotate(PI/6);
  translate(-450,-520);
  if(x>1){
    
    fractal((x/3)*1.73,(y/3)*1.73,200-z);
  }
  popMatrix();
}

    

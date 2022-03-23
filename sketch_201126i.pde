float xoff=0,yoff=0,zoff=0;
float xoff1=0,yoff1=0,zoff1=0;
float x,y,xn,yn;
float a=PI/2;
float ca=PI/2;
float change = 0;
float leng = 5;
float branch =0;
float ranleng=0;
int dead=0;
float treew=40;
int countim=(int)random(1000);
void setup(){
  size(480,640);
  
  background(255,242,178);
  x=width/2 + 0.001;
  y=height;
}
void draw(){
  frameRate(120);
  stroke(0,10 + 100*branch/200);
  zoff+=0.01;
  yoff+=abs((height-y)/height)*1.5*(0.1+random(1.8));//fuck around with these values and others with the '$'in the comments
 // if((abs(x-width/2)>25)||(y<440))
  
  xoff+=abs((width/2-x)*1.5/width)*(-0.7+random(1.4));//$
  
 // xoff+=abs(((width/2-x+1)*2/width)*0.001);
  //xoff1+=0.0123;
  //yoff1+=0.0222;
  /*if(yn>0)
  {
  xn=x+map(noise(xoff,yoff),0,1,(y-height)*0.01,(height-y)*0.01);
  }else{
    xn=x+map(noise(xoff,yoff),0,1,-10,10);
  }*/
  //yn=y-map(noise(xoff1,yoff1),0,1,-10,20);
  if((y<500)||(abs(x-width/2)>treew/2)){//$
  a= map(noise(yoff,xoff),0,1,ca-1.25*PI/2,ca+1.25*PI/2);//$
  }
  else{
    ca=a;
  if((a<6*PI/5)&&(a>-PI/5))//$
  {
    a = map(noise(yoff,xoff,zoff),0,1,ca-0.01*PI/2,ca+0.01*PI/2);
   a += map(noise(xoff,yoff,zoff),0,1,(PI/2)*pow(0.9*(height-y)/(height-440),2),(-PI/2)*pow(0.9*(height-y)/(height-440),2));//$
  }else
  {
    dead=1;
  }
  }
  /*if((y<320)&&(y>300)&&(change==0))
  {
    change = random(PI) - PI/2;
  }else{
    change=0;
  }
  a += change;*/
  
  leng = 5 + 25*(branch)/200;//$
  
  if(y<630)
  {
  xn=x+(float)(leng*Math.cos(a));
  yn=y-(float)(leng*Math.sin(a));
  }else{
    if(x>width/2)
    {
    xn=x+(float)(leng*Math.cos(PI-Math.atan((y-550)/abs( width/2 - x))));
    }else{xn=x+(float)(leng*Math.cos(Math.atan((y-550)/abs( width/2 - x))));}
  yn=y-(float)(leng*Math.sin(Math.atan((y-550)/abs( width/2 - x))));
  }
  line(x,y,xn,yn);
  x=(xn+x)/2;
  y=(y+yn)/2;
  if((y<500)||(abs(x-width/2)>treew/2))
  {
  branch=sqrt(pow(x-width/2,2)+pow(500-y,2));
  }
  if((y>height+10)||(y<200)||(x<0)||(x>width)||(branch>200+ranleng)||(dead==1))//$
  {
    ranleng = random(40);//$

    x=(width/2)+random(treew)-treew/2;//$
    if(x==width/2)
    {
      while(x==width/2)
      {
      x=(width/2)+random(treew)-treew/2;
      }
    }
    y=height;
    a=PI/2; //+ random(0.1)-0.05;
    dead=0;
    branch=0;
    //yoff=yoff/map(noise(yoff*random(10)),0,1,0,yoff);
  }
}

void mouseClicked()
{
  saveFrame("frames/"+str(year())+str(month())+str(day())+str(hour())+str(minute())+str(second())+".png");
}

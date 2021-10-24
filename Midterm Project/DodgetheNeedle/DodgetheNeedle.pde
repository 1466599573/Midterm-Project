Neddle [] Neddles = new Neddle[100];
int num = 1;
float rspeed = 1.5;
int level = 20,need = level;
boolean gameBegin = false,win = false , lose = false ,gameOver = false;
int count =0;
void setup()
{
  size(500,800);
  Neddles[0]=new Neddle(num);
}
void draw()
{
  translate(width/2,height/2.5);
  if(keyPressed && key == 'r' && gameBegin ==false)
  {
    gameBegin = true;
  }
   if(gameBegin ==false)
  {
    showBegin();
    return;
  }
  if(win)
  {
    count+=1;
    if(count >10)
    {
    showWin();gameOver=true;
    }
  }
  if(lose)
  {
    count+=1;
    if(count >10){
    showLose();gameOver=true;
    }
  }
  if(keyPressed && key == 'r')
  {
    gameOver = false;
  }
  if(gameOver)
  {
    return;
  }
  
 
  
  background(255);
  Neddles[0].display();
  for(int i = 1;i<num-1;i++)
  {
    Neddles[i].display();
  }
  if(num>1 && Neddles[num-2].spin())
 
  {
    need = level-num+1;
    Neddles[num-1].display();

    for(int i = 0; i<num-2;i++)
    {
      if(abs(Neddles[i].Neddle_angle-Neddles[num-2].Neddle_angle)<7)
      {
        Neddles[i].c=#FF0000;
        Neddles[num-2].c=#FF0000;
        lose = true;
      }
    }
   if(need <= 0 && !lose)
   
    {
       win = true;
    }
  }
  
  
  noStroke();
  fill(0);
  ellipse(0,0,160,160);
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text(need,0,23); 
  fill(0);
  text("Level:"+level,-width/5,-height/4);
}
void mouseClicked()
{
  Neddles[num-1].speed = 30;
  num++;
  Neddles[num-1] = new Neddle(num);
}
class Neddle
{
  int num;
  float x,y;
  int w=2,l=120,r=20;
  int c = #000000;
  float speed,Neddle_angle=0;
  Neddle(int num)
  {
    x = 0;
    y = 350;
    this.num = num;
    speed = 0;
  }
  void display()
  {
    if( !spin())
    {
      noStroke();
      fill(c);
      rectMode(CENTER);
      rect(x,y,w,l);
      ellipse(x,y+l/2,r,r);
      textAlign(CENTER);
      fill(255);
      textSize(15);
      text(num,x,y+l/2+5);
      y-=speed;
    }else
    {
      
      
      pushMatrix();
      rotate(radians(Neddle_angle));
      noStroke();
      fill(c);
      rectMode(CENTER);
      rect(x,y,w,l);
      ellipse(x,y+l/2,r,r);
      textAlign(CENTER);
      fill(255);
      textSize(15);
      text(num,x,y+l/2+5);
      popMatrix();
      Neddle_angle+=rspeed;
      Neddle_angle=Neddle_angle%360;
      
    }
  }
    boolean spin()
  {
    if(y<=70+l/2)return true;
    else return false;
  }
}
void showBegin()
{
  background(0);  
  textAlign(CENTER); 
  fill(255);
  textSize(35);
  text("Dodge The Needle",0,-50);
  text("Level "+level,0,0);
  textSize(20);
  text("Press r to start",0,50);
}
void showWin()
{
  win = false;
  fill(0,0,255,80);
  rect(0,0,width,2*height); 
  textAlign(CENTER); 
  fill(255);
  textSize(35);
  text("You win!",0,0);
  level +=1;
  text("Press r to continue Level "+ level,0,50);
  num = 1;
  need = level;
  Neddles = new Neddle[100];
  Neddles[0]=new Neddle(num);
  count = 0;
}
void showLose()
{
  lose = false;
  fill(255,0,0,80);
  rect(0,0,width,2*height);
  textAlign(CENTER); 
  fill(255,0,0);
  textSize(35);
  text("Hey,loser!",0,0);
  text("Press r to continue Level "+ level,0,50);
  num = 1;
  need = level;
  Neddles = new Neddle[100];
  Neddles[0]=new Neddle(num);
  count = 0;
}

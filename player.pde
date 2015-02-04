public class Player{
  int playerNum = 1;
  int numofOxy=5;
  int cryDuck=0;
  int numSword=0;
  int rocketCog =0;
  int rocketFuel =0;
  int powerCrystal = 0;
  int rocketEngine =0;
  int decoded =0;
  int playX=20;
  int playY=20;
  int charSpaceX=0 ;
  int charSpaceY= 0;
  
 public void player(){
      
 } 
 
 public void playerMove(int tempX,int tempY){
   playX=tempX;
   playY=tempY;
   numofOxy--;
   print(numofOxy);
   
   
 }
 public void drawPlayer(){
   fill(255,100,255);
   rect(playX,playY,30,30);
   image(maleChar,playX, playY,50,50);
 }


public void stuffGet(int thing){
  switch(thing) {
  case 0: 
    println("Oxygen");
    if(numofOxy<11){
     numofOxy= numofOxy +5;
    } 
    break;
  case 1: 
    println("Crystal Duck"); 
     cryDuck = 1;
    break;
  case 2:
    println("Sword");
    numSword = 1;
    break;
  case 3:
    println("Cog");
    rocketCog=1;
    break;
  case 4:
   println("Blank");
    break;
  case 5:
    println("Fuel");
    rocketFuel = 1;
    break;
  case 6:
    println("Engine");
    rocketEngine = 1;
    break;
  case 7:
    println("Space Duck");
    break;
  case 8:
    println("Hieroglyphs");
    decoded =1;
    break;
  case 9:
    println("Power Crystal");
      powerCrystal ++;
    break;  
  }
}

public void drawStuff(){
  //745 150 o2
  if(numofOxy >=1){
  image(oxygenTank,725,310,100,105);
  }
  if(numofOxy>5){
  image(oxygenTank,725,410,100,105);
  }
  if(numofOxy>10 ){
  image(oxygenTank,725,510,100,105);
  }
  if(numSword>0){
    image(swordFile,320,720,100,100);
  }
  if(rocketCog>0){
    image(rockCog,400,750,50,50);
  }
  if(rocketEngine>0){
    image(rockEngine,460,750,50,50);
  }
  if(rocketFuel>0){
    image(rockFuel,520,750,50,50);
    
  }
  
  if(cryDuck > 0){
   image(cryingDuck,580,750,50,50); 
  }
  
   if(powerCrystal >0){
    image(jO,640,750,50,50); 
   }
   if(powerCrystal >1){
    image(jO,700,750,50,50); 
   }
   if(powerCrystal >2){
    image(jO,760,750,50,50); 
   }
   
}


}

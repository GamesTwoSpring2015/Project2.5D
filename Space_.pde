//create game board
boardSpace[][] board = new boardSpace[10][10];
boolean hasGen = false;
Player Steve = new Player();
PImage maleChar;
PImage oxygenTank;
int turnNum =0;
PImage swordFile;
PImage rockCog;
PImage rockEngine;
int rolledD20;
boolean duckCaveDisc = false;
int duckCaveX =0;
int duckCaveY =0;
boolean hiDisc = false;
int hiX =0;
int hiY =0;
PImage rockFuel;
PImage cryingDuck;
PImage jO;
boolean  fightDuck =false;
int movement =0;
boolean win =false;
int distMove = -75;
boolean moved = true;
boolean beatDuck = false;
int numSpaceDuck = 1;
int numCryDuck = 2;
int numPowerCrystal = 5;
int numO2 =15;
int rollingFight = 0;
int numHyro = 1;
int numScrew =2;
int numFuel = 2;
int numSword =3;
int numCog = 2;
boolean died =false;
//0 =no event space
void setup() {
  size(820, 820);
  maleChar = loadImage("CharactersCleanup.png");
  oxygenTank = loadImage("PaintedO2.png");
  swordFile = loadImage("sword.png");
  rockCog = loadImage("rocketcog.png");
  //Im lazy the engine is now a scew driver thanks taylor....so grey
  rockEngine = loadImage("rocketscrewdriver.png");
  rockFuel = loadImage("rocketfuel.png");
  cryingDuck = loadImage("cryDuck.jpg");
  jO = loadImage("cry.jpg");
  //run randomize spaces


  for (int j =0; j<10; j++) {
    for (int k =0; k<10; k++) {
      board[j][k] = new boardSpace();  
      setRandSpaceType(j, k);




      // print(board[j][k].spaceEvent());
    }
  }
}


void draw() {
  //draw game board  
  background (0);
  rect(20, 20, 700, 700, 4);

  int x1=20;
  int x2 =20;
  int y1 =0;
  int y2 = 0;
  //create spaces
  for (int i=0; i<10; i++) {
    x1=x1+70;
    y1=y1 +0;
    x2=x2+70;
    y2=y2+740;
    line(x1, y1, x2, y2);
    line(y1, x1, y2, x2);
  }

  for (int i=0; i<10; i++) {
    for (int j=0; j<10; j++) {
      x1 = 20 + i*70;
      y1 = 20 + j*70;
      if (x1 < 21 || y1 < 21 || x1 > 600 || y1 > 600) {
        if (board[i][j].colorStr == "blue") {
          board[i][j].colorStr = "green";
        }
      }
      if (board[i][j].colorStr == "blue") {
        fill(158, 188, 240);
      }
      if (board[i][j].colorStr == "white") {
        fill(255, 255, 255);
      } else if (board[i][j].colorStr == "green") {
        fill(118, 227, 147);
      }
      board[i][j].xSpot = x1;
      board[i][j].ySpot = y1;
      rect(x1, y1, 70, 70);
     // Steve.drawPlayer();
    }
  }
  textSize(46);
  text("Roll:", 725, 65);
  text( movement, 755, 115);
  fill(60, 240, 228);
  textSize(40);
  text("Turn", 725, 175);
  text("#"+ turnNum, 725, 225);
  textSize(56);
  text("O2:", 725, 300);
  textSize(64);
  text("Key Items:", 20, 795);
  //Steve.drawStuff();
  if (died==true) {
    fill(255, 0, 0);
    textSize(100);
    text("You Suffocated", 100, 350);
  }
  if (win==true) {
    fill(0, 255, 128);
    textSize(100);
    text("You Win", 100, 350);
  }

  

  //draw the cave
  if (duckCaveDisc&& fightDuck==false) {
    fill(0, 0, 0);
    rect(duckCaveX, duckCaveY, 70, 70)  ;
  }
    //draw the glyphs
  if (hiDisc) {
    fill(127, 0, 127);
    rect(hiX, hiY, 70, 70)  ;
  }
   
  
  Steve.drawPlayer();
  Steve.drawStuff();
  
  if (fightDuck ) {
    rect(0, 0, 870, 870 );
    fill(0, 0, 0);
    textSize(50);
    text("You Must Roll Greater than a 10 to ", 5, 50);
    text("Defeat The Space Duck:", 110, 100);
    textSize(32);
    text("(press any key to roll)", 235, 132);
    text(rollingFight, 400, 164);

    if (rollingFight>10) {
      fightDuck=false;
      win = true;
    }
    if (rollingFight<11 && rollingFight>0)
    {

      fightDuck=false;
    }
  }  
 }
void mousePressed() {
  int xCoord = mouseX - 20;
  int yCoord = mouseY - 20;
  int xSpace = xCoord / 70;
  int ySpace = yCoord / 70;
  distMove = ( abs(Steve.charSpaceX - xSpace) + abs(Steve.charSpaceY -ySpace));
  if (xCoord < 690 && xCoord > 10 && yCoord < 690 && yCoord >15) {
    if (distMove <= movement && movement !=0 && moved == false) {
      if (Steve.charSpaceX == 0 ||Steve.charSpaceX == 9 ||Steve.charSpaceY == 0 ||Steve.charSpaceY == 9) {
        board[Steve.charSpaceX][Steve.charSpaceY].colorStr="green";
      } else {
        board[Steve.charSpaceX][Steve.charSpaceY].colorStr="blue";
      }
      if (board[Steve.charSpaceX][Steve.charSpaceY].spaceEvent() != 7 && board[Steve.charSpaceX][Steve.charSpaceY].spaceEvent() !=8) {
        // print("EFJEEFUOLJNDJFDKLSVJDFNDFN");
        setRandSpaceType(Steve.charSpaceX, Steve.charSpaceY);
      }

      //move to new space
      board[xSpace][ySpace].colorStr = "white";
      //used to hold get stuff
      Steve.playerMove(xCoord, yCoord);

      moved = true;
      movement = 0;
      Steve.charSpaceX = xSpace;
      Steve.charSpaceY = ySpace;
      Steve.stuffGet(board[xSpace][ySpace].spaceEvent());
      turnNum ++;
      println("LOOOOOOOOOOK:");
      print(xSpace, "  ", ySpace);
      if (Steve.numofOxy==0)
      {
        died=true;
      }
      if (Steve.rocketCog == 1 && Steve.rocketEngine ==1 && Steve.rocketFuel ==1) {
        win=true;
      }
      if (Steve.cryDuck >0 && board[Steve.charSpaceX][Steve.charSpaceY].spaceEvent()==7 && Steve.numSword>0) {
        fightDuck = true;


        win=true;
      }

      if (Steve.powerCrystal >2 && board[Steve.charSpaceX][Steve.charSpaceY].spaceEvent()==8) {
        win=true;
      }
      if (board[Steve.charSpaceX][Steve.charSpaceY].spaceEvent()==7) {
        duckCaveX = board[Steve.charSpaceX][Steve.charSpaceY].xSpot;
        duckCaveY = board[Steve.charSpaceX][Steve.charSpaceY].ySpot;
        duckCaveDisc = true;
      }
       if (board[Steve.charSpaceX][Steve.charSpaceY].spaceEvent()==8) {
        hiX = board[Steve.charSpaceX][Steve.charSpaceY].xSpot;
        hiY = board[Steve.charSpaceX][Steve.charSpaceY].ySpot;
        hiDisc = true;
      }
    }
  }
  if (xCoord >700 && xCoord< 800 && yCoord<45  &&yCoord >10 ) {
    float  tempMove = random(4);
    movement = int(tempMove +1);
    moved = false;
  }
}




void setRandSpaceType(int p, int q ) {   

  float  tempSpotType = random(10);
  int intTempSpotType= int(tempSpotType);
  boolean highlands;
  //check for highlands
  if ( p == 0 ||p == 9 ||q == 0 ||q == 9) {
    highlands =true;
  } else {
    highlands = false;
  }

  //space duck
  if ((intTempSpotType == 7 && numSpaceDuck <1)  ||( intTempSpotType ==7 && highlands ==false) )
  {
    intTempSpotType=4;
    println("no more space duck");
  } 
  if (intTempSpotType == 7 &&numSpaceDuck==1 && highlands) {
    println("space duck");
    numSpaceDuck --;
  }
  //crystal duck
  if ((intTempSpotType == 1 && numCryDuck <1) || (intTempSpotType ==1 && highlands ==false ))
  {
    intTempSpotType=0;
    println("No more cry duck");
  } 
  if (intTempSpotType == 1 &&numCryDuck>0 && highlands) {
    println("cry duck");
    numCryDuck --;
  }

  //hieroglyphs
  if ((intTempSpotType == 8 && numHyro <1)  ||( intTempSpotType ==8 && highlands ==false))
  {
    intTempSpotType=4;
    println("no more hyro");
  } 
  if (intTempSpotType == 8 &&numHyro>0 &&highlands) {
    println("hieroglyphs");
    numHyro --;
  }

  //power crystals
  if ((intTempSpotType == 9 && numPowerCrystal <1) || (intTempSpotType ==9 && highlands ==false))
  {
    intTempSpotType=4;
    println("no more cystal");
  } 
  if (intTempSpotType == 9 &&numPowerCrystal>0 && highlands) {
    println("Power Crystal");
    numPowerCrystal --;
  }

  //ScrewDriver
  if ((intTempSpotType == 6 && numScrew <1 )||( intTempSpotType ==6 && highlands ))
  {
    intTempSpotType=0;
    println("no more ScrewDriver");
  } 
  if (intTempSpotType == 6 &&numScrew>0 && highlands ==false) {
    println("ScrewDriver");
    numScrew --;
  }



  //Fuel
  if ((intTempSpotType == 5 && numFuel<1) || (intTempSpotType ==5 && highlands ))
  {
    intTempSpotType=0;
    println("no more Fuel");
  } 
  if (intTempSpotType == 5 &&numFuel>0 && highlands ==false) {
    println("Fuel");
    numFuel --;
  }

  //Cog
  if ((intTempSpotType == 3 && numCog <1 )|| (intTempSpotType ==3 && highlands ))
  {
    intTempSpotType=0;
    println("no more Cogs");
  } 
  if (intTempSpotType == 3 &&numCog >0 && highlands ==false) {
    println("Cog");
    numCog --;
  }
  //Sword
  if ((intTempSpotType == 2 && numSword <1 )|| (intTempSpotType ==2 && highlands ==false))
  {
    intTempSpotType=4;
    println("no more swords");
  } 
  if (intTempSpotType == 2 &&numSword >0 && highlands) {
    println("Sword");
    numSword --;
  }
  //Oxygen
  if ((intTempSpotType == 0 && numO2 <1 )|| (highlands && intTempSpotType == 0))
  {
    intTempSpotType=4;
    println("no more O2");
  } 
  if (intTempSpotType == 0 && numO2>0 && highlands ==false) {
    println("02");
    numO2 --;
  }





  int leftovers = numCog+numScrew+numFuel+numPowerCrystal+numCryDuck+numHyro +numSword;
  println("leftovers");
  print(leftovers); 
  board[p][q].spotType = intTempSpotType;
}

void keyPressed() {
  if (fightDuck&& rolledD20 == 0) {
    float  tempRollingFight = random(20); 
    rollingFight = int(tempRollingFight +1);
    rolledD20 = 1;
  } else {
    float  tempMove = random(4);
    movement = int(tempMove +1);
    moved = false;
  }
}


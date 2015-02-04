public class boardSpace {
  public int xSpot =0;
  public int ySpot=0;
  public int spotType=0;
  public String colorStr="blue";


  public void changeImage(int image) {
    if (image == 0) {
      colorStr="blue";
    }
  }


  public boardSpace() {
  }




  public int spaceEvent() {
    switch(spotType) {
    case 0: 
      println("Oxygen"); 
      break;
    case 1: 
      println("Crystal Duck"); 
      break;
    case 2:
      println("Sword");
      break;
    case 3:
      println("Cog");
      break;
    case 4:
      println("Blank");
      break;
    case 5:
      println("Fuel");
      break;
    case 6:
      println("Engine");
      break;
    case 7:
      println("Space Duck");
      break;
    case 8:
      println("Hieroglyphs");
      break;
    case 9:
      println("Power Crystal");
      break;
    }
    return spotType;
  }

  public void duckMake() {
    spotType = 77;
  }
}


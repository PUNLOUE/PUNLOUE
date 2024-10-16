
 // Class Chimney
class Chimney {
  String type;

  Chimney(this.type);
}

// Class Window
class Window {
  String type;
  String color;
  String position;
  Window(this.type,this.color,this.position);
}

// Class Door
class Door {
  String type;
  String color;
  String position;
  Door(this.type,this.color,this.position);
}

// Class Roof
class Roof {
  String type;
  List<Chimney> chimneys =[];
  Roof(this.type, this.chimneys);
}

// Class Stair
class Stair {
  List<Window> windows =[];
  List<Door> doors =[]; 

  Stair(this.windows, this.doors);
}

 // Class House
class House {
  String address;
  Roof roof;
  List<Stair> stairs = [];

  House(this.address,this.roof, this.stairs);

  void addStair(Stair newStair) {
    this.stairs.add(newStair);
  }
}

void main(){

//create 1 house
// Create Stairs
  List<Window> stair1Windows = [Window('Rectangle', 'red', 'left'), Window('Rectangle', 'red', 'right')];
  List<Door> stair1Doors = [Door('Rectangle', 'black', 'center')];
  Stair stair1 = Stair(stair1Windows, stair1Doors);

  List<Window> stair2Windows = [Window('Rectangle', 'red', 'left'), Window('Rectangle', 'green', 'right')];
  List<Door> stair2Doors = [];
  Stair stair2 = Stair(stair2Windows, stair2Doors);

  // Create Roof with Chimneys
  List<Chimney> chimney1 = [Chimney('Rectangle')];
  Roof myRoof1 = Roof('Triangle', chimney1);

  //Create a house
   House myHouse = House('123 Main St', myRoof1, [stair1, stair2]);

//Create 2 house
// Create Stairs
  List<Window> stair1Windowshouse2 = [];
  List<Door> stair1Doorshouse2 = [];
  Stair stair1house2 = Stair(stair1Windowshouse2, stair1Doorshouse2);

  List<Window> stair2Windowshouse2 = [Window('green', 'red', 'left')];
  List<Door> stair2Doorshouse2 = [];
  Stair stair2house2 = Stair(stair2Windowshouse2, stair2Doorshouse2);

  // Create Roof with Chimneys
  List<Chimney> chimney1house2 = [Chimney('Rectangle')];
  Roof myRoof1house2 = Roof('Double_tringle', chimney1house2);

  //Create a house
   House myHouse2 = House('123 Main St', myRoof1house2, [stair1house2, stair2house2]);






  

  

}

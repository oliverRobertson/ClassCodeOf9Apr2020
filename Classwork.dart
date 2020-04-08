  import 'dart:io';
  
  class App{
    List<String> property = [];

    String takeInput() => stdin.readLineSync();

    cls() => print("\x1B[2J\x1B[0;0H");

    menu(){
      cls();
      print("1 for add item");
      print("2 for list of items");
      print("3 for exit");
      print("4 for search");
      switch (takeInput()) {
        case "1":
          add();
          break;
        case "2":
          list();
          break;
        case "4":
          search();
          break;
        default:
          print("Are you sure? Y/N");
          var ans = takeInput();
          if(ans.toLowerCase() == 'y'){
            print("Good Bye & Take Care! Press anykey to exit");
            takeInput();
            cls();
            return;
          }
          
      }
      menu();
    }

    add(){
      print("Enter an item");
      property.add(takeInput());
    }

    list(){
      property.forEach((item) => print(item));
      takeInput();
    }

    search(){ 
      print("Enter keyword");
      var keyword = takeInput();
      var filterd = property.where((item){
          return item.toLowerCase().contains(keyword.toLowerCase());
      });
      print("${filterd.length} items found");
      filterd.forEach((name){
        print(name);
      });
      takeInput();
    }
  }
  
void main(){
    App().menu();
}

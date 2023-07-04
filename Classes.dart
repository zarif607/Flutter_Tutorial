/* void main() {

  Student student1 = new Student(23, "Peter");  // This is a reference variable
  print("${student1.id} and ${student1.name}");
  student1.sleep();
  student1.study();

  Student student2 = new Student(24, "Osama");  // This is a reference variable
  print("${student2.id} and ${student2.name}");
  student2.sleep();
  student2.study();

  Student student3 = new Student.myNamedConstructor();  // This is a reference variable
  student3.id = 68;
  student3.name = "Hafeez";  
  print("${student3.id} and ${student3.name}");
  student3.sleep();
  student3.study();
}

class Student {
  int id = -1;         // Instance or Field Variable
  String name = "NAME";     // Instance or Field Variable

  // Class constructor
 /* Student() {
    print("This is the default class constructor");
  } */

  /* Student(int id, String name) {
    this.id = id;
    this.name = name;

    /* Alternative way of writing this:
    id = _id;
    name = _name; */
  } */

  // Shortcut class constructor:
  Student(this.id, this.name);

  Student.myNamedConstructor() {
    print("This is a named constructor");
  }

  void study() {
    print("${this.name} is studying");
  }
  
  void sleep() {
    print("${this.name} is sleeping");
  }
}
 


void main() {
  Student student1 = new Student();
  student1.name = "Peter";      // Setter - Implied
  print(student1.name);         // Getter - Implied

  student1.percentage = 438.0;
  print(student1.percentage);

}

class Student {
  
  String? name;               // Instace variable with default getter and setter
  // To make the var private to this class, we put an underscore before the variable name
  double? _percent;

  // Instance variable with custom setter
  void set percentage(double? marksSecured) => _percent = marksSecured!/500*100;
  
  // Instance variable with custom getter
  double? get percentage => _percent;                      
}


// EXPLORING INHERITANCE
void main() {

  Dog dog = new Dog();
  dog.breed = "Labrador";
  dog.color = "Black";
  dog.bark();
  dog.eat();

  Cat cat = new Cat();
  cat.age = 2;
  cat.color = "Brown";
  cat.meow();
  cat.eat();

  Animal animal = new Animal();
  animal.color = "White";
  animal.eat();
}

class Animal {
  String? color;

  void eat() {
    print("Eat");
  }
}

class Dog extends Animal {
  String? breed;

  void bark() {
    print("Bark");
  }
}

class Cat extends Animal {
  int? age;

  void meow() {
    print("Meooow");
  }
}

// METHOD OVERRIDING

void main() {

  var dog = Dog();
  dog.eat();
  dog.color = "Black";
  print(dog.color);

}

class Animal {
  String color = "Brown";

  void eat() {
    print("The animal is eating");
  }
}

class Dog extends Animal {
  String? breed;

  void bark() {
    print("Bark");
  }

  void eat() {
    
    print("The DOGGO is eating");
    super.eat();
  }
}

class Cat extends Animal {
  int? age;

  void meow() {
    print("Meooow");
  }
}

// Inheritance with default and parameterised constructor
// Inheritance with named constructor
void main() {
  Dog dog1 = Dog("Labrador", "Brown");
  print(dog1.color);
  print("");

  Dog dog2 = Dog("Pug", "White");
  print(dog2.color);
  print("");

  Dog dog3 = Dog.myDogNamedConstructor();
  print(dog3.color);
}

class Animal {

  String? color;

  Animal(String color) {
    this.color = color;
    print("Animal Class Constructor");
  }

  Animal.myAnimalNamedConstructor() {
    print("Animal class NAMED constructor");
  }
}

class Dog extends Animal {

  String? breed;

  Dog(String breed, String color) : super.myAnimalNamedConstructor() {
    this.breed = breed;
    print("Dog Class Constructor");
  }

  Dog.myDogNamedConstructor() : super.myAnimalNamedConstructor() {
    print("Dog class NAMED constructor");
  }
}

// ABSTRACT CLASS
// ABSTRACT METHOD
void main() {

  //var shape = Shape();        // Abstract classes cannot be instantiated

  var rect = Rectangle();       // Classes extending abstract classes CAN be instantiated
  rect.draw();
 
  Circle circle = new Circle();
  circle.draw();
}

abstract class Shape {
  late int x;
  late int y;
  
  // Abstract method only instantiated inside abstract class
  // Abstract methods can only be declared inside abstract classes
  void draw();                
  
  void myNormalFunction() {
    print("This is not an abstract method");    // Normal functions can be defined inside abstract classes
  }
}

class Rectangle extends Shape {
  
  @override
  void draw() {
    // Implementation of abstract method done here
    print("Drawing rectangle... ...");
  }
}

class Circle extends Shape {
  
  @override
  void draw() {
    // Implementation of abstract method done here
    print("Drawing circle... ...");
  }
}


//DART INTERFACES
void main() {

  var tv = Television();
  tv.volumeDown();
  tv.volumeUp();

}

class Remote {

  void volumeUp() {
    print("______Volume up from Remote______");
  }

  void volumeDown() {
    print("______Volume down from Remote______");
  }
}

class AnotherClass {
  void anotherMethod(){
    
  }
}

// We use 'Extend' to create a subclass and 'Implements' to apply an interface
// A class can implement multiple interfaces
class Television implements Remote, AnotherClass{    
  @override
  void volumeDown() {
    // TODO: implement volumeDown
    print("______Volume up from Television______");
  }

  @override
  void volumeUp() {
    //super.volumeUp(); //This cannot be done as Remote is an interface and not a super-class
   
    print("______Volume down from Television______");

  }
  
  @override
  void anotherMethod() {
    // TODO: implement anotherMethod
    print("Yet another method... ...");
  }
}
 /* OUTPUT IF SUPERCLASS
______Volume up from Television______
______Volume up from Remote______
______Volume down from Television______ */
 /* OUTPUT IF INTERFACE
______Volume up from Television______
______Volume down from Television______ */




// STATIC METHODS AND VARIABLES
void main() {
  // Static variables cannot be accessed from a class object
  //var circle = Circle();
  //print(circle.pi);

  // Rather, static variables and methods are accessed from the class itself
  print(Circle.pi);         // Static members do not consume memory until initialized
  Circle.calculateArea();
}

class Circle {
  static const double pi = 3.14; // const added so that its value cannot be altered
  static int maxRadius = 5;

  late String color;

  // Static methods have nothing to do with class instance or objects
  static void calculateArea() {
    print("Some code to calculate the area");
//    normalFunction(); // Instance methods can't be accessed from a static method.
//    this.color;       // 'this' keyword and instance variables can't be accessed from a static method.
    pi;                 // Although static variables and methods can be accessed from static methods
    Circle.maxRadius;
  }

  void normalFunction() {
    Circle.calculateArea();
    this.color = "Red"; // This is okay
    print(pi);
    print(Circle.maxRadius);
  }
}


// LAMBDA (or nameless) FUNCTIONS
void main() {

  //1st Way: Function body assigned to a variable of class 'Function'
  Function addTwoNumbers = (int a, int b) {
                                var sum = a+b;
                                print(sum);
                              };

  var multiplyByFour = (int number) { return number* 4; };

  //2nd Way: Function Expressions using fat arrow
  Function addNumbers = (int a, int b) => print(a+b);

  var multiplyWithFour = (int number) => number*4;

  //Calling the Lambda Functions
  addTwoNumbers(2,5);
  print(multiplyByFour(5));  // Since this function has a return value, we manually print it

  addNumbers(2,5);
  print(multiplyWithFour(5));
}

void addIntegers(int a, int b) {
  var sum = a+b;
  print(sum);
}

//HIGHER-ORDER FUNCTIONS
void main() {
  
  Function addNumbers = (int a, int b) => print(a+b);

  someFunction("Hello", addNumbers);

  var myFunc = taskToPerform();
  print(myFunc(10));
}

void someFunction(String message, Function myFunction) {
  print(message);
  myFunction(2,5);
}

Function taskToPerform() {
  var multiplyWithFour = (int number) => number*4;

  return multiplyWithFour;
}


// **DART COLLECTIONS**
// LIST: Ordered collection of items
void main() {

  List myList = [];
  print(myList);
  var numbersList = [10,20,30,40];
  numbersList.add(50);
  
  var names =[];
  names.add("RED");
  //names.addAll(numbersList);

  print(numbersList);
  print(numbersList[1]);

  print(names);
  names.insert(1, "Blue");
  names.insertAll(1,numbersList);
  names[0] = "Red";
  names.replaceRange(1,6,[1,2,3,4,5]);
  names.removeRange(0,2);
  print(names);
  print("Length of list: ${names.length}");
  print("Last element: ${names.last}");
  print("First element: ${names.first}");
  print("Reversed list: ${names.reversed}");
  print("Is list empty?: ${names.isEmpty}");
  print("Is list NOT empty?: ${names.isNotEmpty}");
  print("Element at index 2 is ${names.elementAt(2)}");

  try {
    names.forEach((element) => print(element*4));
    print(names);
  } catch(e) {
    print("Error: $e");
  }

  names.forEach((element) => print(element));
}

// DART SETS: Unordered list of unique elements
void main() {

  Set<String> countries = Set.from(["Bangladesh", "Myanmar", "Micronesia"]);
  print(countries);

  Set<int> myNums = Set();
  myNums.add(10);
  myNums.add(20);
  myNums.add(20);       // Duplicate entries are ignored
  myNums.add(30);
  myNums.add(30);       // Duplicate entries are ignored
  print(myNums);

  myNums.forEach((element) => print(element));
  print(myNums.contains(30));
  myNums.remove(20);
  print(myNums);
  myNums.clear();
  print(myNums);
}


// MAPS & HASH-MAPS
void main() {

  Map<String, List> fruits = Map();
  fruits["Sweet"] = ["Mango", "Peach"];
  fruits["Sour"] = ["Fig","Kiwi"];

  Map<String,int> countryDiallingCode = {
    "Bangladesh": 088,
    "USA": 1,
    "India": 91
  };

  print(countryDiallingCode);
  countryDiallingCode.forEach((key, value) => print("Contry: $key and Dialling Code: $value"));
  

  print(fruits);
  print(fruits["Sweet"]!.elementAt(1));

  for(var key in fruits.keys){
    print(fruits[key]);
  }

  fruits.containsKey("Sour");     // returns true if KEY present in map
  fruits.update("Sour", (key) => ["Fig","Kiwi","Citrus"]);
  print(fruits["Sour"]);
}*/


// CALLABLE CLASSES
void main() {

  var person1 = Human();
  person1(25, "Peter");

}

class Human {

  call(int age, String name) {
    print("The name of the person is $name and is $age years old"); 
  }

  fell(String name) {
    print("The name of the person is $name"); 
  }

}


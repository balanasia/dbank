//import debug for testing
import Debug "mo:base/Debug";

//create a class that will hold canister
actor DBank {
  //store current value
  var currentValue = 300;
  //assign new value to the variable
  currentValue := 100;

  //constant
  let id = 4735238402;

  //print to console
  Debug.print(debug_show(id));
}
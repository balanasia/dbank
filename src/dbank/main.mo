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

  //create new function
  //make function public
  //input Natural number as amount input
  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  //allows to top down the currentValue
  public func topDown(amount: Nat) {
    let temp: Int = currentValue - amount;
    if(temp >=0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, current value is less than zero");
    }
  }
}
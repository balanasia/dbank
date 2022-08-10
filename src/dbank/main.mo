//import debug for testing
import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

//create a class that will hold canister
actor DBank {
  //orthogonally persistent variable
  stable var currentValue: Float = 300;

  stable var startTime = Time.now();
  //startTime := Time.now();
  Debug.print(debug_show(startTime));

  //create new function
  //make function public
  //input Natural number as amount input
  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  //allows to top down the currentValue
  public func topDown(amount: Float) {
    let temp: Float = currentValue - amount;
    if(temp >=0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, current value is less than zero");
    }
  };

  //create new query function
  //with async Nat return value
  public query func checkBalance(): async Float{
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
      
    //compound equation
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    //will calculate from the current time next time func called
    startTime := currentTime;
  };
} 
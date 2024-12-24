import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 100;
  Debug.print(debug_show (currentValue));

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show (startTime));

  let id = 69;

  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  // Allow user to withdraw an amount from currentValue
  // Decrease the currentValue by the amount

  public func withdraw(amount: Float) {

    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
          currentValue -= amount;
          Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than zero.");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (101 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }
}
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Nat "mo:base/Nat";

actor DBank {
  var currentValue = 300;
  currentValue := 100;

  let id = 69;

  // Debug.print(debug_show(id));

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  // Allow user to withdraw an amount from currentValue
  // Decrease the currentValue by the amount

  public func withdraw(amount: Nat) {

    let tempValue: Int = currentValue - amount;
    if (tempValue >= 0) {
          currentValue -= amount;
          Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than zero.");
    }
  };

  public query func checkBalance(): async Nat {
    return currentValue;
  };

}
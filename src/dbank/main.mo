import Debug "mo:base/Debug";

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
    currentValue -= amount;
    Debug.print(debug_show (currentValue));
  };


}
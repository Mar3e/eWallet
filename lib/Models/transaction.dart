enum Status {
  completed,
  pending,
  failed,
}

class Transaction {
  String sender;
  String receiver;
  double amount;
  DateTime timeStamp;
  // * used enum to prevent the use of other input values
  Status status;

  Transaction(
      this.sender, this.receiver, this.amount, this.timeStamp, this.status);
}

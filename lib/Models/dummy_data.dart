import './transaction.dart';
import 'user.dart';


var userTransactions = <Transaction>[
  Transaction(
      "مرعي بن طالب", "أحمد باشنيني", 150.0, DateTime.now(), Status.completed),
  Transaction(
      "مرعي بن طالب", "معاذ مبيروك", 150.0, DateTime.now(), Status.failed),
  Transaction("مرعي بن طالب", "أحمد باشنيني", 100.0, DateTime(2022, 5, 13),
      Status.completed),
  Transaction(
      "مرعي بن طالب", "أحمد قرعة", 100.0, DateTime(2022, 5, 13), Status.failed),
  Transaction("مرعي بن طالب", "معاذ مبيروك", 1500.0, DateTime(2022, 4, 11),
      Status.pending),
  Transaction("مرعي بن طالب", "أحمد باشنيني", 15000.0, DateTime(2022, 1, 3),
      Status.completed),
];



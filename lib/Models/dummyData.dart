import './cards.dart';
import './transaction.dart';
import './users.dart';

var userCards = <Cards>[
  Cards("123123123", "مرعي", DateTime(2022, 5), 54652,
      "assets/images/kibank.png"),
  Cards("987654321", "مرعي", DateTime(2023, 5), 124365,
      "assets/images/ki2bank.png")
];

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

var users = <Users>[
  Users(132, "مرعي بن طالب", "1111", "mar@gmail.com", 773627506,
      "assets/images/avatar.png"),
  Users(132, "أحمد باشنيني", "2222", "bash@gmail.com", 789456123,
      "assets/images/avatar.png"),
  Users(132, "معاذ مبيروك", "3333", "moath@gmail.com", 321654987,
      "assets/images/avatar.png"),
  Users(132, "أحمد قرعة", "4444", "ahmed@gmail.com", 741852963,
      "assets/images/avatar.png"),
];

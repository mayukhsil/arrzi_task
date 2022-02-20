// ignore_for_file: avoid_dynamic_calls

class TransactionModel {
  TransactionModel({
    this.id,
    this.budget,
    this.spent,
    this.age,
    this.name,
    this.email,
    this.phone,
    this.spends,
  });

  String? id;
  String? budget;
  String? spent;
  int? age;
  String? name;
  String? email;
  String? phone;
  List<Spend>? spends;

  // ignore: sort_constructors_first
  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
    id: json['id'] as String,
    budget: json['budget'] as String,
    spent: json['spent'] as String,
    age: json['age'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    spends: List<Spend>.from(
        json['spends'].map((dynamic x) =>
            Spend.fromJson(x as Map<String, dynamic>),) as Iterable,),
  );
}

class Spend {
  Spend({
    this.id,
    this.amount,
    this.date,
  });

  int? id;
  double? amount;
  DateTime? date;

  // ignore: sort_constructors_first
  factory Spend.fromJson(Map<String, dynamic> json) => Spend(
    id: json['id'] as int,
    amount: json['amount'] as double,
    date: DateTime.parse(json['date'] as String),
  );
}

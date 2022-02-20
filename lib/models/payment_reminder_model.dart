class PaymentReminderModel {
  PaymentReminderModel({
    required this.id,
    required this.paymentReminders,
  });

  String id;
  List<PaymentReminder> paymentReminders;

  // ignore: sort_constructors_first
  factory PaymentReminderModel.fromJson(Map<String, dynamic> json) =>
      PaymentReminderModel(
    id: json['id'] as String,
    paymentReminders: List<PaymentReminder>.from(
      // ignore: avoid_dynamic_calls
    json['payment_reminders'].map(
                (dynamic x) =>
                PaymentReminder.fromJson(x as Map<String, dynamic>),)
    as Iterable,),
  );

}

class PaymentReminder {
  PaymentReminder({
    this.id,
    this.description,
    this.amount,
    this.date,
  });

  int? id;
  String? description;
  double? amount;
  DateTime? date;

  // ignore: sort_constructors_first
  factory PaymentReminder.fromJson(Map<String, dynamic> json) =>
      PaymentReminder(
    id: json['id'] as int,
    description: json['description'] as String,
    amount: json['amount'] as double,
    date: DateTime.parse(json['date'] as String),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'description': description,
    'amount': amount,
    'date': "${date?.year.toString().padLeft(4, '0')}-"
        "${date?.month.toString().padLeft(2, '0')}-"
        "${date?.day.toString().padLeft(2, '0')}",
  };
}

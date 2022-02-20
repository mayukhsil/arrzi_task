import 'dart:async';
import 'dart:convert';

import 'package:arrzitask/models/payment_reminder_model.dart';
import 'package:arrzitask/models/transaction_model.dart';
import 'package:flutter/services.dart' as root_bundle;


class DashboardRepository{

  Future<TransactionModel> getTransactions() async {
    final loadedJson = await root_bundle.rootBundle.loadString('data/sample_response.json');
    final response = await json.decode(loadedJson) as Map<String, dynamic>;
    return TransactionModel.fromJson(response);
  }

  Future<PaymentReminderModel> getPaymentReminders() async {
    final loadedJson = await root_bundle.rootBundle.loadString('data/payment_reminder.json');
    final response = await json.decode(loadedJson) as Map<String, dynamic>;
    return PaymentReminderModel.fromJson(response);
  }

}

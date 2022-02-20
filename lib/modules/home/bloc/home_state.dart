part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  const HomeLoaded(
      this.transactionModel,
      this.paymentReminderModel,
      this.limitSpent,
      );

  final TransactionModel transactionModel;
  final PaymentReminderModel paymentReminderModel;
  final double limitSpent;

  @override
  List<Object> get props => [transactionModel,paymentReminderModel,limitSpent];
}

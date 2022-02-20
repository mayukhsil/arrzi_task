import 'package:arrzitask/models/payment_reminder_model.dart';
import 'package:arrzitask/models/transaction_model.dart';
import 'package:arrzitask/repository/dashboard_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc(this.dashboardRepository) : super(HomeLoading()) {
    on<LoadDataEvent>((event, emit) async {
      final transactions = await dashboardRepository.getTransactions();
      final paymentReminders = await dashboardRepository.getPaymentReminders();
      final spentLimit =
          (double.parse(transactions.budget!) -
              double.parse(transactions.spent!))/
              double.parse(transactions.budget!);
      emit(HomeLoaded(transactions, paymentReminders, spentLimit));
    });
  }

  @override
  void onEvent(HomeEvent event) {
    on<ReloadDataEvent>((event, emit) async {
      final transactions = await dashboardRepository.getTransactions();
      final paymentReminders = await dashboardRepository.getPaymentReminders();
      final spentLimit =
          (double.parse(transactions.budget!) - double.parse(transactions.spent!))/
              double.parse(transactions.budget!);
      emit(HomeLoaded(transactions, paymentReminders, spentLimit));    });
    super.onEvent(event);
  }

  final DashboardRepository dashboardRepository;
}

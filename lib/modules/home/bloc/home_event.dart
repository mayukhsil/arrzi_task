part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadDataEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ReloadDataEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

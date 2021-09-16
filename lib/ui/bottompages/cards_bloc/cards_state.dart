part of 'cards_bloc.dart';

abstract class CardsState extends Equatable {
  const CardsState();

  @override
  List<Object> get props => [];
}

class CardsInitial extends CardsState {}

class CardsLoadingState extends CardsState {}

class CardsLoadedState extends CardsState {
  final List<ActivityItem> activities;

  CardsLoadedState({@required this.activities});

  @override
  List<Object> get props => [activities];
}

class CardsErrorState extends CardsState {}

class CardsEmptyState extends CardsState {}

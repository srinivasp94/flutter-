part of 'cards_bloc.dart';

abstract class CardsEvent extends Equatable {
  const CardsEvent();

  @override
  List<Object> get props => [];
}

class FetchCardsAndActivitiesEvent extends CardsEvent {}

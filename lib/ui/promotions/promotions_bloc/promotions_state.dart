part of 'promotions_bloc.dart';

abstract class PromotionsState extends Equatable {
  const PromotionsState();
  @override
  List<Object> get props => [];
}

class PromotionsInitial extends PromotionsState {}

class PromotionsLoadingState extends PromotionsState {
  final List<Promos> promotions;

  PromotionsLoadingState({@required this.promotions});

  @override
  List<Object> get props => [promotions];

}

class PromotionsLoadedState extends PromotionsState {
  final List<Promos> promotions;

  PromotionsLoadedState({@required this.promotions});

  @override
  List<Object> get props => [promotions];
}

class PromotionsEmptyState extends PromotionsState {}

class PromotionsErrorState extends PromotionsState {}

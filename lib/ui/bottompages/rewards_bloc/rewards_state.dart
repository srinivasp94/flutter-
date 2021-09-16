part of 'rewards_bloc.dart';

abstract class RewardsState extends Equatable {
  const RewardsState();
  @override
  List<Object> get props => [];
}

class RewardsInitial extends RewardsState {}

class RewardsLoadingState extends RewardsState {}

class RewardsLoadedState extends RewardsState {
  final List<CardBalance> cardBalanceList;

  RewardsLoadedState({@required this.cardBalanceList});

  @override
  List<Object> get props => [cardBalanceList];
}

class RewardsEmptyState extends RewardsState {}

class RewardsErrorState extends RewardsState {}

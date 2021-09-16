part of 'rewards_bloc.dart';

abstract class RewardsEvent extends Equatable {
  const RewardsEvent();
}

class FetchRewardsEvent extends RewardsEvent {
  @override
  List<Object> get props => [];

}
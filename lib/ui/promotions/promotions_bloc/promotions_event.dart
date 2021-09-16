part of 'promotions_bloc.dart';

abstract class PromotionsEvent extends Equatable {
  const PromotionsEvent();

  @override
  List<Object> get props => [];
}

class FetchPromotionsEvent extends PromotionsEvent {}

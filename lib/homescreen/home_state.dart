import 'package:equatable/equatable.dart';
import 'package:milesedu/homescreen/home_model.dart';
import 'package:milesedu/homescreen/testimonal_model.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object?> get props => [];
}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenInitialState extends HomeScreenState {}

class HomeScreenJsonSuccessState extends HomeScreenState {
  final HomeScreenJsonModel successJson;
  final TestimonalsonModel testimonalsonModel;

  const HomeScreenJsonSuccessState(this.successJson, this.testimonalsonModel);

  @override
  List<Object> get props => [successJson];
}

class HomeScreenFailureState extends HomeScreenState {
  final String error;

  const HomeScreenFailureState(this.error);

  @override
  List<Object> get props => [error];
}

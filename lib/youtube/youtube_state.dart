import 'package:equatable/equatable.dart';

abstract class YoutubeScreenState extends Equatable {
  const YoutubeScreenState();

  @override
  List<Object?> get props => [];
}

class YoutubeScreenInitialState extends YoutubeScreenState {}

class YoutubeScreenLoadingState extends YoutubeScreenState {}

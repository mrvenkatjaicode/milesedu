import 'package:equatable/equatable.dart';

abstract class YoutubeScreenEvent extends Equatable {
  const YoutubeScreenEvent();

  @override
  List<Object?> get props => [];
}

class PlayVideoEvent extends YoutubeScreenEvent {}

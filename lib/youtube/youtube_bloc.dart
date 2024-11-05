import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesedu/youtube/youtube_event.dart';
import 'package:milesedu/youtube/youtube_state.dart';

class YoutubeScreenBloc extends Bloc<YoutubeScreenEvent, YoutubeScreenState> {
  YoutubeScreenBloc() : super(YoutubeScreenInitialState());
}

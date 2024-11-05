import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesedu/const/constant.dart';
import 'package:milesedu/homescreen/home_event.dart';
import 'package:milesedu/homescreen/home_model.dart';
import 'package:milesedu/homescreen/home_state.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:milesedu/homescreen/testimonal_model.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitialState()) {
    on<GetJsonEvent>(getJsonFile);
  }
}

getJsonFile(GetJsonEvent event, Emitter<HomeScreenState> emit) async {
  emit(HomeScreenLoadingState());
  try {
    await Future.delayed(const Duration(seconds: 2), () {
      debugPrint("This will print after a 2-second delay");
    });
    String homescreenjsonString = await rootBundle.loadString(homeScreenjson);
    String testimonaljsonString = await rootBundle.loadString(testimonaljson);
    var homescreenjsonResponse =
        homeScreenJsonModelFromJson(homescreenjsonString);
    var testimonaljsonResponse =
        testimonalsonModelFromJson(testimonaljsonString);

    debugPrint(homescreenjsonResponse.data![0].blockType);
    emit(HomeScreenJsonSuccessState(
        homescreenjsonResponse, testimonaljsonResponse));
  } catch (e) {
    emit(HomeScreenFailureState(e.toString()));
  }
}

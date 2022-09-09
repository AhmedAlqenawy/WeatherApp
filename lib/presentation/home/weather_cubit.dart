import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:weatherapp/presentation/home/weather_states.dart';
import 'package:weatherapp/services/dio_helper.dart';

import '../../data/constant.dart';
import '../../models/Sites/Sites.dart';
import '../../models/weather/WeatherModel.dart';
import '../../services/local_database.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(InitWeatherState());

  List? sites;
  List? favoriteSites;

  void getFavPlaceWeather() {
    CacheService().getAllWeatherFavPlace().then((value) {
      favoriteSites = value;
      emit(GetFavState());
    });
  }

  void getRecentPlaceWeather() {
    CacheService().getAllWeatherRecentPlace().then((value) {
      sites = value;
      emit(GetRecentState());
    });
  }

  insertPlaceWeather(Sites sitesModel, bool isFav) async {
    CacheService().addWeatherFavPlace(sitesModel, isFav).then((value) {
      emit(InsertPlaceWeatherIntoDatabaseState());
      isFav ? getFavPlaceWeather() : getRecentPlaceWeather();
    });
  }

  bool isOpened = false;

  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> endSideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  Weather? weatherModel;

  static WeatherCubit get(context) => BlocProvider.of(context);

  void getInitState() {
    getWeather();
    getFavPlaceWeather();
    getRecentPlaceWeather();
  }

  void getWeather() {
    DioHelper.getData(
            url:
                "/forecast.json?key=$apiKey&&q=$location&days=7&aqi=yes&alerts=no")
        .then((value) {
      if (value.statusCode == 200) {
        print(value.data);
        weatherModel = Weather.fromJson(value.data);
      }
      emit(GetWeatherState());
    });
  }

  void updateIsOpened(isOpenedVal) {
    isOpened = isOpenedVal;
    emit(UpdateIsOpenedValState());
  }

  void updateLocation(locationVal) {
    location = locationVal;
    emit(UpdateLocationState());
    getWeather();
  }
}

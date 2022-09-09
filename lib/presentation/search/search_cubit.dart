import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/presentation/search/search_states.dart';

import '../../data/constant.dart';
import '../../models/Sites/Sites.dart';
import '../../services/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(InitSearchState());

  String location = "";
  List<Sites>? sites;

  static SearchCubit get(context) => BlocProvider.of(context);

  void getSearch() {
    if (location.isNotEmpty) {
      DioHelper.getData(url: "/search.json?key=$apiKey&q=$location")
          .then((value) {
        if (value.statusCode == 200) {
          print(location);
          print(value.data);
          //sites = List<Sites>.fromJson(value.data.toString());
          //sites = List<Sites>.from(value.data);
          sites = List<Sites>.from(value.data.map((x) => Sites.fromJson(x)));
          print("length ${sites!.length}");
          emit(GetSearchState());
        }
      });
    } else {
      sites = [];

    }
  }

  void updateLocation(locationVal) {
    location = locationVal;
    sites = null;
    emit(UpdateSearchValueState());
    getSearch();
  }
}

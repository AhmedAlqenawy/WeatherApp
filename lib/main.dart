import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/presentation/home/home.dart';
import 'package:weatherapp/presentation/home/weather_cubit.dart';
import 'package:weatherapp/presentation/search/search_cubit.dart';
import 'package:weatherapp/services/dio_helper.dart';
import 'package:weatherapp/utils/shared/observ.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  BlocOverrides.runZoned(
    () {
      WeatherCubit();
      SearchCubit();
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WeatherApp',
        home: HomeScreen(),
      ),
    );
  }
}

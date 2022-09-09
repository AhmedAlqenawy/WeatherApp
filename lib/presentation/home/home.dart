import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:weatherapp/presentation/home/weather_cubit.dart';
import 'package:weatherapp/presentation/home/weather_states.dart';
import 'package:weatherapp/utils/functions/navigation.dart';

import '../../data/constant.dart';
import '../../models/weather/WeatherModel.dart';
import '../../utils/functions/widget_functions.dart';
import '../search/search.dart';
import '../shared_widget/Climate_Reports.dart';
import '../shared_widget/days_weather_widget.dart';
import '../shared_widget/hour_weather_widget.dart';
import '../shared_widget/sites_widget.dart';
import '../shared_widget/sunrise_and_sunset_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //cubit.toggleMenu();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit()..getInitState(),
      child: BlocConsumer<WeatherCubit, WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WeatherCubit cubit = WeatherCubit.get(context);
          return SideMenu(
            key: cubit.sideMenuKey,
            background: const Color(0xff91C1F2),
            menu: Container(
              //  color:Colors.white, // Color(0xff91C1F2),
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 35.0.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Favorite Locations",
                        style: openSans(18.sp, Colors.white, FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    if (cubit.favoriteSites != null &&
                        cubit.favoriteSites!.isNotEmpty)
                      for (int i = 0; i < cubit.favoriteSites!.length; i++)
                        GestureDetector(
                          onTap: () {
                            cubit.updateLocation(
                                cubit.favoriteSites![i]["name"]);
                            cubit.toggleMenu();
                          },
                          child: SitesWidget(
                            name: cubit.favoriteSites![i]["name"],
                          ),
                        )
                    else
                      Text(
                        "No found Favorite Locations",
                        style: openSans(16.sp, Colors.white, FontWeight.w400),
                      ),
                    space(4.h, 0),
                    line(1.h, double.maxFinite, Colors.white),
                    space(8.h, 0),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Recent Locations",
                        style: openSans(18.sp, Colors.white, FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    if (cubit.sites != null && cubit.sites!.isNotEmpty)
                      for (int i = 0; i < cubit.sites!.length; i++)
                        GestureDetector(
                          onTap: () {
                            cubit.updateLocation(cubit.sites![i]["name"]);
                            cubit.toggleMenu();
                          },
                          child: SitesWidget(
                            name: cubit.sites![i]["name"],
                          ),
                        )
                    else
                      Text(
                        "No found Favorite Locations",
                        style: openSans(16.sp, Colors.white, FontWeight.w400),
                      ),
                  ],
                ),
              ),
            ),
            type: SideMenuType.slideNRotate,
            onChange: (_isOpened) {
              cubit.updateIsOpened(_isOpened);
            },
            child: IgnorePointer(
              ignoring: cubit.isOpened,
              child: Scaffold(
                backgroundColor: const Color(0xff7EB1F2),
                body: Column(
                  children: [
                    space(32.h, 0),
                    Container(
                      width: double.maxFinite,
                      //height: 50.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              size: 25.r,
                            ),
                            onPressed: () => cubit.toggleMenu(),
                          ),
                          GestureDetector(
                              onTap: () {
                                print("sss");
                                navigateTo(context, const SearchScreen());
                              },
                              child: Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffF9FCF9)),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                    size: 25.r,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    BlocConsumer<WeatherCubit, WeatherStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          Weather? weatherModel = cubit.weatherModel;
                          return Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      weatherModel == null
                                          ? Center(
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: .3.sh),
                                                  child:
                                                      const CircularProgressIndicator(
                                                    color:
                                                        const Color(0xffF9FCF9),
                                                  )),
                                            )
                                          : Padding(
                                              padding: EdgeInsets.only(
                                                  left: 16.w, right: 16.w),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          weatherModel.current
                                                                  ?.tempC
                                                                  .toString() ??
                                                              "",
                                                          style: openSans(
                                                              28.sp,
                                                              const Color(
                                                                  0xffF9FCF9),
                                                              FontWeight.w400),
                                                        ),
                                                        Container(
                                                          width: 60.w,
                                                          height: 60.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image:
                                                                DecorationImage(
                                                              image:
                                                                  NetworkImage(
                                                                "https:${weatherModel.current?.condition?.icon}",
                                                              ),
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.w),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          weatherModel.location
                                                                  ?.name ??
                                                              "",
                                                          style: openSans(
                                                              24.h,
                                                              const Color(
                                                                  0xffF9FCF9),
                                                              FontWeight.w500),
                                                        ),
                                                        Icon(
                                                          Icons.location_on,
                                                          color: const Color(
                                                              0xffF9FCF9),
                                                          size: 25.r,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  space(8.h, 0),
                                                  Text(
                                                    dayNameMDHH_MMFormatter
                                                        .format(DateTime.parse(
                                                            weatherModel
                                                                .forecast!
                                                                .forecastday![0]
                                                                .date
                                                                .toString())),
                                                    style: openSans(
                                                        16.h,
                                                        const Color(0xffF9FCF9),
                                                        FontWeight.w500),
                                                  ),
                                                  space(8.h, 0),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "${weatherModel.forecast?.forecastday![0].day?.mintempC.toString() ?? ""} / ${weatherModel.forecast?.forecastday![0].day?.maxtempC.toString() ?? ""}",
                                                        style: openSans(
                                                            16.h,
                                                            Colors.white,
                                                            FontWeight.w400),
                                                      ),
                                                      space(0, 2.w),
                                                      Text(
                                                        "Feel like ${weatherModel.current?.feelslikeC.toString() ?? ""}",
                                                        style: openSans(
                                                            16.h,
                                                            Color(0xffF9FCF9),
                                                            FontWeight.w400),
                                                      ),
                                                    ],
                                                  ),
                                                  space(32.h, 0),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8.w,
                                                            vertical: 8.h),
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xff91C1F2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    16.r)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        space(16.h, 0),
                                                        HourWeatherWidget(
                                                          hourWeather:
                                                              weatherModel
                                                                  .forecast
                                                                  ?.forecastday![
                                                                      0]
                                                                  .hour,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  space(16.h, 0),
                                                  DaysWeatherWidget(
                                                      forecastDay: weatherModel
                                                          .forecast
                                                          ?.forecastday),
                                                  space(16.h, 0),
                                                  SunriseAndSunsetWidget(
                                                      sunset: weatherModel
                                                              .forecast!
                                                              .forecastday![0]
                                                              .astro!
                                                              .sunset ??
                                                          "",
                                                      sunrise: weatherModel
                                                              .forecast!
                                                              .forecastday![0]
                                                              .astro!
                                                              .sunrise ??
                                                          ""),
                                                  space(16.h, 0),
                                                  ClimateReports(
                                                    humidity: weatherModel
                                                        .current!.humidity
                                                        .toString(),
                                                    wind: weatherModel
                                                        .current!.windDegree
                                                        .toString(),
                                                    uv: weatherModel.current!.uv
                                                        .toString(),
                                                  ),
                                                  space(16.h, 0),
                                                  space(16.h, 0),
                                                ],
                                              ),
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

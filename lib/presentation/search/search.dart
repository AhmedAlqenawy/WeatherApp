import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/presentation/home/home.dart';
import 'package:weatherapp/presentation/home/weather_cubit.dart';
import 'package:weatherapp/presentation/search/search_cubit.dart';
import 'package:weatherapp/presentation/search/search_states.dart';
import 'package:weatherapp/utils/functions/navigation.dart';
import 'package:weatherapp/utils/functions/widget_functions.dart';

import '../../models/Sites/Sites.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit()..getSearch(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SearchCubit cubit = SearchCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: const Color(0xff7EB1F2),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BlocConsumer<SearchCubit, SearchStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        List<Sites>? sites = cubit.sites;
                        return Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                space(10.h, 0),
                                Container(
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      color: Color(0xff91C1F2),
                                      //border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(1.r)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 16.w),
                                  // margin: EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.white,
                                          size: 20.r,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          style: openSans(16.sp, Colors.white,
                                              FontWeight.w400),
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                              isDense: true,
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 8.w,
                                              ),
                                              disabledBorder: InputBorder.none,
                                              hintText: 'Search',
                                              hintStyle: openSans(
                                                  14.sp,
                                                  Colors.white,
                                                  FontWeight.w400)),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onEditingComplete: () {},
                                          onChanged: (value) {
                                            if (value.length >= 3)
                                              cubit.updateLocation(value);
                                            //searchVal = value;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                sites == null
                                    ? Center(
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: .3.sh),
                                            child:
                                                const CircularProgressIndicator(
                                              color: Colors.white,
                                            )),
                                      )
                                    : sites.isEmpty
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              space(300.h, 0),
                                              Text(
                                                "Enter a location name",
                                                style: openSans(
                                                    20.sp,
                                                    Colors.white,
                                                    FontWeight.w500),
                                              ),
                                            ],
                                          )
                                        : Padding(
                                            padding: EdgeInsets.only(top: 24.h),
                                            child:
                                                LocationsWidget(sites: sites),
                                          ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class LocationsWidget extends StatelessWidget {
  List<Sites> sites;

  LocationsWidget({Key? key, required this.sites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xff91C1F2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < sites.length; i++)
            Column(
              children: [
                LocationItemWidget(
                  sites: sites[i],
                ),
                Center(
                  child: line(1.h, 300.w, Colors.white),
                ),
              ],
            )
        ],
      ),
    );
  }
}

class LocationItemWidget extends StatelessWidget {
  Sites? sites;

  LocationItemWidget({Key? key, required this.sites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  WeatherCubit().updateLocation(sites?.name);
                  WeatherCubit().insertPlaceWeather(sites!, false);
                  navigateTo(context, const HomeScreen());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sites?.name ?? "",
                      style: openSans(16.sp, Colors.white, FontWeight.w500),
                    ),
                    space(2.h, 0),
                    Row(
                      children: [
                        Text(
                          "${sites?.region ?? ""}  ,  ${sites?.country ?? ""}",
                          style: openSans(14.sp, Colors.white, FontWeight.w500),
                        ),
                      ],
                    ),
                    space(8.h, 0),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  WeatherCubit().updateLocation(sites?.name);
                  WeatherCubit().insertPlaceWeather(sites!, true);
                  navigateTo(context, const HomeScreen());
                },
                child: Icon(
                  Icons.favorite_border,
                  size: 33.r,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

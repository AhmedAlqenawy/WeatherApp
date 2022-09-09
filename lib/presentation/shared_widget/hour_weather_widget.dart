import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/utils/functions/widget_functions.dart';

import '../../data/constant.dart';
import '../../models/weather/Hour_model.dart';

class HourWeatherWidget extends StatelessWidget {
  final List<Hour>? hourWeather;

  const HourWeatherWidget({Key? key, required this.hourWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 120.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            if (hourWeather != null)
              for (int i = 0; i < hourWeather!.length; i++)
                Container(
                  width: 50.w,
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hourFormatter.format(DateTime.parse(
                          hourWeather![i].time ?? "",
                        )),
                        style:
                            openSans(14.sp, Color(0xffF9FCF9), FontWeight.w500),
                      ),
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              "https:${hourWeather![i].condition!.icon}",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        hourWeather![i].tempC!.toString(),
                        style: openSans(14.sp, Color(0xffF9FCF9), FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.water_drop_outlined,
                            size: 15.r,
                            color:   Colors.blue,
                          ),
                          space(0, 2.w),
                          Text(
                            "${hourWeather![i].chanceOfRain}%",
                            style:
                                openSans(14.sp, Color(0xffF9FCF9), FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }
}

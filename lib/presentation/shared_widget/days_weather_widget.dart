import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/data/constant.dart';
import 'package:weatherapp/models/weather/Forecast_Model.dart';

import '../../utils/functions/widget_functions.dart';

class DaysWeatherWidget extends StatelessWidget {
  List<Forecastday>? forecastDay;

  DaysWeatherWidget({Key? key, required this.forecastDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff91C1F2),
          borderRadius:
          BorderRadius.circular(
              16.r)),
       padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 4.h),
      height: 358.h,
      child: Column(
        children: [
          for (int i = 0; i < forecastDay!.length; i++)
            DaysRowWidget(
              max: forecastDay![i].day!.maxtempC.toString(),
              min: forecastDay![i].day!.mintempC.toString(),
              rainsAvg: forecastDay![i].hour![0].chanceOfRain.toString(),
              day: dayFormatter.format(
                DateTime.parse(
                  forecastDay![i].date.toString(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class DaysRowWidget extends StatelessWidget {
  String? day, min, max, rainsAvg;

  DaysRowWidget({
    Key? key,
    required this.day,
    required this.max,
    required this.min,
    required this.rainsAvg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 80.w,
          child: Text(
            day ?? "",
            style: openSans(14.sp, Color(0xffF9FCF9), FontWeight.w500),
          ),
        ),
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.water_drop_outlined,
                  size: 15.r,
                  color: const Color(0xff4197ef),
                ),
                Text(
                  "$rainsAvg %",
                  style: openSans(14.sp, Color(0xffF9FCF9), FontWeight.w600),
                ),
              ],
            ),
            Container(
              width: 50.w,
              height: 50.h,
              decoration:
              const BoxDecoration(
                shape: BoxShape
                    .circle,
                image:
                DecorationImage(
                  image:
                  NetworkImage(
                    "https://cdn.weatherapi.com/weather/64x64/night/113.png",
                  ),
                  fit:
                  BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: 50.w,
              height: 50.h,
              decoration:
              const BoxDecoration(
                shape: BoxShape
                    .circle,
                image:
                DecorationImage(
                  image:
                  NetworkImage(
                    "https://cdn.weatherapi.com/weather/64x64/day/113.png",
                  ),
                  fit:
                  BoxFit.fill,
                ),
              ),
            ),

          ],
        ),
        SizedBox(
          width: 90.w,

          child: Text(

            "${min ?? ""} / ${max ?? ""}",
            style: openSans(16.h, const Color(0xffF9FCF9), FontWeight.w400),textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

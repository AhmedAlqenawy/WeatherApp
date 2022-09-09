import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/functions/widget_functions.dart';

class SunriseAndSunsetWidget extends StatelessWidget {
  String sunrise, sunset;

  SunriseAndSunsetWidget(
      {Key? key, required this.sunrise, required this.sunset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff91C1F2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      height: 144.h,
      padding: EdgeInsets.symmetric(
        horizontal: 48.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack (
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0.h),
                child: Text(
                  "Sunrise",
                  style: openSans(14.sp, const Color(0xffF9FCF9), FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32.0.h),
                child: Text(
                  sunrise,
                  style: openSans(14.sp, Color(0xffF9FCF9), FontWeight.w600),
                ),
              ),
              Container(
                width: 100.w,
                height: 110.h,
                margin: EdgeInsets.only(top: 32.0.h),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/img/sunset.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          line(120.h, 1.w, Colors.white),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0.h),
                child: Text(
                  "Sunset",
                  style: openSans(14.sp, Color(0xffF9FCF9), FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32.0.h),
                child: Text(
                  sunset,
                  style: openSans(14.sp, Color(0xffF9FCF9), FontWeight.w600),
                ),
              ),
              Container(
                width: 100.w,
                height: 110.h,
                margin: EdgeInsets.only(top: 45.0.h),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/img/sunrise.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

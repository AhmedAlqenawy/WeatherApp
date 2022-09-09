import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/functions/widget_functions.dart';

class ClimateReports extends StatelessWidget {
  String wind, uv, humidity;

  ClimateReports(
      {Key? key, required this.humidity, required this.uv, required this.wind})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff91C1F2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      height: 125.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "UV Index",
                style:
                    openSans(14.sp, const Color(0xffF9FCF9), FontWeight.w600),
              ),
              Text(
                uv,
                style:
                    openSans(16.sp, const Color(0xffF9FCF9), FontWeight.w600),
              ),
              Container(
                width: 60.w,
                height: 60.h,
                decoration: const BoxDecoration(
                  //  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/img/uv.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          line(120.h, 1.w, Colors.white),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Humidity",
                style:
                    openSans(14.sp, const Color(0xffF9FCF9), FontWeight.w600),
              ),
              Text(
                humidity,
                style:
                    openSans(16.sp, const Color(0xffF9FCF9), FontWeight.w600),
              ),
              Container(
                width: 60.w,
                height: 60.h,
                decoration: const BoxDecoration(
                  //  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/img/Humidity.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          line(120.h, 1.w, Colors.white),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Wind Speed",
                style:
                    openSans(14.sp, const Color(0xffF9FCF9), FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.0.h),
                child: Text(
                  wind,
                  style:
                      openSans(16.sp, const Color(0xffF9FCF9), FontWeight.w600),
                ),
              ),
              Container(
                width: 80.w,
                height: 60.h,
                decoration: const BoxDecoration(
                  //  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/img/wind.png",
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

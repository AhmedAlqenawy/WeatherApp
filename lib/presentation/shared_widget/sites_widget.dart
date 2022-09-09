import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weatherapp/utils/functions/widget_functions.dart';

class SitesWidget extends StatelessWidget {
  String name;

  SitesWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(vertical: 6.0.h,),
      child: SizedBox(
        width: double.maxFinite,
        child: Row(
          children: [
            Icon(Icons.location_on,color: Colors.white,size: 25.r,),
            space(0, 2.w),
            Text(
              name,
              style: openSans(16.sp, Colors.white, FontWeight.w400),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cegid_app/app/resources/app_colors.dart';
import 'package:lottie/lottie.dart';


class LoaderGeneric extends StatelessWidget {

  final Widget child;
  final bool isLoading;

  const LoaderGeneric({
    Key? key, 
    required this.child, 
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.0.w,
      height: 640.0.h,
      child: Stack(
        children: [
          Container(
            child: child,
          ),
           if (isLoading)
           Container(
              decoration: BoxDecoration(
                color: AppColors.blueLight.withOpacity(0.3),
              ),
              child: Center(
                child: Lottie.asset(
                  'assets/lotties/loader.json',
                  width: 100.0.w,
                  height: 100.0.h,
                ),
              ),
            ),
        ],        
      ),
    );
  }
}
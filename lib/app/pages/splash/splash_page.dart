import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:cegid_app/app/widgets/will_pop_scope_generic.dart';
import 'package:cegid_app/app/resources/app_colors.dart';
import 'package:cegid_app/app/resources/app_constants.dart';
import 'package:cegid_app/app/resources/app_images.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  Widget build(BuildContext context) {
    return WillPopScopeGeneric(
      onWillPop: false,
      action: () {},
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: Hero(
            tag: AppConstants.tagLogo,
            child: FadeIn(
              duration: const Duration(milliseconds: 2000),
              child: Image.asset(
                AppImages.logo,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
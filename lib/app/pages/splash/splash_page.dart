import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';


import 'package:cegid_app/data/db/secure_storage/my_secure_storage_manager.dart';
import 'package:cegid_app/data/services/controller.dart';
import 'package:cegid_app/app/widgets/will_pop_scope_generic.dart';
import 'package:cegid_app/app/resources/app_colors.dart';
import 'package:cegid_app/app/resources/app_constants.dart';
import 'package:cegid_app/app/resources/app_images.dart';
import 'package:cegid_app/app/routes/app_routes.dart';

/****************** */
// WIDGET SPLASH //
/****************** */
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}


/***************************************** */
// CONTROLADOR DE ESTADO WIDGET PRINCIPAL //
/***************************************** */
class _SplashPageState extends State<SplashPage> {
  final MySecureStorageManager _mySecureStorageManager = Get.find();

  final Controller _controller = Get.find();
  late NavigatorState _navigator;
/*
  @override
  void initState() {
    super.initState();
    _navigator = Navigator.of(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
    _initApp();
  });
  }
*/
  @override
  void initState() {
    super.initState();
    _navigator = Navigator.of(context);
    _initApp();
  }

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


   Future<void> _initApp() async {

    String? token = await _mySecureStorageManager.getToken();

    if (token != '') {
      await _navigator.pushNamed(AppRoutes.loginToken);
    }
    
     await _mySecureStorageManager.setToken('');
     await _navigator.pushNamed(AppRoutes.loginInitial);

  }

}
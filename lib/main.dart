// Dart
import 'dart:async';
import 'dart:math';

// Flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX
import 'package:get/get.dart';

// Propias
import 'package:cegid_app/dependency_injection/injection.dart';
import 'package:cegid_app/app/widgets/loader_generic.dart';
import 'package:cegid_app/data/services/controller.dart';
import 'package:cegid_app/app/resources/app_themes.dart';
import 'package:cegid_app/app/routes/app_routes.dart';
import 'package:cegid_app/app/routes/app_route_provider.dart';



void main() async {
  await runZonedGuarded(() async {
    
    // Inyectamos las dependencias
    Injection.loadDependencies();

    runApp(
      GestionRemotaApp(
        appRouteProvider: AppRouteProvider(),
      ),
    );

  }, (error, stackTrace) {
    debugPrint('$error');
  });
}


/****************** */
// WIDGET PRINCIPAL //
/****************** */
class GestionRemotaApp extends StatefulWidget {
  final AppRouteProvider _appRouteProvider;

  const GestionRemotaApp({
    super.key,
    required AppRouteProvider appRouteProvider,
  }) : _appRouteProvider = appRouteProvider;

  @override
  State<GestionRemotaApp> createState() => _GestionRemotaAppState();
}


/****************************** */
// CONTROLADOR WIDGET PRINCIPAL //
/****************************** */
class _GestionRemotaAppState extends State<GestionRemotaApp> {
  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {


    // CONFIGURACIONES DE PANTALLA
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));


    // PANTALLA INICIAL
    return  ScreenUtilInit(

      designSize: const Size(360.0, 640.0),

      builder: ( context, __ ) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.appTheme,
        title: 'Gestiona3w',
        

        builder: (context, child) {
          final MediaQueryData data = MediaQuery.of(context);

          return MediaQuery(
            data: data.copyWith(
              textScaleFactor:  min(max(1, MediaQuery.textScaleFactorOf(context)), 1.5),
            ),
            child: Obx(
             () => LoaderGeneric(
                isLoading: _controller.isLoading.value,
                child: child ?? const SizedBox(),
             ),
            )
          );
        },
    

        // GESTIÓN DE RUTAS ENRUTAMIENTO 
        initialRoute: AppRoutes.root,
        navigatorKey: AppRouteProvider.navigatorKey,
        onGenerateRoute: widget._appRouteProvider.generateRoute,

        navigatorObservers: [
          HeroController(),
        ],
      )
    );
  }
}

import 'package:get/get.dart';

import 'package:cegid_app/data/services/controller.dart';

class Injection{

  static void loadDependencies(){

    // Inyectamos los Services
    Get.lazyPut(
      () => Controller(),
    );


  }

}

import 'package:get/get.dart';

import 'package:cegid_app/data/services/controller.dart';
import 'package:cegid_app/data/db/secure_storage/my_secure_storage_manager.dart';

class Injection{

  static void loadDependencies(){

    // Inyectamos los Services
    Get.lazyPut(
      () => Controller(),
    );


    // Inyectamos las BBDD
    Get.lazyPut(
      () => MySecureStorageManager(),
    );

  }

}
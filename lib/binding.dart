import 'package:get/get.dart';
import 'package:randnum/myservices.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyServices(), fenix: true);
  }
}

import 'package:applicant_assignments/controllers/calender_controller.dart';
import 'package:get/get.dart';

class ApplicantBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalenderController>(() => CalenderController(), fenix: true);
  }
}

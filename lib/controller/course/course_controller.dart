import 'package:get/get.dart';

import '../../api_services/course_api_services/course_api_service.dart';
import '../../models/course/course_model.dart';


class CourseController extends GetxController {
  var isLoading = false.obs;
  var courses = <Course>[].obs;
  var errorMessage = ''.obs;


  Future<void> fetchCourses() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await CourseApiService.fetchCourses();
      print(response.data);
      courses.assignAll(response.data);
    } catch (e) {
      print(e.toString());
      errorMessage(e.toString());
      Get.snackbar('Error', 'Failed to fetch courses: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCourses();
    super.onInit();
  }


}
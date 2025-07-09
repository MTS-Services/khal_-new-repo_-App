import 'package:get/get.dart';

import '../../api_services/course_api_services/course_api_service.dart';
import '../../models/course/course_model.dart';


class CourseController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final courses = <CourseData>[].obs;

  @override
  void onInit() {
    fetchCourses();
    super.onInit();
  }

  Future<void> fetchCourses() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await CourseApiService.getCourses(1);
      courses.assignAll(response.data);
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Error',
        'Failed to fetch courses for $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchCoursesBySubject(int subjectId) async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await CourseApiService.getCoursesBySubject(subjectId);
      courses.assignAll(response.data);
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Error',
        'Failed to fetch courses for subject',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  List<CourseData> getCoursesForSubject(int subjectId) {
    return courses.where((course) => course.subjectId == subjectId).toList();
  }

  CourseData? getCourseById(int courseId) {
    try {
      return courses.firstWhere((course) => course.id == courseId);
    } catch (e) {
      return null;
    }
  }
}
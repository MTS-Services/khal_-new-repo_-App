import 'package:get/get.dart';

import '../../api_services/subject_api_services/subject_api_services.dart';
import '../../models/subject/subject_model.dart';


class SubjectController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final subjects = <SubjectData>[].obs;

  @override
  void onInit() {
    fetchSubjects();
    super.onInit();
  }

  Future<void> fetchSubjects() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await SubjectApiService.getSubjects();
      subjects.assignAll(response.data);
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Error',
        'Failed to fetch subjects',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  // Filter subjects by language
  List<SubjectData> getSubjectsByLanguage(String languageCode) {
    return subjects.where((subject) =>
        subject.translations.any((t) => t.language == languageCode)
    ).toList();
  }
}
import 'package:get/get.dart';

import '../../api_services/topic_api_services/topic_api_services.dart';
import '../../models/topic/topic_model.dart';


class TopicController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final topics = <TopicData>[].obs;

  @override
  void onInit() {
    fetchTopics();
    super.onInit();
  }

  Future<void> fetchTopics() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await TopicApiService.getTopics();
      topics.assignAll(response.data);
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Error',
        'Failed to fetch topics',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchTopicsByCourse(int courseId) async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await TopicApiService.getTopicsByCourse(courseId);
      topics.assignAll(response.data);
      print("response topic: ${response.data}");
    } catch (e) {
      errorMessage(e.toString());
      print("response message: $e");
      Get.snackbar(
        'Error',
        'Failed to fetch topics for course',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  List<TopicData> getTopicsForCourse(int courseId) {
    return topics.where((topic) => topic.courseId == courseId).toList();
  }

  String getTopicName(int topicId) {
    return topics
        .firstWhere(
          (topic) => topic.id == topicId,
      orElse: () => TopicData(
        id: 0,
        orderIndex: 0,
        courseId: 0,
        status: 0,
        createdAtHuman: '',
        statusLabel: '',
        translations: [],
        course: Course(
          id: 0,
          orderIndex: 0,
          subjectId: 0,
          status: 0,
          createdAtHuman: '',
          statusLabel: '',
          subject: Subject(
            id: 0,
            orderIndex: 0,
            status: 0,
            isPremium: false,
            createdAtHuman: '',
            statusLabel: '',
          ),
        ),
      ),
    )
        .englishName;
  }
}
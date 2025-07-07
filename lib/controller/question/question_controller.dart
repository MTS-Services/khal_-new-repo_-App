import 'package:get/get.dart';

import '../../api_services/question_api_services/question_api_services.dart';
import '../../models/question/question_model.dart';


class QuestionController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final questions = <Question>[].obs;

  @override
  void onInit() {
    fetchQuestions();
    super.onInit();
  }

  Future<void> fetchQuestions() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await QuestionApiService.getQuestions();
      questions.assignAll(response.data);
      print("fetch question ${response.success}");
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Error',
        'Failed to fetch questions',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchQuestionsByTopic(int topicId) async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await QuestionApiService.getQuestionsByTopic(topicId);
      questions.assignAll(response.data);
    } catch (e) {
      errorMessage(e.toString());
      // Get.snackbar(
      //   'Error',
      //   'Failed to fetch questions for topic',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    } finally {
      isLoading(false);
    }
  }

  List<Question> getQuestionsForTopic(int topicId) {
    return questions.where((q) => q.questionDetails.topicId == topicId).toList();
  }

  Question? getQuestionById(int questionId) {
    try {
      return questions.firstWhere((q) => q.id == questionId);
    } catch (e) {
      return null;
    }
  }
}
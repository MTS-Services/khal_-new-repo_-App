import 'package:get/get.dart';

import '../../api_services/quiz_api_services/quiz_api_services.dart';
import '../../models/quiz/quiz_model.dart';


class QuizController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final quizzes = <Quiz>[].obs;

  @override
  void onInit() {
    fetchQuizzes();
    super.onInit();
  }

  Future<void> fetchQuizzes() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await QuizApiService.getQuizzes();
      quizzes.assignAll(response.data);
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Error',
        'Failed to fetch quizzes',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchQuizzesByTopic(int topicId) async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await QuizApiService.getQuizzesByTopic(topicId);
      quizzes.assignAll(response.data);
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Error',
        'Failed to fetch quizzes for topic',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  List<Quiz> getQuizzesForTopic(int topicId) {
    return quizzes.where((quiz) => quiz.topicId == topicId).toList();
  }

  Quiz? getQuizById(int quizId) {
    try {
      return quizzes.firstWhere((quiz) => quiz.id == quizId);
    } catch (e) {
      return null;
    }
  }
}
import 'package:get/get.dart';
import 'package:zidney/api_services/user_api_services/user_api_services.dart';
import 'package:zidney/models/user/user_model.dart';

class UserController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final userResponse = Rxn<UserResponse>(); // Reactive nullable UserResponse

  @override
  void onInit() {
    fetchUsersData();
    super.onInit();
  }

  Future<void> fetchUsersData() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await UserApiService.getUserDetails();
      print(response);
      print(response.data.username);
      print(response.data.name);
      print(response.data.school);
      print(response.data.email);
      print(response.data.city);
      userResponse.value = response;
      update();
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar(
        'Error',
        'Failed to fetch user data: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
      // Consider logging the error for debugging
      print('Error fetching user data: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  // Helper getter for cleaner access to user data
  UserData? get userData => userResponse.value?.data;
}
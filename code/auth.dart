import 'package:get/get.dart';
import 'package:meetspace/core/services/storage_service.dart';
import 'package:meetspace/models/user.dart';

class AuthController extends GetxController {
  final StorageService _storage = Get.find<StorageService>();
  final Rx<User?> currentUser = Rx<User?>(null);
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    final token = await _storage.getToken();
    if (token != null) {
      // Fetch user profile
      await getUserProfile();
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      // API call to login
      final response = await ApiService.login(email, password);
      await _storage.saveToken(response.token);
      currentUser.value = response.user;
      Get.offAllNamed('/dashboard');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signup(String username, String email, String password) async {
    try {
      isLoading.value = true;
      // API call to signup
      final response = await ApiService.signup(username, email, password);
      await _storage.saveToken(response.token);
      currentUser.value = response.user;
      Get.offAllNamed('/dashboard');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _storage.clearToken();
    currentUser.value = null;
    Get.offAllNamed('/login');
  }

  Future<void> getUserProfile() async {
    try {
      final response = await ApiService.getUserProfile();
      currentUser.value = response;
    } catch (e) {
      logout();
    }
  }
}

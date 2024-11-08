import 'package:get/get.dart';
import 'package:meetspace/models/reservation.dart';
import 'package:meetspace/core/services/api_service.dart';

class DashboardController extends GetxController {
  final RxList<Reservation> upcomingReservations = <Reservation>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUpcomingReservations();
  }

  Future<void> fetchUpcomingReservations() async {
    try {
      isLoading.value = true;
      final reservations = await ApiService.getUpcomingReservations();
      upcomingReservations.value = reservations;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load reservations');
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToNewReservation() {
    Get.toNamed('/new-reservation');
  }

  void navigateToViewReservation() {
    Get.toNamed('/view-reservation');
  }

  void navigateToCalendar() {
    Get.toNamed('/calendar');
  }
}

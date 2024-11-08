import 'package:get/get.dart';
import 'package:meetspace/models/room.dart';
import 'package:meetspace/models/reservation.dart';
import 'package:meetspace/core/services/api_service.dart';

class ReservationController extends GetxController {
  final RxList<Room> availableRooms = <Room>[].obs;
  final RxList<Reservation> userReservations = <Reservation>[].obs;
  final RxBool isLoading = false.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    fetchAvailableRooms();
    fetchUserReservations();
  }

  Future<void> fetchAvailableRooms() async {
    try {
      isLoading.value = true;
      final rooms = await ApiService.getAvailableRooms(selectedDate.value);
      availableRooms.value = rooms;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load rooms');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchUserReservations() async {
    try {
      isLoading.value = true;
      final reservations = await ApiService.getUserReservations();
      userReservations.value = reservations;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load reservations');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> bookRoom(Room room, DateTime startTime, DateTime endTime) async {
    try {
      isLoading.value = true;
      await ApiService.createReservation(
        roomId: room.id,
        startTime: startTime,
        endTime: endTime,
      );
      Get.snackbar('Success', 'Room booked successfully');
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'Failed to book room');
    } finally {
      isLoading.value = false;
    }
  }
}

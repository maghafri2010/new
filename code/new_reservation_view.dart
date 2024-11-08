import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetspace/core/theme/app_theme.dart';
import 'package:meetspace/modules/reservation/controllers/reservation_controller.dart';
import 'package:meetspace/widgets/room_card.dart';

class NewReservationView extends GetView<ReservationController> {
  const NewReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Reservation'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Location',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.filter_list),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.availableRooms.length,
                itemBuilder: (context, index) {
                  final room = controller.availableRooms[index];
                  return RoomCard(
                    room: room,
                    onBookNow: () => _showBookingDialog(context, room),
                    onCheckAvailability: () => _showAvailabilityDialog(context, room),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showBookingDialog(BuildContext context, Room room) {
    // Implementation for booking dialog
  }

  void _showAvailabilityDialog(BuildContext context, Room room) {
    // Implementation for availability check
  }
}

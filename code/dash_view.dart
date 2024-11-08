import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetspace/core/theme/app_theme.dart';
import 'package:meetspace/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:meetspace/widgets/dashboard_card.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Get.find<AuthController>().logout(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                DashboardCard(
                  icon: Icons.add_box,
                  title: 'New\nReservation',
                  onTap: controller.navigateToNewReservation,
                ),
                DashboardCard(
                  icon: Icons.visibility,
                  title: 'View\nReservation',
                  onTap: controller.navigateToViewReservation,
                ),
                DashboardCard(
                  icon: Icons.calendar_today,
                  title: 'Calendar',
                  onTap: controller.navigateToCalendar,
                ),
                DashboardCard(
                  icon: Icons.check_circle,
                  title: 'Room\nAvailability',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

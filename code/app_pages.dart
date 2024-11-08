import 'package:get/get.dart';
import 'package:meetspace/modules/auth/bindings/auth_binding.dart';
import 'package:meetspace/modules/auth/views/login_view.dart';
import 'package:meetspace/modules/auth/views/signup_view.dart';
import 'package:meetspace/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:meetspace/modules/dashboard/views/dashboard_view.dart';
import 'package:meetspace/modules/home/bindings/home_binding.dart';
import 'package:meetspace/modules/home/views/home_view.dart';
import 'package:meetspace/modules/reservation/bindings/reservation_binding.dart';
import 'package:meetspace/modules/reservation/views/new_reservation_view.dart';
import 'package:meetspace/modules/reservation/views/view_reservation_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.NEW_RESERVATION,
      page: () => const NewReservationView(),
      binding: ReservationBinding(),
    ),
    GetPage(
      name: Routes.VIEW_RESERVATION,
      page: () => const ViewReservationView(),
      binding: ReservationBinding(),
    ),
  ];
}

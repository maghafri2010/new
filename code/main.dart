import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetspace/core/theme/app_theme.dart';
import 'package:meetspace/routes/app_pages.dart';
import 'package:meetspace/core/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MeetSpaceApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => StorageService().init());
}

class MeetSpaceApp extends StatelessWidget {
  const MeetSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MeetSpace',
      theme: AppTheme.darkTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

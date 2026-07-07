// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:device_preview/device_preview.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  await Supabase.initialize(
    url: 'https://icyohfxbthockzqtkces.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImljeW9oZnhidGhvY2t6cXRrY2VzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI3MjAyMDUsImV4cCI6MjA5ODI5NjIwNX0.eI6NXpBhG9FsP7oX18QNBk1nAUYDrm5VykRhOGg2iwU',
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const CazaApp(),
    ),
  );
}

class CazaApp extends StatelessWidget {
  const CazaApp({super.key});

  // Always start from onboarding — home route is not registered yet.
  // Once home screen is built and added to AppPages, update this to:
  // return SupabaseService.isLoggedIn ? AppRoutes.home : AppRoutes.onboarding;
  String get _initialRoute => AppRoutes.onboarding;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Caza',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: _initialRoute,
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 250),
    );
  }
}
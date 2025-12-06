import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'viewmodels/location_view_model.dart';
import 'views/home_page.dart';

void main() {
  runApp(const LocationTrackerApp());
}

class LocationTrackerApp extends StatelessWidget {
  const LocationTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocationViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Location Tracker',
        theme: AppTheme.lightTheme,
        home: const HomePage(),
      ),
    );
  }
}

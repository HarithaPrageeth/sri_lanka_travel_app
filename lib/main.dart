import 'package:flutter/material.dart';
import 'package:sri_lanka_travel_app/screens/favorites_screen.dart';
import 'package:sri_lanka_travel_app/screens/home_screen.dart';
import 'package:sri_lanka_travel_app/screens/profile_screen.dart';
import 'package:sri_lanka_travel_app/utils/constants.dart';
import 'package:sri_lanka_travel_app/widgets/bottom_nav_bar.dart';

void main() {
  runApp(const SriLankaTravelApp());
}

class SriLankaTravelApp extends StatelessWidget {
  const SriLankaTravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          elevation: 0,
        ),
        fontFamily: 'Poppins',
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
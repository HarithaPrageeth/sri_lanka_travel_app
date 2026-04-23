import 'package:flutter/material.dart';
import 'package:sri_lanka_travel_app/screens/favorites_screen.dart';
import 'package:sri_lanka_travel_app/screens/home_screen.dart';
import 'package:sri_lanka_travel_app/screens/profile_screen.dart';
import 'package:sri_lanka_travel_app/screens/splash_screen.dart';
import 'package:sri_lanka_travel_app/utils/constants.dart';
import 'package:sri_lanka_travel_app/widgets/bottom_nav_bar.dart';
import 'package:sri_lanka_travel_app/models/place.dart';

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
      home: const SplashScreen(), // Start with splash screen
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late List<Place> places;

  @override
  void initState() {
    super.initState();
    places = Place.getPlaces();
  }

  void toggleFavorite(Place place) {
    setState(() {
      place.toggleFavorite();
    });
  }

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(
            places: places,
            onFavoriteToggle: toggleFavorite,
          ),
          FavoritesScreen(
            places: places,
            onFavoriteToggle: toggleFavorite,
            onExplorePressed: () => changeTab(0),
          ),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          changeTab(index);
        },
      ),
    );
  }
}
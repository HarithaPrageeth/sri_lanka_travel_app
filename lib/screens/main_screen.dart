import 'package:flutter/material.dart';
import 'package:sri_lanka_travel_app/screens/home_screen.dart';
import 'package:sri_lanka_travel_app/screens/favorites_screen.dart';
import 'package:sri_lanka_travel_app/screens/profile_screen.dart';
import 'package:sri_lanka_travel_app/widgets/bottom_nav_bar.dart';
import 'package:sri_lanka_travel_app/models/place.dart';
import 'package:sri_lanka_travel_app/services/auth_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late List<Place> places;
  final AuthService _authService = AuthService();

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
          ProfileScreen(
            userName: _authService.getUserName(),
            userEmail: _authService.getUserEmail(),
            userPhotoUrl: _authService.getUserPhotoUrl(),
          ),
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
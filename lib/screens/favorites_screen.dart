import 'package:flutter/material.dart';
import '../models/place.dart';
import '../utils/constants.dart';
import '../widgets/place_card.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Place> places;
  final Function(Place) onFavoriteToggle;
  final VoidCallback? onExplorePressed; // Add optional callback

  const FavoritesScreen({
    Key? key,
    required this.places,
    required this.onFavoriteToggle,
    this.onExplorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter favorite places
    List<Place> favoritePlaces = places.where((place) => place.isFavorite).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: favoritePlaces.isEmpty
          ? _buildEmptyState(context)
          : _buildFavoritesList(favoritePlaces, context),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: AppColors.accent.withOpacity(0.5),
          ),
          const SizedBox(height: 20),
          Text(
            'No Favorites Yet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Start adding places to your favorites!',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.text.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Use the callback if provided, otherwise just pop
              if (onExplorePressed != null) {
                onExplorePressed!();
              } else {
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'Explore Places',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesList(List<Place> favoritePlaces, BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 150,
          pinned: true,
          backgroundColor: AppColors.primary,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              'My Favorites',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
            centerTitle: true,
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary,
                    AppColors.secondary,
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 40,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${favoritePlaces.length} Favorite ${favoritePlaces.length == 1 ? 'Place' : 'Places'}',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your Saved Destinations',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${favoritePlaces.length} ${favoritePlaces.length == 1 ? 'Place' : 'Places'}',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return PlaceCard(
                place: favoritePlaces[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        place: favoritePlaces[index],
                        onFavoriteToggle: onFavoriteToggle,
                      ),
                    ),
                  );
                },
                onFavoriteToggle: () {
                  onFavoriteToggle(favoritePlaces[index]);
                },
              );
            },
            childCount: favoritePlaces.length,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 80),
        ),
      ],
    );
  }
}
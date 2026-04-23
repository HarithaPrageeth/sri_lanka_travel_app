import 'package:flutter/material.dart';
import '../models/place.dart';
import '../utils/constants.dart';

class DetailsScreen extends StatelessWidget {
  final Place place;
  final Function(Place) onFavoriteToggle;

  const DetailsScreen({
    Key? key,
    required this.place,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              // Favorite button in app bar
              IconButton(
                icon: Icon(
                  place.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: place.isFavorite ? Colors.red : AppColors.white,
                ),
                onPressed: () {
                  onFavoriteToggle(place);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        place.isFavorite
                            ? 'Added to favorites!'
                            : 'Removed from favorites',
                        style: const TextStyle(color: AppColors.white),
                      ),
                      backgroundColor: place.isFavorite
                          ? AppColors.accent
                          : Colors.grey,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                place.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              background: Image.asset(
                place.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.secondary,
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        size: 80,
                        color: AppColors.primary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          place.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.text,
                          ),
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
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 18,
                              color: AppColors.white,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              place.rating.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.accent,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        place.location,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.text.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.text,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          place.description,
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: AppColors.text.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Entry Fee',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.text,
                          ),
                        ),
                        Text(
                          place.price == 0 ? 'Free' : '\$${place.price}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: place.price == 0 ? AppColors.accent : AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        onFavoriteToggle(place);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              place.isFavorite
                                  ? 'Added to favorites!'
                                  : 'Removed from favorites',
                              style: const TextStyle(color: AppColors.white),
                            ),
                            backgroundColor: place.isFavorite
                                ? AppColors.accent
                                : Colors.grey,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: Icon(
                        place.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: AppColors.white,
                      ),
                      label: Text(
                        place.isFavorite ? 'Remove from Favorites' : 'Add to Favorites',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: place.isFavorite ? Colors.grey : AppColors.accent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
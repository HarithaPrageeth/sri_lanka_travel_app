import '../utils/constants.dart';

class Place {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final String location;
  final int price;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.location,
    required this.price,
  });

  static List<Place> getPlaces() {
    return [
      Place(
        id: '1',
        name: ' ',
        description: 'Ancient rock fortress and palace ruins surrounded by the remains of an extensive network of gardens, reservoirs, and other structures. A UNESCO World Heritage site that dates back to the 5th century.',
        imageUrl: AppAssets.sigiriya,
        rating: 4.8,
        location: 'Matale District',
        price: 30,
      ),
      Place(
        id: '2',
        name: 'Temple of the Sacred Tooth Relic',
        description: 'Sacred Buddhist temple housing Sri Lanka\'s most important relic - the tooth of Buddha. Located in the royal palace complex of the former Kingdom of Kandy.',
        imageUrl: AppAssets.temple,
        rating: 4.7,
        location: 'Kandy',
        price: 15,
      ),
      Place(
        id: '3',
        name: 'Mirissa Beach',
        description: 'Stunning crescent-shaped beach famous for golden sand, clear turquoise waters, and incredible whale watching opportunities. Perfect for relaxation and water activities.',
        imageUrl: AppAssets.beach,
        rating: 4.9,
        location: 'Mirissa',
        price: 0,
      ),
      Place(
        id: '4',
        name: 'Ella to Kandy Train Ride',
        description: 'One of the most scenic train journeys in the world, passing through lush tea plantations, misty mountains, and breathtaking waterfalls.',
        imageUrl: AppAssets.train,
        rating: 4.9,
        location: 'Ella',
        price: 5,
      ),
      Place(
        id: '5',
        name: 'Nuwara Eliya Tea Plantations',
        description: 'Visit the "Little England" of Sri Lanka and explore rolling green tea estates, learn about tea production, and taste world-famous Ceylon tea.',
        imageUrl: AppAssets.tea,
        rating: 4.6,
        location: 'Nuwara Eliya',
        price: 20,
      ),
    ];
  }
}
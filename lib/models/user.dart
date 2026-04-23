class User {
  final String email;
  final String password;
  final String name;
  final String? profileImage;

  User({
    required this.email,
    required this.password,
    required this.name,
    this.profileImage,
  });

  // For demo purposes - static list of registered users
  static List<User> registeredUsers = [
    User(
      email: 'prageethh182@gmail.com',
      password: 'AhpM1205',
      name: 'Haritha Prageeth',
    ),
    User(
      email: 'hpm9421@gmail.com',
      password: '123456',
      name: 'Travel User',
    ),
  ];

  // Check if user exists
  static User? login(String email, String password) {
    try {
      return registeredUsers.firstWhere(
        (user) => user.email == email && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  // Register new user
  static bool register(String email, String password, String name) {
    // Check if email already exists
    bool exists = registeredUsers.any((user) => user.email == email);
    if (exists) return false;
    
    // Add new user
    registeredUsers.add(User(
      email: email,
      password: password,
      name: name,
    ));
    return true;
  }
}
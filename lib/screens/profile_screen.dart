import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: AppColors.text.withOpacity(0.7),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Header with Gradient Background
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile Image with fallback
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white,
                          width: 4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Container(
                          color: AppColors.accent,
                          child: const Center(
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // User Name
                    const Text(
                      AppStrings.userName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // User Email
                    Text(
                      AppStrings.userEmail,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Profile Menu Items
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildProfileMenuItem(
                      icon: Icons.person_outline,
                      title: 'Edit Profile',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Edit profile feature coming soon!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    _buildProfileMenuItem(
                      icon: Icons.favorite_border,
                      title: 'My Favorites',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Go to Favorites tab from bottom navigation'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    _buildProfileMenuItem(
                      icon: Icons.history,
                      title: 'Travel History',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Travel history feature coming soon!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    _buildProfileMenuItem(
                      icon: Icons.notifications_none,
                      title: 'Notifications',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Notifications feature coming soon!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    _buildProfileMenuItem(
                      icon: Icons.language,
                      title: 'Language',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Language selection coming soon!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    _buildProfileMenuItem(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Help & support feature coming soon!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    _buildProfileMenuItem(
                      icon: Icons.logout,
                      title: 'Log Out',
                      onTap: () => _logout(context),
                      isLogout: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Travel Statistics Section
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Travel Statistics',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatCard('15', 'Places\nVisited'),
                        _buildStatCard('23', 'Photos\nTaken'),
                        _buildStatCard('450', 'KM\nTraveled'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // App Version
              Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.text.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isLogout ? Colors.red : AppColors.accent,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isLogout ? Colors.red : AppColors.text,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: isLogout ? Colors.red : AppColors.text.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.secondary,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.text.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
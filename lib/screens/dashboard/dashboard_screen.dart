import 'package:flutter/material.dart';
import 'package:myapp/screens/dashboard/home_screen.dart';
import 'package:myapp/screens/dashboard/rank_screen.dart';
import 'package:myapp/screens/dashboard/king_screen.dart';
import 'package:myapp/screens/dashboard/wallet_screen.dart';
import 'package:myapp/screens/dashboard/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const RankScreen(),
    const KingScreen(),
    const WalletScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SlideTransition(
        position: _animation,
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8.0,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey[500],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events),
              label: 'Rank',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.coronavirus),
              label: 'King',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),

    );
  }
}

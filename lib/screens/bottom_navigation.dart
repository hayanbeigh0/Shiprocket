import 'package:flutter/material.dart';
import '/screens/more_screen.dart';
import '/screens/orders_screen.dart';
import '/screens/shipments_screen.dart';
import '/screens/welcome_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const WelcomeScreen(),
    const OrdersScreen(),
    const ShipmentsScreen(),
    const Text(
      'Index 4: Help',
      style: optionStyle,
    ),
    const MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.gif_box,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.delivery_dining,
            ),
            label: 'Shipments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_rounded),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(60, 26, 112, 1),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

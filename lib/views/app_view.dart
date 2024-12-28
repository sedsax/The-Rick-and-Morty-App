import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(), 
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        destinations: const [ 
          NavigationDestination(
            icon: Icon(Icons.face),
            label: 'Karakterler',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark),
            label: 'Favorilerim',
          ),
          NavigationDestination(
            icon: Icon(Icons.location_on),
            label: 'Konumlar',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu),
            label: 'Bölümler',
          ),
        ],
      ),
    );
  }

  AppBar _appBarWidget() { 
    return AppBar(
      title: const Text(
        'Ricky and Morty',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {},
        ),
      ],
    );
  }
}

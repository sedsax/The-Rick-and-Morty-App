import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ricky_and_mortypp/services/auth_service.dart'; // AuthService'i ekleyin

class AppView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppView({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context), // context'i _appBarWidget'a iletiyoruz
      body: navigationShell,
      bottomNavigationBar: _navigationBarThmWidget(context),
    );
  }

  NavigationBarTheme _navigationBarThmWidget(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(color: Theme.of(context).colorScheme.primary);
          }
          return TextStyle(color: Theme.of(context).colorScheme.tertiary);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: Theme.of(context).colorScheme.primary);
          }
          return IconThemeData(color: Theme.of(context).colorScheme.tertiary);
        }),
      ),
      child: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        indicatorColor: Colors.transparent,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.face), label: 'Karakterler'),
          NavigationDestination(
              icon: Icon(Icons.bookmark), label: 'Favorilerim'),
          NavigationDestination(
              icon: Icon(Icons.location_on), label: 'Konumlar'),
          NavigationDestination(icon: Icon(Icons.menu), label: 'Bölümler'),
        ],
      ),
    );
  }

  AppBar _appBarWidget(BuildContext context) {
    final authService =
        Provider.of<AuthService>(context, listen: false); // AuthService'i al

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
          onPressed: () async {
            await authService.signOut(); // Çıkış yap
            context.go('/login'); // Çıkış yapınca giriş sayfasına yönlendir
          },
        ),
      ],
    );
  }
}

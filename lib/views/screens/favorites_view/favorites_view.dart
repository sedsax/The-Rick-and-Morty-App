import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricky_and_mortypp/views/screens/favorites_view/favorites_viewmodel.dart';
import 'package:ricky_and_mortypp/views/widgets/character_card_list_view.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesViewmodel>().getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavoritesViewmodel>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: viewModel.characters.isEmpty
              ? const CircularProgressIndicator.adaptive()
              : Column(
                  children: [
                    CharacterCardListView(characters: viewModel.characters)
                  ],
                ),
        ),
      ),
    );
  }
}
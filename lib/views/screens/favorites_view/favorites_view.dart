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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoritesViewmodel>().getFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesViewmodel>(builder: (context, viewModel, child) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                viewModel.isLoading
                    ? const CircularProgressIndicator.adaptive()
                    : viewModel.charachterList.isEmpty
                        ? const Text('No favorites added.')
                        : CharacterCardListView(
                            characters: viewModel.charachterList,
                          ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

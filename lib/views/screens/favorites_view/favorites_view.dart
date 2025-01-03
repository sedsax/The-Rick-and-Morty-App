import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricky_and_mortypp/views/screens/favorites_view/favorites_viewmodel.dart';
import 'package:ricky_and_mortypp/views/widgets/character_card_list_view.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const  EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            ChangeNotifierProvider(
              create: (_) => FavoritesViewModel(),
              child: Consumer<FavoritesViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.favoriteCharacters == null) {
                    return const CircularProgressIndicator.adaptive();
                  } else {
                    return CharacterCardListView(
                      characters: viewModel.favoriteCharacters!.results,
                      onLoadMore: () => viewModel.favoriteCharacters,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

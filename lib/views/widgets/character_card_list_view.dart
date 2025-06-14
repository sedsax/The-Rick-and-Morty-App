import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';
import 'package:ricky_and_mortypp/views/widgets/charachter_card_view.dart';

class CharacterCardListView extends StatelessWidget {
  final List<CharacterModel> characters;
  final VoidCallback? onLoadMore;
  final bool loadMore;

  const CharacterCardListView({
    super.key,
    required this.characters,
    this.onLoadMore,
    this.loadMore = false,
  });

  @override
  Widget build(BuildContext context) {
    if (characters.isEmpty) {
      return const Center(child: Text('Favori karakterleriniz bulunmamaktadır.'));
    }

    return Flexible(
      child: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final characterModel = characters[index];
          return Column(
            children: [
              CharachterCardView(
                charachterModel: characterModel,
              ),
              if (loadMore && index == characters.length - 1)
                const LinearProgressIndicator()
            ],
          );
        },
      ),
    );
  }
}

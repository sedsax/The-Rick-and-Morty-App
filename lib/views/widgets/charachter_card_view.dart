import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';
import 'package:ricky_and_mortypp/views/screens/favorites_view/favorites_viewmodel.dart';

class CharachterCardView extends StatelessWidget {
  final CharacterModel charachterModel;

  const CharachterCardView({
    super.key,
    required this.charachterModel,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesViewModel = context.watch<FavoritesViewmodel>();
    final isFavorited = favoritesViewModel.isFavorite(charachterModel.id);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    charachterModel.image!,
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(charachterModel.name, 14, FontWeight.w500),
                      const SizedBox(height: 5),
                      _buildLabel('Köken'),
                      _buildText(charachterModel.origin.name, 12, FontWeight.normal),
                      const SizedBox(height: 5),
                      _buildLabel('Durum'),
                      _buildText('${charachterModel.status} - ${charachterModel.species}', 12, FontWeight.normal),
                    ],
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () => favoritesViewModel.toggleFavorite(charachterModel.id),
            icon: Icon(isFavorited ? Icons.bookmark : Icons.bookmark_border),
          ),
        ],
      ),
    );
  }

  Widget _buildText(String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

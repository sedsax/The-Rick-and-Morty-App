import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/app/locator.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';
import 'package:ricky_and_mortypp/services/shared_preferences_sevice.dart';

class CharachterCardView extends StatefulWidget {
  final CharacterModel charachterModel;
  final VoidCallback? onFavoriteToggle;

  const CharachterCardView({
    super.key,
    required this.charachterModel,
    this.onFavoriteToggle,
  });

  @override
  State<CharachterCardView> createState() => _CharachterCardViewState();
}

class _CharachterCardViewState extends State<CharachterCardView> {
  late bool isFavorite;
  final PreferencesService _preferencesService = locator<PreferencesService>();

  @override
  void initState() {
    super.initState();
    isFavorite =
        _preferencesService.isCharachterSaved(widget.charachterModel.id);
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    if (isFavorite) {
      _preferencesService.saveCharachter(widget.charachterModel.id);
    } else {
      _preferencesService.removeCharachter(widget.charachterModel.id);
    }
    if (widget.onFavoriteToggle != null) {
      widget.onFavoriteToggle!();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    widget.charachterModel.image,
                    height: 100,
                  ),
                ), // cliprrect is used to clip the image
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(
                          widget.charachterModel.name, 14, FontWeight.w500),
                      const SizedBox(height: 5),
                      _buildLabel('Köken'),
                      _buildText(widget.charachterModel.origin.name, 12,
                          FontWeight.normal),
                      const SizedBox(height: 5),
                      _buildLabel('Durum'),
                      _buildText(
                          '${widget.charachterModel.status} - ${widget.charachterModel.species}',
                          12,
                          FontWeight.normal),
                    ],
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: toggleFavorite,
            icon: Icon(
              isFavorite ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.blue,
            ),
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

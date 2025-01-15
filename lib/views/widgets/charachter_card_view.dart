import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/app/locator.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';
import 'package:ricky_and_mortypp/services/shared_preferences_sevice.dart';

// ignore: must_be_immutable
class CharachterCardView extends StatefulWidget {
  final CharacterModel charachterModel;
  bool isFavorited;
  CharachterCardView({
    super.key,
    required this.charachterModel,
    this.isFavorited = false,
  });

  @override
  State<CharachterCardView> createState() => _CharachterCardViewState();
}

class _CharachterCardViewState extends State<CharachterCardView> {

  void _favoriteCharacter(){
    if(widget.isFavorited){
      locator<PreferencesService>().removeCharacter(widget.charachterModel.id);
      widget.isFavorited = false;
    }else{
      locator<PreferencesService>().saveCharacter(widget.charachterModel.id);
      widget.isFavorited = true;
    }
    setState(() {});
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
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(widget.charachterModel.name, 14, FontWeight.w500),
                      const SizedBox(height: 5),
                      _buildLabel('Köken'),
                      _buildText(widget.charachterModel.origin.name, 12, FontWeight.normal),
                      const SizedBox(height: 5),
                      _buildLabel('Durum'),
                      _buildText('${widget.charachterModel.status} - ${widget.charachterModel.species}', 12, FontWeight.normal),
                    ],
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed:() => _favoriteCharacter(),
            icon: Icon(widget.isFavorited ? Icons.bookmark : Icons.bookmark_border),
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

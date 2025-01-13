import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/app/locator.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';
import 'package:ricky_and_mortypp/services/shared_preferences_sevice.dart';
import 'package:ricky_and_mortypp/views/widgets/charachter_card_view.dart';

class CharacterCardListView extends StatefulWidget {
  final List<CharacterModel> characters;
  final VoidCallback? onLoadMore;
  final bool loadMore;
  const CharacterCardListView(
      {super.key,
      required this.characters,
      this.onLoadMore,
      this.loadMore = false});

  @override
  State<CharacterCardListView> createState() => _CharacterCardListViewState();
}

class _CharacterCardListViewState extends State<CharacterCardListView> {
  final _scrollController = ScrollController();
  bool _isLoading = true;
  List<int> _favoritedList = [];

  @override
  void initState() {
    _getFavorites();
    _detectScrollBottom();
    super.initState();
  }

  void _setIsLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  void _getFavorites() async {
    _favoritedList = locator<PreferencesService>().getSavedCharachters();
    _setIsLoading(false);
    setState(() {});
  }

  void _detectScrollBottom() {
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      const int delta = 200;

      if (maxScroll - currentPosition <= delta) {
        widget.onLoadMore?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const CircularProgressIndicator.adaptive();
    } else {
      return Flexible(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.characters.length,
          itemBuilder: (context, index) {
            final characterModel = widget.characters[index];
            final bool isFavorited = _favoritedList.contains(characterModel.id);
            return Column(
              children: [
                CharachterCardView(
                  charachterModel: characterModel, isFavorited: isFavorited,
                ),
                if (widget.loadMore && index == widget.characters.length - 1)
                  const LinearProgressIndicator()
              ],
            );
          },
        ),
      );
    }
  }
}

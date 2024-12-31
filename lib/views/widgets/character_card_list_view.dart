import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/models/characters_model.dart';
import 'package:ricky_and_mortypp/views/widgets/charachter_card_view.dart';

class CharacterCardListView extends StatefulWidget {
  final List<CharacterModel> characters;
  final VoidCallback onLoadMore;
  final bool loadMore;
  const CharacterCardListView(
      {super.key,
      required this.characters,
      required this.onLoadMore,
      this.loadMore = false});

  @override
  State<CharacterCardListView> createState() => _CharacterCardListViewState();
}

class _CharacterCardListViewState extends State<CharacterCardListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _detectScrollBottom();
    super.initState();
  }

  void _detectScrollBottom() {
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      const int delta = 50;

      if (maxScroll - currentPosition <= delta) {
        widget.onLoadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.characters.length,
        itemBuilder: (context, index) {
          final characterModel = widget.characters[index];
          return Column(
            children: [
              CharachterCardView(
                charachterModel: characterModel,
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

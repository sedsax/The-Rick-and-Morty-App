import 'package:flutter/material.dart';
import 'package:ricky_and_mortypp/views/widgets/charachter_card_view.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              _searchInputWidget(context),
              const CharachterCardView(
                  image:
                      'https://rickandmortyapi.com/api/character/avatar/108.jpeg',
                  name: 'Rick Sanchez',
                  status: 'Alive',
                  type: 'İnsan',
                  origin: 'Earth - (C137)'),
              const CharachterCardView(
                  image:
                      'https://rickandmortyapi.com/api/character/avatar/108.jpeg',
                  name: 'Rick Sanchez',
                  status: 'Alive',
                  type: 'İnsan',
                  origin: 'Earth - (C137)'),
              const CharachterCardView(
                  image:
                      'https://rickandmortyapi.com/api/character/avatar/108.jpeg',
                  name: 'Rick Sanchez',
                  status: 'Alive',
                  type: 'İnsan',
                  origin: 'Earth - (C137)'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchInputWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 7),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Karakterlerde Ara',
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

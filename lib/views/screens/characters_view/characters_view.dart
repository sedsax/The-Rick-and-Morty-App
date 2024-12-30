import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricky_and_mortypp/views/screens/characters_view/characters_viewmodel.dart';
import 'package:ricky_and_mortypp/views/widgets/charachter_card_view.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  void initState() {
    super.initState();
    context.read<CharactersViewModel>().getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              _searchInputWidget(context),
              Consumer<CharactersViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.charactersModel == null) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else {
                    return Flexible(
                      child: ListView.builder(
                        itemCount: viewModel.charactersModel!.results.length,
                        itemBuilder: (context, index) {
                          final characterModel =
                              viewModel.charactersModel!.results[index];
                          return CharachterCardView(
                            charachterModel: characterModel,
                          );
                        },
                      ),
                    );
                  }
                },
              )
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

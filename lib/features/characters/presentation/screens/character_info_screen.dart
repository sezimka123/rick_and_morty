import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:rick_and_morty/features/characters/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty/features/characters/domain/use_cases/character_use_case.dart';
import 'package:rick_and_morty/features/characters/presentation/logic/bloc/character_bloc.dart';

class CharacterInfoScreen extends StatefulWidget {
  const CharacterInfoScreen({super.key});

  @override
  State<CharacterInfoScreen> createState() => _CharacterInfoScreenState();
}

class _CharacterInfoScreenState extends State<CharacterInfoScreen> {
  CharacterBloc? bloc;

  @override
  void initState() {
    bloc = CharacterBloc(
        CharacterUseCase(characterRepository: CharacterRepositoryImpl()));
    bloc?.add(GetAllCharactersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CharacterBloc, CharacterState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AllCharactersLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AllCharactersErrorState) {
            SmartDialog.dismiss();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error.message.toString(),
                ),
              ),
            );
          }

          if (state is AllCharactersLoadedState) {
            return ListView.builder(
              itemCount: 19,
              itemBuilder: (context, index) {
                return Image.network(
                  state.characterModel.results?[index].image ?? '',
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

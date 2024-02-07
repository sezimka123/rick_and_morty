import 'package:flutter/material.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/localization/bloc/localization_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalizationBloc bloc = getIt<LocalizationBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).test_name(100)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).hello,
              style: TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(ChangeLocaleEvent(locale: 'en'));
              },
              child: Text("English"),
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(ChangeLocaleEvent(locale: 'ru'));
              },
              child: Text("Русский"),
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(ChangeLocaleEvent(locale: 'ky'));
              },
              child: Text("Кыргызча"),
            ),
          ],
        ),
      ),
    );
  }
}

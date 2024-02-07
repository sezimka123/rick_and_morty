import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/auth/presentations/screens/sign_in/sign_in_screen.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/all_characters_screen.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/internal/dependencies/get_it.dart';
import 'package:rick_and_morty/internal/helpers/localization/bloc/localization_bloc.dart';
import 'package:rick_and_morty/internal/helpers/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LocalizationBloc localizationBloc;

  String? locale;

  @override
  void initState() {
    localizationBloc = getIt<LocalizationBloc>();

    localizationHelper();
    super.initState();
  }

  localizationHelper() async {
    String cachedLocale = await LocalizationHelper.getLocale();

    localizationBloc.add(ChangeLocaleEvent(locale: cachedLocale));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocalizationBloc, LocalizationState>(
      bloc: localizationBloc,
      listener: (context, state) {
        if (state is LocalizationLoadedState) {
          locale = state.locale;
        }
      },
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          // Use builder only if you need to use library outside ScreenUtilInit context
          builder: (_, child) {
            return MaterialApp(
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: Locale.fromSubtags(languageCode: locale ?? 'ru'),
              supportedLocales: S.delegate.supportedLocales,
              title: 'Flutter Demo',
              theme: ThemeData(
                ///------ //// ----- //// -------

                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),

                ///------ //// ----- //// -------
                primarySwatch: Colors.blue,
                useMaterial3: true,
              ),
              home: const NavigationScreen(),
            );
          },
        );
      },
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// --------- //// -----

            Container(
              margin: EdgeInsets.all(40.r),
              // height: 380.h, // 812
              height: 0.7.sh, // 70%
              width: 1.sw, // 375 == MediaQuery.of(context).size.width * 0.8
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(40.r),
              ),

              child: Row(
                children: [
                  Icon(
                    Icons.outbond,
                    size: 50.r,
                  ),
                  Text(
                    'Hello World',
                    style: TextStyle(
                      fontSize: 40.sp,
                    ),
                  )
                ],
              ),
            ),

            /// --------- //// -----
            SizedBox(
              width: 319.w,
              height: 48.h,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Login'),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Login2'),
            ),
          ],
        ),
      ),
    );
  }
}

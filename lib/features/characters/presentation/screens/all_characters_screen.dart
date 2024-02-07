import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:rick_and_morty/features/characters/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty/features/characters/domain/use_cases/character_use_case.dart';
import 'package:rick_and_morty/features/characters/presentation/logic/bloc/character_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/screens/character_info_screen.dart';
import 'package:rick_and_morty/features/episodes/presentation/screens/all_episodes_screen.dart';
import 'package:rick_and_morty/features/locations/presentation/screens/all_locations_screen.dart';
import 'package:rick_and_morty/features/settings/presentation/screens/all_settings_screen.dart';
import 'package:rick_and_morty/internal/helpers/utils.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;
  int _selectedIndex = 0;

  List<Widget> screenList = const [
    AllCharactersScreen(),
    AllLocationsScreen(),
    AllEpisodesScreen(),
    AllSettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          color: Color(0xFF22A2BD),
        ),
        selectedItemColor: Color(0xFF22A2BD),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/character.png",
              height: 24.h,
              width: 24.w,
            ),
            activeIcon: Image.asset(
              "assets/images/character.png",
              height: 24.h,
              width: 24.w,
              color: Color(0xFF22A2BD),
            ),
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/location.png",
              height: 24.h,
              width: 24.w,
            ),
            activeIcon: Image.asset(
              "assets/images/location.png",
              height: 24.h,
              width: 24.w,
              color: Color(0xFF22A2BD),
            ),
            label: 'Локациии',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/episode.png",
              height: 24.h,
              width: 24.w,
            ),
            activeIcon: Image.asset(
              "assets/images/episode.png",
              height: 24.h,
              width: 24.w,
              color: Color(0xFF22A2BD),
            ),
            label: 'Эпизоды',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/settings.png",
              height: 24.h,
              width: 24.w,
            ),
            activeIcon: Image.asset(
              "assets/images/settings.png",
              height: 24.h,
              width: 24.w,
              color: Color(0xFF22A2BD),
            ),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}

class AllCharactersScreen extends StatefulWidget {
  const AllCharactersScreen({super.key});

  @override
  State<AllCharactersScreen> createState() => _AllCharactersScreenState();
}

class _AllCharactersScreenState extends State<AllCharactersScreen> {
  late CharacterBloc bloc;
  bool isListView = true;

  @override
  void initState() {
    bloc = CharacterBloc(
        CharacterUseCase(characterRepository: CharacterRepositoryImpl()));
    bloc.add(GetAllCharactersEvent());
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              child: Column(
                children: [
                  SizedBox(height: 36.h),
                  Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100).r,
                      color: Color(0xFFF2F2F2),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Найти персонажа",
                        hintStyle: TextStyle(
                          color: Color(0xFF5B6975),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.filter_alt_outlined),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Text(
                        "Всего персонажей: 200",
                        style: TextStyle(
                          color: Color(0xFF828282),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          isListView = !isListView;
                          setState(() {});
                        },
                        icon: Icon(isListView
                            ? Icons.format_list_bulleted_outlined
                            : Icons.grid_view_outlined),
                      ),
                    ],
                  ),
                  isListView
                      ? Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 24);
                            },
                            itemCount: 19,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterInfoScreen()));
                                },
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(37),
                                      child: Image.network(
                                        state.characterModel.results?[index]
                                                .image ??
                                            '',
                                        height: 74.h,
                                        width: 74.w,
                                      ),
                                    ),
                                    SizedBox(width: 18),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          statusConverter(
                                              "${state.characterModel.results?[index].status}"),
                                          style: TextStyle(
                                            color: Color(statusColorConverter(
                                                "${state.characterModel.results?[index].status}")),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          state.characterModel.results?[index]
                                                  .name ??
                                              '',
                                          style: TextStyle(
                                            color: Color(0xFF0B1E2D),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "${speciesConverter("${state.characterModel.results?[index].species}")}, ${genderConverter("${state.characterModel.results?[index].gender}")}",
                                          style: TextStyle(
                                            color: Color(0xFF828282),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 200,
                            ),
                            itemCount: 19,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.network(
                                      state.characterModel.results?[index]
                                              .image ??
                                          '',
                                      height: 120.h,
                                      width: 120.w,
                                    ),
                                  ),
                                  SizedBox(height: 18),
                                  Text(
                                    statusConverter(
                                        "${state.characterModel.results?[index].status}"),
                                    style: TextStyle(
                                      color: Color(statusColorConverter(
                                          "${state.characterModel.results?[index].status}")),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    state.characterModel.results?[index].name ??
                                        '',
                                    style: TextStyle(
                                      color: Color(0xFF0B1E2D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "${speciesConverter("${state.characterModel.results?[index].species}")}, ${genderConverter("${state.characterModel.results?[index].gender}")}",
                                    style: TextStyle(
                                      color: Color(0xFF828282),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                ],
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:symmetryk/components/snackbar.dart';
import 'package:symmetryk/pages/brief_cases.dart';
import 'package:symmetryk/statics.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateTime? backButtonPressTime;
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
  final PageController _pageController = PageController();

  Future<bool> handleWillPop(BuildContext context) async {
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null ||
            now.difference(backButtonPressTime!) > const Duration(seconds: 3);

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      ShowSnackBar().showSnackBar(
        context,
        "Press Back Again to Exit App",
        duration: const Duration(seconds: 2),
        noAction: true,
      );
      return false;
    }
    return true;
  }


  void _onItemTapped(int index) {
    _selectedIndex.value = index;
    _pageController.jumpToPage(
      index,
    );
  }

    @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.primaryColor,
          title: Image.asset('assets/logo-without-text.png',
              width: 50, height: 50, fit: BoxFit.cover),
              actions: [
                IconButton(onPressed: () => print("search"), icon: const Icon(CupertinoIcons.search))
              ],
          toolbarHeight: 70,
        ),
        drawer: Drawer(
          child: CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(delegate: SliverChildListDelegate([
                Container(color: Palette.primaryColor,height: 21),
                Image.asset("assets/logo.PNG")
              ])),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ListTile(
                      title: Text(
                        "home",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                      leading: Icon(
                        Icons.home_rounded,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      selected: true,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),                 
                    ListTile(
                      title: Text("downs"),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                      leading: Icon(
                        Icons.download_done_rounded,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onTap: () {
                      },
                    ),
                    ListTile(
                      title: Text("playlists"),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                      leading: Icon(
                        Icons.playlist_play_rounded,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onTap: () {
                      },
                    ),
                    ListTile(
                      title: Text("settings"),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                      leading: Icon(
                        Icons
                            .settings_rounded, // miscellaneous_services_rounded,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onTap: () {
                        print("set");
                      },
                    ),
                    ListTile(
                      title: Text("about"),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                      leading: Icon(
                        Icons.info_outline_rounded,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      onTap: () {
                        print("about");
                      },
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 30, 5, 20),
                      child: Center(
                        child: Text(
                          "made by",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: WillPopScope(
        onWillPop: () => handleWillPop(context),
        child: PageView(
          onPageChanged: (indx) {
            _selectedIndex.value = indx;
          },
          controller: _pageController,
          children: [
            Briefcases(),
            Container(color: Colors.blue),
            Container(color: Colors.yellow),
            Container(color: Colors.green),
          ],
        ),
      ),
        bottomNavigationBar: SafeArea(
            child: ValueListenableBuilder(
                valueListenable: _selectedIndex,
                builder: (BuildContext context, int indexValue, Widget? child) {
                  return AnimatedContainer(
                    color: Palette.primaryColor,
              duration: const Duration(milliseconds: 100),
              height: 60,
              child: SalomonBottomBar(
                currentIndex: indexValue,
                onTap: _onItemTapped,
                items: [
                  /// Home
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.home_rounded),
                    title: const Text("Home"),
                    selectedColor: Palette.secondaryColor,
                    unselectedColor: Colors.white
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(CupertinoIcons.chart_bar_alt_fill),
                    title: const Text("Calls"),
                    selectedColor: Palette.secondaryColor,
                    unselectedColor: Colors.white
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(CupertinoIcons.bookmark_fill),
                    title: const Text("Favoris"),
                    selectedColor: Palette.secondaryColor,
                    unselectedColor: Colors.white
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(CupertinoIcons.settings),
                    title: const Text("Profil"),
                     selectedColor: Palette.secondaryColor,
                    unselectedColor: Colors.white
                  ),
                ],
              ),
            );
                })));
  }
}

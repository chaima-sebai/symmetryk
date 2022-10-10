import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:symmetryk/pages/home_page.dart';
import 'package:symmetryk/pages/login_page.dart';
import 'package:symmetryk/statics.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  setOptimalDisplayMode();

    await Hive.initFlutter();
    await openHiveBox('settings');

  runApp(const MyApp());
}

  Future<void> openHiveBox(String boxName, {bool limit = false}) async {
    if (limit) {
      final box =
          await Hive.openBox(boxName).onError((error, stackTrace) async {
        final Directory dir = await getApplicationDocumentsDirectory();
        final String dirPath = dir.path;
        final File dbFile = File('$dirPath/$boxName.hive');
        final File lockFile = File('$dirPath/$boxName.lock');
        await dbFile.delete();
        await lockFile.delete();
        await Hive.openBox(boxName);
        print("box open :" + boxName);
        throw 'Failed to open $boxName Box\nError: $error';
      });
      // clear box if it grows large
      if (box.length > 500) {
        box.clear();
        print("box clear :" + boxName);
      }
      await Hive.openBox(boxName);
      print("box open after else :" + boxName);
    } else {
      await Hive.openBox(boxName).onError((error, stackTrace) async {
        final Directory dir = await getApplicationDocumentsDirectory();
        final String dirPath = dir.path;
        final File dbFile = File('$dirPath/$boxName.hive');
        final File lockFile = File('$dirPath/$boxName.lock');
        await dbFile.delete();
        await lockFile.delete();
        await Hive.openBox(boxName);
        print("dbfile and lockfile deleted and box open : :" + boxName);
        throw 'Failed to open $boxName Box\nError: $error';
      });
    }
  }

Future<void> setOptimalDisplayMode() async {
  final List<DisplayMode> supported = await FlutterDisplayMode.supported;
  final DisplayMode active = await FlutterDisplayMode.active;

  final List<DisplayMode> sameResolution = supported
      .where((DisplayMode m) =>
          m.width == active.width && m.height == active.height)
      .toList()
    ..sort((DisplayMode a, DisplayMode b) =>
        b.refreshRate.compareTo(a.refreshRate));

  final DisplayMode mostOptimalMode =
      sameResolution.isNotEmpty ? sameResolution.first : active;

  await FlutterDisplayMode.setPreferredMode(mostOptimalMode);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Palette.primaryColor,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.transparent),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Symmetryk',
      restorationScopeId: 'Symmetryk',
      debugShowCheckedModeBanner: false,
      theme: themeDarkData(context),
      darkTheme: themeDarkData(context),
      initialRoute: '/',
      routes: {
        '/': (context) => initialFuntion(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }

  Widget initialFuntion() {
    dynamic rememberMe = Hive.box('settings').get('remember') == null
        ? false
        : (Hive.box('settings').get('remember') as bool);
    return rememberMe ? const HomePage() : const LoginPage();
  }
}

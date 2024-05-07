import 'package:annakku_sehat_app/models/anak.dart';
import 'package:annakku_sehat_app/screens/daftar_anak_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/splash_screen.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 255, 255, 255),
  background: const Color.fromARGB(255, 221, 242, 237),
);

final theme = ThemeData().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: const TextTheme(
    // Define text styles using the Rowdies font directly
    titleMedium: TextStyle(
      fontFamily: 'Rowdies',
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 50, // titleMedium
    ),
    titleSmall: TextStyle(
      fontFamily: 'Rowdies',
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 45, // titleSmall
    ),
    titleLarge: TextStyle(
      fontFamily: 'Rowdies',
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 20, // titleLarge
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Rowdies',
      fontWeight: FontWeight.w300,
      color: Color.fromARGB(255, 125, 125, 125),
      fontSize: 19, // bodyMedium
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Rowdies',
      fontWeight: FontWeight.w300,
      color: Colors.black,
      fontSize: 19, // bodyLarge
    ),
  ),
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  var activeScreen = 'splash-screen';
  List<Anak> anaks = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    navigateToInitDataScreen(); // Call the function to navigate after delay
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  // Function to navigate to initDataScreen after delay
  void navigateToInitDataScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          setState(() {
            // for (var i = 0; i < anakDummyData.length; i++) {
            //   ref.read(anakProvider.notifier).addAnak(anakDummyData[i]);
            // }
            activeScreen = 'daftar-anak-screen';
          });
        }
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

    if (activeScreen == 'splash-screen') {
      currentScreen = const SplashScreen();
    } else if (activeScreen == 'daftar-anak-screen') {
      currentScreen = const DaftarAnakScreen();
    } else {
      // Handle other cases if needed
      currentScreen =
          const SizedBox(); // Placeholder, you can replace it with a suitable widget
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anakku Sehat!',
      theme: theme,
      home: currentScreen,
    );
  }
}

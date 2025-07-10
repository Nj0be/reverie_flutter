import 'package:flutter/material.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reverieflutter/router.dart';
import 'package:reverieflutter/ui/screens/all_time_capsules_screen.dart';
import 'package:reverieflutter/ui/screens/profile_screen.dart';
import 'package:reverieflutter/ui/themes/colors.dart';
import 'package:reverieflutter/ui/screens/all_diaries_screen.dart';
import 'package:reverieflutter/utils.dart';
import '../firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // TODO: use FutureBuilder instead?
  // initialize libphonenumberutil
  await init();

  runApp(
      ProviderScope(
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Reverie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secondary),
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            // Set the predictive back transitions for Android.
            TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          },
        ),
      ),
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

class MainScaffold extends StatefulWidget {
  final String title;
  final Widget child;
  final String currentPath;
  final bool hideBars;

  const MainScaffold({
    super.key,
    required this.title,
    required this.child,
    required this.currentPath,
    this.hideBars = false,
  });

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  @override
  Widget build(BuildContext context) {
    var currentIndex = 0;

    if (widget.currentPath == AllDiariesScreen.path) {
      currentIndex = 0;
    } else if (widget.currentPath == AllTimeCapsulesScreen.path) {
      currentIndex = 1;
    }

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Text(widget.title),
        ),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: widget.hideBars
            ? []
            : [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  child:
                  IconButton(
                    icon: const Icon(Icons.person),
                    tooltip: AppLocalizations.of(context)!.yourProfile,
                    onPressed: () {
                      context.pushNamed(
                        ProfileScreen.name,
                        pathParameters: {'profileId': ?getUserId()},
                      );
                    },
                  ),
                ),
              ],
      ),
      body: widget.child,
      bottomNavigationBar: widget.hideBars
          ? null
          : BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: AppLocalizations.of(context)!.allDiaries,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_books_rounded),
                  label: AppLocalizations.of(context)!.timeCapsule,
                ),
              ],
              currentIndex: currentIndex,
              selectedItemColor: AppColors.secondary,
              onTap: (index) {
                if (index == currentIndex) return;
                switch (index) {
                  case 0:
                    context.goNamed(AllDiariesScreen.name);
                    break;
                  case 1:
                    context.goNamed(AllTimeCapsulesScreen.name);
                    break;
                }
              },
            ),
    );
  }
}

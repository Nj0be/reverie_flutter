import 'package:flutter/material.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reverie_flutter/router.dart';
import 'package:reverie_flutter/ui/screens/all_time_capsules_screen.dart';
import 'package:reverie_flutter/ui/screens/profile_screen.dart';
import 'package:reverie_flutter/ui/themes/colors.dart';
import 'package:reverie_flutter/ui/screens/all_diaries_screen.dart';
import 'package:reverie_flutter/utils.dart';
import '../firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // TODO: use FutureBuilder instead?
  // initialize libphonenumberutil
  await init();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Reverie',
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
      locale: const Locale('en'),
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
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: widget.hideBars
            ? []
            : [
                IconButton(
                  icon: const Icon(Icons.person),
                  tooltip: AppLocalizations.of(context)!.yourProfile,
                  onPressed: () {
                    context.pushNamed(
                      ProfileScreen.name,
                      pathParameters: {'id': ?getUserId()},
                    );
                  },
                ),
              ],
      ),
      body: widget.child,
      drawer: widget.hideBars
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: AppColors.background),
                    child: Text(AppLocalizations.of(context)!.settings),
                  ),
                  ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text(AppLocalizations.of(context)!.help),
                  ),
                ],
              ),
            ),
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
                setState(() {
                  currentIndex = index; // update current index state
                });
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

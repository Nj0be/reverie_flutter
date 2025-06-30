import 'package:flutter/material.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reverie_flutter/ui/screens/edit_profile_screen.dart';
import 'package:reverie_flutter/ui/screens/login_screen.dart';
import 'package:reverie_flutter/ui/screens/profile_screen.dart';
import 'package:reverie_flutter/ui/themes/colors.dart';
import 'package:reverie_flutter/ui/screens/all_diaries_screen.dart';
import 'package:reverie_flutter/utils.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

final _router = GoRouter(
  initialLocation: isUserAuthenticated() ? '/' : '/login',
  routes: [
    ShellRoute(
      builder: (
          BuildContext context,
          GoRouterState state,
          Widget child,
          ) {
        return MainScaffold(
          title: 'Reverie',
          child: child,
          currentPath: state.uri.path,
        );
      },
      routes: [
        // Route for viewing all diaries
        GoRoute(
          name: 'view_all_diaries',
          path: '/',
          builder: (context, state) => const AllDiariesScreen(),
        ),

        // Route for viewing a profile
        GoRoute(
          name: 'view_profile',
          path: '/profile/:profileId',
          builder: (context, state) {
            final profileId = state.pathParameters['profileId']!;
            return ProviderScope(
              overrides: [
                profileIdProvider.overrideWithValue(profileId),
              ],
              child: ProfileScreen(
                onEditProfile: (id) {
                  context.goNamed(
                    'edit_profile',
                    pathParameters: {'profileId': id},
                  );
                },
                onLogout: (id) {
                  // Handle logout
                },
              ),
            );
          },
        ),

        // Route for editing a profile
        GoRoute(
          name: 'edit_profile',
          path: '/profile/:profileId/edit',
          builder: (context, state) {
            final profileId = state.pathParameters['profileId']!;
            return ProviderScope(
              overrides: [
                profileIdProvider.overrideWithValue(profileId),
              ],
              child: EditProfileScreen(
                onComplete: (updatedProfile) {
                  // Navigate back to the profile page after editing
                  context.goNamed(
                    'view_profile',
                    pathParameters: {'profileId': updatedProfile.id},
                  );
                },
              ),
            );
          },
        ),

        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) {
            return ProviderScope(
              child: LoginScreen(
                onLoginSuccess: () {
                  // Navigate back to the profile page after editing
                  context.goNamed(
                    'view_all_diaries',
                  );
                },
                onNavigateToRegister: (){},
                onNavigateToResetPassword: (){},
              ),
            );
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Reverie',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secondary),
      ),
      routerConfig: _router,
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

  const MainScaffold({
    super.key,
    required this.title,
    required this.child,
    required this.currentPath
  });

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  @override
  Widget build(BuildContext context) {
    final path = widget.currentPath;

    // Determina index attuale basato sulla route
    final currentIndex = switch (path) {
      _ when path.startsWith('/profile') => 1,
      _ => 0,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: widget.child,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.background,
              ),
              child: Text(AppLocalizations.of(context)!.settings),
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text(AppLocalizations.of(context)!.help),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: AppLocalizations.of(context)!.allDiaries,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: AppColors.secondary,
        onTap: (index) {
          if (index == currentIndex) return;
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              // final userId = FirebaseAuth.instance.currentUser?.uid;
              final userId = getUserId(); // userId for testing before login implementation
              if (userId != null) {
                context.goNamed(
                  'view_profile',
                  pathParameters: {'profileId': userId},
                );
              } else {
                // L'utente non è loggato
                ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text("User not authenticated")),
                );
              }
              break;
          }
        },
      ),
    );
  }
}

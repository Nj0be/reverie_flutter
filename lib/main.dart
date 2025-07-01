import 'package:flutter/material.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reverie_flutter/ui/screens/edit_profile_screen.dart';
import 'package:reverie_flutter/ui/screens/login_screen.dart';
import 'package:reverie_flutter/ui/screens/profile_screen.dart';
import 'package:reverie_flutter/ui/screens/reset_password_screen.dart';
import 'package:reverie_flutter/ui/screens/signup_screen.dart';
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
  initialLocation: isUserAuthenticated() ? '/' : LoginScreen.path,
  routes: [
    ShellRoute(
      builder: (
          BuildContext context,
          GoRouterState state,
          Widget child,
          ) {
        return MainScaffold(
          title: AppLocalizations.of(context)!.reverie,
          currentPath: state.uri.path,
          child: child,
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
          name: ProfileScreen.name,
          path: ProfileScreen.path,
          builder: (context, state) {
            final profileId = state.pathParameters['profileId']!;
            return ProviderScope(
              overrides: [
                profileIdProvider.overrideWithValue(profileId),
              ],
              child: ProfileScreen(
                onEditProfile: (id) {
                  context.goNamed(
                    EditProfileScreen.name,
                    pathParameters: {'profileId': id},
                  );
                },
                onLogout: () {
                  logout();
                  context.goNamed(LoginScreen.name);
                },
              ),
            );
          },
        ),

        // Route for editing a profile
        GoRoute(
          name: EditProfileScreen.name,
          path: EditProfileScreen.path,
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
                    ProfileScreen.name,
                    pathParameters: {'profileId': updatedProfile.id},
                  );
                },
              ),
            );
          },
        ),

        GoRoute(
          name: LoginScreen.name,
          path: LoginScreen.path,
          builder: (context, state) {
            return ProviderScope(
              child: LoginScreen(
                onLoginSuccess: () {
                  // Navigate back to the profile page after editing
                  context.goNamed(
                    'view_all_diaries',
                  );
                },
                onNavigateToSignup: (){
                  context.goNamed(SignupScreen.name);
                },
                onNavigateToResetPassword: (){
                  context.goNamed(ResetPasswordScreen.name);
                },
              ),
            );
          },
        ),

        GoRoute(
          name: SignupScreen.name,
          path: SignupScreen.path,
          builder: (context, state) {
            return ProviderScope(
              child: SignupScreen(
                onSignupSuccess: () {
                  // handle signup success
                  context.goNamed(
                    LoginScreen.name,
                  );
                },
                onNavigateToLogin: (){
                  context.goNamed(
                    LoginScreen.name,
                  );
                },
              ),
            );
          },
        ),

        GoRoute(
          name: ResetPasswordScreen.name,
          path: ResetPasswordScreen.path,
          builder: (context, state) {
            return ProviderScope(
              child: ResetPasswordScreen(
                onResetPasswordSuccess: () {
                  // handle signup success
                  context.goNamed(
                    LoginScreen.name,
                  );
                },
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
    final currentIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: AppLocalizations.of(context)!.yourProfile,
            onPressed: () {
              context.goNamed(
                ProfileScreen.name,
                pathParameters: {'profileId': ?getUserId()},
              );
            },
          ),
        ],
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
              //context.goNamed()
              break;
          }
        },
      ),
    );
  }
}

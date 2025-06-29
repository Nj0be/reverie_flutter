import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reverie_flutter/data/repository/diary_repository.dart';
import 'package:reverie_flutter/data/repository/user_repository.dart';
import 'package:reverie_flutter/storage_service.dart';
import 'package:reverie_flutter/navigation/diary_route.dart';
import 'package:reverie_flutter/navigation/profile_route.dart';
import 'package:reverie_flutter/ui/screens/edit_profile_screen.dart';
import 'package:reverie_flutter/ui/screens/profile_screen.dart';
import 'package:reverie_flutter/ui/themes/colors.dart';
import 'package:reverie_flutter/ui/screens/all_diaries_screen.dart';
import 'package:reverie_flutter/viewmodel/edit_profile_viewmodel.dart';
import 'package:reverie_flutter/viewmodel/profile_viewmodel.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => FirebaseFirestore.instance),
        Provider(create: (context) => StorageService(
          firestore: context.read()
        )),
        Provider(create: (context) => UserRepository(
            storage: context.read()
        )),
        Provider(create: (context) => DiaryRepository(
            storage: context.read()
        )),
      ],
      child: MyApp(),
    ),
  );
}

final _router = GoRouter(
  initialLocation: '/',
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
        GoRoute(
          name: 'view_all_diaries',
          path: '/',
          builder: (context, state) => const AllDiariesScreen()
        ),
        GoRoute(
          name: 'view_profile',
          path: '/profile/:profileId',  // param dinamico
          builder: (context, state) {
            final profileId = state.pathParameters['profileId']!;
            return ChangeNotifierProvider(
              create: (_) => ProfileViewModel(
                userRepository: context.read<UserRepository>(),
                auth: FirebaseAuth.instance,
                profileId: profileId,
              ),
              child: ProfileScreen(
                onEditProfile: (id) {
                  context.goNamed(
                    'edit_profile',
                    pathParameters: {'profileId': id},
                  );
                },
                onLogout: (id) {
                  // gestione logout
                },
              ),
            );
          },
        ),
        // Aggiungi questa rotta per edit_profile:
        GoRoute(
          name: 'edit_profile',
          path: '/profile/:profileId/edit',
          builder: (context, state) {
            final profileId = state.pathParameters['profileId']!;
            return ChangeNotifierProvider(
              create: (_) => EditProfileViewModel(
                repository: context.read<UserRepository>(),
                profileId: profileId,
                context: context,
              ),
              child: EditProfileScreen(
                onComplete: (updatedProfile) {
                  // Torna alla pagina del profilo dopo modifica
                  context.goNamed('view_profile', pathParameters: {'profileId': updatedProfile.id});
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
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.background,
              ),
              child: Text('Impostazioni'),
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Aiuto e Feedbacks'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Diaries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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
              final userId = '86GXIqMY3oA2YTXdISX4'; // userId for testing before login implementation
              if (userId != null) {
                context.goNamed(
                  'view_profile',
                  pathParameters: {'profileId': userId},
                );
              } else {
                // L'utente non è loggato
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Utente non autenticato')),
                );
              }
              break;
          }
        },
      ),
    );
  }
}

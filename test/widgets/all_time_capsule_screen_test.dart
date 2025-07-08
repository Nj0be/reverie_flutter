import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reverieflutter/data/model/time_capsule.dart';
import 'package:reverieflutter/data/repository/time_capsule_repository.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/notifier/all_time_capsules_notifier.dart';
import 'package:mockito/mockito.dart';
import 'package:reverieflutter/ui/screens/all_time_capsules_screen.dart';

import '../mocks.mocks.dart';

class MockRepo extends Mock implements TimeCapsuleRepository {}
class MockAuth extends Mock implements FirebaseAuth {}
class MockLoc extends Mock implements AppLocalizations {}

void main() {
  late MockTimeCapsuleRepository mockRepo;
  late MockFirebaseAuth mockAuth;
  late MockUser mockUser;
  final userId = 'test-user-id';

  setUp(() {
    mockRepo = MockTimeCapsuleRepository();
    mockAuth = MockFirebaseAuth();
    mockUser = MockUser();

    when(mockAuth.currentUser).thenReturn(mockUser);
    when(mockUser.uid).thenReturn(userId);
  });

  testWidgets('Displays time capsule title', (tester) async {
    final message = 'Messaggio per il futuro';

    final fakeTimeCapsule = TimeCapsule(
      id: '1',
      userId: userId,
      title: message,
      content: 'Ciao futuro me! Spero che tu abbia raggiunto i tuoi sogni.',
      deadline: Timestamp.fromDate(DateTime(2030, 1, 1)),
      emails: [],
      phones: [],
      receiversIds: [userId],
      creationDate: Timestamp.fromDate(DateTime(2029, 1, 1)),
      isSent: false,
    );

    final fakeState = AsyncValue.data(
      AllTimeCapsulesState(
        sentTimeCapsules: {'1': fakeTimeCapsule},
        receivedTimeCapsules: {},
        buttonState: TimeCapsuleType.scheduled,
      ),
    );

    final notifier = AllTimeCapsulesNotifier(
      profileId: userId,
      repository: mockRepo,
      auth: mockAuth,
    );

    notifier.state = fakeState;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          allTimeCapsulesNotifierProvider(userId).overrideWith((_) => notifier),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en')],
          home: AllTimeCapsulesScreen(
            profileId: userId,
            onNavigateToCreateTimeCapsule: () async => fakeTimeCapsule,
            onNavigateToViewTimeCapsule: (_, _) {},
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Controlla che il titolo della capsula sia visibile
    expect(find.text(message), findsOneWidget);

    // Verifica che il FloatingActionButton esista
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
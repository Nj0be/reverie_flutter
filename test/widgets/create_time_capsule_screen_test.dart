import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:reverieflutter/data/model/time_capsule.dart';
import 'package:reverieflutter/data/repository/time_capsule_repository.dart';
import 'package:reverieflutter/data/repository/user_repository.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/notifier/create_time_capsule_notifier.dart';
import 'package:reverieflutter/ui/components/content_text_field.dart';
import 'package:reverieflutter/ui/components/phone_number.dart';
import 'package:reverieflutter/ui/components/single_field.dart';
import 'package:reverieflutter/ui/screens/create_time_capsule_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../mocks.mocks.dart';

class MockTimeCapsuleRepo extends Mock implements TimeCapsuleRepository {}
class MockUserRepo extends Mock implements UserRepository {}
class MockAuth extends Mock implements FirebaseAuth {}
class MockLoc extends Mock implements AppLocalizations {}

class FakeCreateTimeCapsuleNotifier extends CreateTimeCapsuleNotifier {
  bool createCalled = false;

  FakeCreateTimeCapsuleNotifier({
    required super.repository,
    required super.userRepository,
    required super.auth,
    required super.localizations,
  });

  @override
  void createTimeCapsule(void Function(TimeCapsule) onComplete) {
    createCalled = true;
  }
}

void main() {
  late MockTimeCapsuleRepository mockTimeCapsuleRepo;
  late MockUserRepository mockUserRepo;
  late MockFirebaseAuth mockAuth;
  late MockUser mockUser;
  late MockAppLocalizations mockLoc;

  setUp(() {
    mockTimeCapsuleRepo = MockTimeCapsuleRepository();
    mockUserRepo = MockUserRepository();
    mockUser = MockUser();
    mockAuth = MockFirebaseAuth();
    mockLoc = MockAppLocalizations();

    when(mockAuth.currentUser).thenReturn(mockUser);
    when(mockUser.uid).thenReturn('test-user-id');
  });

  testWidgets('Renders and triggers create button to create TimeCapsule', (tester) async {
    final create = 'Create';
    final selectDate = 'Select Date';

    final fakeTimeCapsule = TimeCapsule(
      id: '1',
      userId: 'test-user-id',
      title: '',
      content: '',
      deadline: Timestamp.now(),
      emails: [],
      phones: [],
      receiversIds: [],
      creationDate: Timestamp.now(),
      isSent: false,
    );

    final fakeState = CreateTimeCapsuleState(timeCapsule: fakeTimeCapsule);

    final fakeNotifier = FakeCreateTimeCapsuleNotifier(
      repository: mockTimeCapsuleRepo,
      userRepository: mockUserRepo,
      auth: mockAuth,
      localizations: mockLoc,
    )..state = fakeState;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          createTimeCapsuleNotifierProvider.overrideWith((_) => fakeNotifier),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: CreateTimeCapsuleScreen(onComplete: (_) {}),
          ),
        ),
      ),
    );

    await tester.pump();

    // Controlla che ci siano i widget principali
    expect(find.text(create), findsOneWidget);
    expect(find.text(selectDate), findsOneWidget);
    expect(find.byType(SingleLineFieldWithError), findsNWidgets(2));
    expect(find.byType(ContentTextFieldWithError), findsOneWidget);
    expect(find.byType(PhoneNumberField), findsOneWidget);

    // Tap sul bottone "Create"
    await tester.ensureVisible(find.text(create));

    await tester.tap(find.text(create));
    await tester.pump();

    // Verifica che sia stata chiamata createTimeCapsule
    expect(fakeNotifier.createCalled, isTrue);
  });
}
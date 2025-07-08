import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reverieflutter/data/model/diary.dart';
import 'package:reverieflutter/data/model/diary_cover.dart';
import 'package:reverieflutter/data/repository/diary_repository.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/notifier/all_diaries_notifier.dart';
import 'package:reverieflutter/ui/screens/all_diaries_screen.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

class MockRepo extends Mock implements DiaryRepository {}
class MockAuth extends Mock implements FirebaseAuth {}
class MockLoc extends Mock implements AppLocalizations {}

void main() {
  late MockDiaryRepository mockRepo;
  late MockFirebaseAuth mockAuth;
  late MockUser mockUser;
  final userId = 'test-user-id';

  setUp(() {
    mockRepo = MockDiaryRepository();
    mockAuth = MockFirebaseAuth();
    mockUser = MockUser();

    when(mockAuth.currentUser).thenReturn(mockUser);
    when(mockUser.uid).thenReturn(userId);
  });

  testWidgets('Displays diary title and description', (tester) async {
    final title = 'Titolo Test';
    final description = 'Descrizione Test';

    final fakeDiary = Diary(
      id: '1',
      title: title,
      description: description,
      coverId: 'cover1',
      pageIds: ['p1', 'p2'],
      creationDate: Timestamp(1, 1),
    );

    final fakeCover = DiaryCover(url: 'https://example.com/cover.jpg');

    final fakeState = AsyncValue.data(
      AllDiariesState(
        diaries: [fakeDiary],
        diaryCoversMap: {'cover1': fakeCover},
        deleteDialogState: false,
        currentIndex: 0,
        pageController: PageController(),
      ),
    );

    final notifier = AllDiariesNotifier(
      profileId: userId,
      repository: mockRepo,
    );

    notifier.state = fakeState;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          allDiariesNotifierProvider(userId).overrideWith((_) => notifier),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en')],
          home: AllDiariesScreen(
            profileId: userId,
            onNavigateToDiary: (_) {},
            onNavigateToEditDiary: (_) async => fakeDiary,
            onNavigateToCreateDiary: () async => fakeDiary,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verifiche
    expect(find.text(title), findsOneWidget);
    expect(find.text(description), findsOneWidget);
    expect(find.byIcon(Icons.edit), findsOneWidget);
    expect(find.byIcon(Icons.delete_outline), findsOneWidget);
  });
}
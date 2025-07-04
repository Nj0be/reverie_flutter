import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reverie_flutter/data/model/diary.dart';
import 'package:reverie_flutter/data/model/diary_cover.dart';
import 'package:reverie_flutter/data/repository/diary_repository.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/notifier/all_diaries_notifier.dart';
import 'package:reverie_flutter/ui/screens/all_diaries_screen.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

class MockRepo extends Mock implements DiaryRepository {}
class MockAuth extends Mock implements FirebaseAuth {}
class MockLoc extends Mock implements AppLocalizations {}

void main() {
  late MockDiaryRepository mockRepo;
  late MockFirebaseAuth mockAuth;
  late MockUser mockUser;
  late MockAppLocalizations mockLoc;

  setUp(() {
    mockRepo = MockDiaryRepository();
    mockAuth = MockFirebaseAuth();
    mockUser = MockUser();
    mockLoc = MockAppLocalizations();

    when(mockAuth.currentUser).thenReturn(mockUser);
    when(mockUser.uid).thenReturn('test-user-id');

    when(mockLoc.confirmDiaryDeletion).thenReturn('Confermi cancellazione?');
    when(mockLoc.deleteDiary).thenReturn('Questa azione è irreversibile.');
    when(mockLoc.cancel).thenReturn('Annulla');
    when(mockLoc.delete).thenReturn('Elimina');
    when(mockLoc.errorMessage).thenReturn('Errore');
  });

  testWidgets('Visualizza titolo e descrizione del diario', (tester) async {
    final fakeDiary = Diary(
      id: '1',
      title: 'Titolo Test',
      description: 'Descrizione Test',
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
      repository: mockRepo,
      auth: mockAuth,
      localizations: mockLoc,
    );

    notifier.state = fakeState;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          allDiariesNotifierProvider.overrideWith((_) => notifier),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
          home: AllDiariesScreen(
            onNavigateToDiary: (_) {},
            onNavigateToEditDiary: (_) async => fakeDiary,
            onNavigateToCreateDiary: () async => fakeDiary,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verifiche
    expect(find.text('Titolo Test'), findsOneWidget);
    expect(find.text('Descrizione Test'), findsOneWidget);
    expect(find.byIcon(Icons.edit), findsOneWidget);
    expect(find.byIcon(Icons.delete_outline), findsOneWidget);
  });
}
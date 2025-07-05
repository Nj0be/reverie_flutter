import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:reverieflutter/data/model/diary.dart';
import 'package:reverieflutter/data/model/diary_cover.dart';
import 'package:reverieflutter/data/repository/diary_repository.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/notifier/edit_diary_notifier.dart';
import 'package:reverieflutter/ui/components/content_text_field.dart';
import 'package:reverieflutter/ui/components/single_field.dart';
import 'package:reverieflutter/ui/screens/edit_diary_screen.dart';

import '../mocks.mocks.dart';

class MockRepo extends Mock implements DiaryRepository {}
class MockAuth extends Mock implements FirebaseAuth {}
class MockLoc extends Mock implements AppLocalizations {}

class FakeEditDiaryNotifier extends EditDiaryNotifier {
  bool saveCalled = false;


  FakeEditDiaryNotifier({
    required super.diaryId,
    required super.repository,
    required super.auth,
    required super.localizations,
  });

  @override
  Future<void> onSaveDiary(void Function(Diary) onComplete) async {
    saveCalled = true;
  }
}

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

    when(mockRepo.getAllDiaryCovers()).thenAnswer((_) async => [
      DiaryCover(id: '1', url: 'https://example.com/cover1.jpg'),
      DiaryCover(id: '2', url: 'https://example.com/cover2.jpg'),
    ]);

    when(mockLoc.createDiary).thenReturn('Create Diary');
    when(mockLoc.editDiary).thenReturn('Edit Diary');
    when(mockLoc.title).thenReturn('Title');
    when(mockLoc.description).thenReturn('Description');
    when(mockLoc.save).thenReturn('Save');
    when(mockLoc.errorMessage).thenReturn('Error');


  });

  testWidgets('EditDiaryScreen renders and save button calls onSaveDiary', (tester) async {

    final fakeDiary = Diary(
      id: 'test-diary-id',
      uid: 'test-user-id',
      title: 'Titolo Test',
      description: 'Descrizione Test',
      coverId: '1',
      pageIds: ['p1', 'p2'],
      creationDate: Timestamp(1, 1),
    );

    final fakeState = AsyncValue.data(
        EditDiaryState(
          diary: fakeDiary,
          allCoversList: [
            DiaryCover(id: '1', url: 'https://example.com/cover1.jpg'),
            DiaryCover(id: '2', url: 'https://example.com/cover2.jpg'),
          ],
          titleError: '',
          descriptionError: '',
        )
    );

    final fakeNotifier = FakeEditDiaryNotifier(
      diaryId: 'test-diary-id',
      repository: mockRepo,
      auth: mockAuth,
      localizations: mockLoc,
    )..state = fakeState;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          editDiaryNotifierProvider('test-diary-id').overrideWith((ref) => fakeNotifier),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: EditDiaryScreen(
              diaryId: 'test-diary-id',
              onComplete: (_) {},
            ),
          ),
        ),
      ),
    );



    await tester.pumpAndSettle();

    expect(find.text('Create diary'), findsOneWidget);
    expect(find.byType(SingleLineFieldWithError), findsOneWidget);
    expect(find.byType(ContentTextFieldWithError), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(DiaryCoverPreview), findsNWidgets(2));

    // Tap on save button
    await tester.tap(find.text('Save'));
    await tester.pump();

    expect(fakeNotifier.saveCalled, isTrue);
  });
}
import 'package:mockito/annotations.dart';
import 'package:reverie_flutter/data/repository/diary_repository.dart';
import 'package:reverie_flutter/data/repository/time_capsule_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';

@GenerateMocks([
  FirebaseAuth,
  DiaryRepository, TimeCapsuleRepository,
  User,
  AppLocalizations]
)
void main() {}
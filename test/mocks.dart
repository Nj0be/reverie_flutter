import 'package:mockito/annotations.dart';
import 'package:reverie_flutter/data/repository/user_repository.dart';
import 'package:reverie_flutter/data/repository/diary_repository.dart';
import 'package:reverie_flutter/data/repository/time_capsule_repository.dart';
import 'package:reverie_flutter/notifier/create_time_capsule_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';

@GenerateMocks([
  FirebaseAuth,
  UserRepository, DiaryRepository, TimeCapsuleRepository,
  User,
  AppLocalizations,
  CreateTimeCapsuleNotifier]
)
void main() {}
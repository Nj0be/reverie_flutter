import 'package:mockito/annotations.dart';
import 'package:reverieflutter/data/repository/user_repository.dart';
import 'package:reverieflutter/data/repository/diary_repository.dart';
import 'package:reverieflutter/data/repository/time_capsule_repository.dart';
import 'package:reverieflutter/notifier/create_time_capsule_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';

@GenerateMocks([
  FirebaseAuth,
  UserRepository, DiaryRepository, TimeCapsuleRepository,
  User,
  AppLocalizations,
  CreateTimeCapsuleNotifier]
)
void main() {}
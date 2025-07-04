import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reverie_flutter/data/model/diary.dart';
import 'package:reverie_flutter/data/model/diary_page.dart';
import 'package:reverie_flutter/data/model/time_capsule.dart';
import 'package:reverie_flutter/data/model/user.dart';
import 'package:reverie_flutter/main.dart';
import 'package:reverie_flutter/notifier/all_time_capsules_notifier.dart';
import 'package:reverie_flutter/notifier/view_time_capsule_notifier.dart';
import 'package:reverie_flutter/ui/screens/all_time_capsules_screen.dart';
import 'package:reverie_flutter/ui/screens/create_time_capsule_screen.dart';
import 'package:reverie_flutter/ui/screens/edit_diary_page_screen.dart';
import 'package:reverie_flutter/ui/screens/edit_profile_screen.dart';
import 'package:reverie_flutter/ui/screens/login_screen.dart';
import 'package:reverie_flutter/ui/screens/profile_screen.dart';
import 'package:reverie_flutter/ui/screens/reset_password_screen.dart';
import 'package:reverie_flutter/ui/screens/signup_screen.dart';
import 'package:reverie_flutter/ui/screens/view_diary_screen.dart';
import 'package:reverie_flutter/ui/screens/view_time_capsule_screen.dart';
import 'package:reverie_flutter/ui/screens/all_diaries_screen.dart';
import 'package:reverie_flutter/ui/screens/edit_diary_screen.dart';
import 'package:reverie_flutter/utils.dart';
import 'l10n/app_localizations.dart';

final router = GoRouter(
  initialLocation: isUserAuthenticated() ? AllDiariesScreen.path : LoginScreen.path,
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        final hideBars = [
          LoginScreen.path,
          SignupScreen.path,
          ResetPasswordScreen.path,
          ProfileScreen.path,
          EditProfileScreen.fullPath
        ].contains(state.fullPath);

        return MainScaffold(
          title: AppLocalizations.of(context)!.reverie,
          currentPath: state.uri.path,
          hideBars: hideBars,
          child: child,
        );
      },
      routes: [
        // Route for viewing all diaries
        GoRoute(
          name: AllDiariesScreen.name,
          path: AllDiariesScreen.path,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: AllDiariesScreen(
              onNavigateToDiary: (diaryId) {
                context.pushNamed(
                  ViewDiaryScreen.name,
                  pathParameters: {'diaryId': diaryId},
                );
              },
              onNavigateToEditDiary: (diaryId) async {
                // return updated profile from editProfile
                return await context.pushNamed(
                  EditDiaryScreen.editName,
                  pathParameters: {'diaryId': diaryId},
                ) as Diary?;
              },
              onNavigateToCreateDiary: () async {
                // return updated profile from editProfile
                return await context.pushNamed(EditDiaryScreen.createName) as Diary?;
              },
            ),
          ),
          routes: [
            // Route for editing a diary
            GoRoute(
              name: EditDiaryScreen.editName,
              path: EditDiaryScreen.editPath,
              pageBuilder: (context, state) {
                final diaryId = state.pathParameters['diaryId']!;
                return MaterialPage(
                  key: state.pageKey,
                  child: EditDiaryScreen(
                    diaryId: diaryId,
                    onComplete: (updatedDiary) {
                      // Navigate back to the profile page after editing
                      // we send the updated profile
                      context.pop(updatedDiary);
                    },
                  ),
                );
              },
            ),

            GoRoute(
              name: EditDiaryScreen.createName,
              path: EditDiaryScreen.createPath,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: EditDiaryScreen(
                  diaryId: '',
                  onComplete: (updatedDiary) {
                    // Navigate back to the profile page after editing
                    // we send the updated profile
                    context.pop(updatedDiary);
                  },
                ),
              ),
            ),

            GoRoute(
              name: ViewDiaryScreen.name,
              path: ViewDiaryScreen.path,
              pageBuilder: (context, state) {
                final diaryId = state.pathParameters['diaryId']!;
                return MaterialPage(
                  key: state.pageKey,
                  child: ViewDiaryScreen(
                      diaryId: diaryId,
                      onNavigateToEditDiaryPage: (pageId) async {
                        // return updated profile from editProfile
                        return await context.pushNamed(
                          EditDiaryPageScreen.name,
                          pathParameters: {
                            'diaryId': diaryId,
                            'pageId': pageId
                          },
                        ) as DiaryPage?;
                      },
                      onComplete: () {
                        context.pop();
                      },
                  ),
                );
              },
              routes: [
                GoRoute(
                    name: EditDiaryPageScreen.name,
                    path: EditDiaryPageScreen.path,
                    pageBuilder: (context, state) {
                      final pageId = state.pathParameters['pageId']!;
                      return MaterialPage(
                        key: state.pageKey,
                        child: EditDiaryPageScreen(
                          pageId: pageId,
                          onComplete: (updatedPage) {
                            context.pop(updatedPage);
                          },
                        ),
                      );
                    },
                ),
              ]
            ),
          ],
        ),

        GoRoute(
          name: AllTimeCapsulesScreen.name,
          path: AllTimeCapsulesScreen.path,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: AllTimeCapsulesScreen(
              onNavigateToCreateTimeCapsule: () async {
                return await context.pushNamed(CreateTimeCapsuleScreen.name)
                as TimeCapsule?;
              },
              onNavigateToViewTimeCapsule: (timeCapsuleId, timeCapsuleType) {
                context.pushNamed(
                  ViewTimeCapsuleScreen.name,
                  pathParameters: {
                    'timeCapsuleId': timeCapsuleId,
                    'timeCapsuleType': timeCapsuleType.name,
                  },
                );
              },
            ),
          ),
          routes: [
            GoRoute(
              name: CreateTimeCapsuleScreen.name,
              path: CreateTimeCapsuleScreen.path,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: CreateTimeCapsuleScreen(
                  onComplete: (createdTimeCapsule) {
                    context.pop(createdTimeCapsule);
                  },
                ),
              ),
            ),

            GoRoute(
              name: ViewTimeCapsuleScreen.name,
              path: ViewTimeCapsuleScreen.path,
              pageBuilder: (context, state) {
                final timeCapsuleId = state.pathParameters['timeCapsuleId']!;
                final timeCapsuleTypeStr = state.pathParameters['timeCapsuleType']!;
                final timeCapsuleType = TimeCapsuleType.values.firstWhere(
                      (e) => e.name == timeCapsuleTypeStr,
                  orElse: () => TimeCapsuleType.scheduled, // fallback
                );
                return MaterialPage(
                  key: state.pageKey,
                  child: ViewTimeCapsuleScreen(
                    viewTimeCapsuleParams: ViewTimeCapsuleParams(
                      timeCapsuleId: timeCapsuleId,
                      timeCapsuleType: timeCapsuleType,
                    ),
                    onViewProfile: (profileId) {
                      context.pushNamed(
                        ProfileScreen.name,
                        pathParameters: {'profileId': profileId},
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),

        // Route for viewing a profile
        GoRoute(
          name: ProfileScreen.name,
          path: ProfileScreen.path,
          pageBuilder: (context, state) {
            final profileId = state.pathParameters['profileId']!;
            return MaterialPage(
              key: state.pageKey,
              child: ProfileScreen(
                profileId: profileId,
                onEditProfile: (id) async {
                  // return updated profile from editProfile
                  return await context.pushNamed(
                    EditProfileScreen.name,
                    pathParameters: {'profileId': id},
                  )
                  as User?;
                },
                onLogout: () {
                  logout();
                  context.goNamed(LoginScreen.name);
                },
              ),
            );
          },
          routes: [
            // Route for editing a profile
            GoRoute(
              name: EditProfileScreen.name,
              path: EditProfileScreen.path,
              pageBuilder: (context, state) {
                final profileId = state.pathParameters['profileId']!;
                return MaterialPage(
                  key: state.pageKey,
                  child: EditProfileScreen(
                    profileId: profileId,
                    onComplete: (updatedProfile) {
                      // Navigate back to the profile page after editing
                      // we send the updated profile
                      context.pop(updatedProfile);
                    },
                  ),
                );
              },
            ),
          ],
        ),

        GoRoute(
          name: LoginScreen.name,
          path: LoginScreen.path,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: LoginScreen(
              onLoginSuccess: () {
                // Navigate back to the profile page after editing
                context.goNamed(AllDiariesScreen.name);
              },
              onNavigateToSignup: () {
                context.goNamed(SignupScreen.name);
              },
              onNavigateToResetPassword: () {
                context.goNamed(ResetPasswordScreen.name);
              },
            ),
          ),
        ),

        GoRoute(
          name: SignupScreen.name,
          path: SignupScreen.path,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: SignupScreen(
              onSignupSuccess: () {
                // handle signup success
                context.goNamed(LoginScreen.name);
              },
              onNavigateToLogin: () {
                context.goNamed(LoginScreen.name);
              },
            ),
          ),
        ),

        GoRoute(
          name: ResetPasswordScreen.name,
          path: ResetPasswordScreen.path,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: ResetPasswordScreen(
              onResetPasswordSuccess: () {
                // handle signup success
                context.goNamed(LoginScreen.name);
              },
            ),
          ),
        ),
      ],
    ),
  ],
);

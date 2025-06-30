import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('it'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Reverie'**
  String get appName;

  /// No description provided for @allDiaries.
  ///
  /// In en, this message translates to:
  /// **'All Diaries'**
  String get allDiaries;

  /// No description provided for @diary.
  ///
  /// In en, this message translates to:
  /// **'Diary'**
  String get diary;

  /// No description provided for @timeCapsule.
  ///
  /// In en, this message translates to:
  /// **'Time Capsule'**
  String get timeCapsule;

  /// No description provided for @navigationDrawer.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get navigationDrawer;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get signup;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @page.
  ///
  /// In en, this message translates to:
  /// **'Page'**
  String get page;

  /// No description provided for @subPage.
  ///
  /// In en, this message translates to:
  /// **'Sub Page'**
  String get subPage;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @moveUp.
  ///
  /// In en, this message translates to:
  /// **'Move up'**
  String get moveUp;

  /// No description provided for @moveDown.
  ///
  /// In en, this message translates to:
  /// **'Move down'**
  String get moveDown;

  /// No description provided for @newDiary.
  ///
  /// In en, this message translates to:
  /// **'New Diary'**
  String get newDiary;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @createDiaryMessage.
  ///
  /// In en, this message translates to:
  /// **'You are creating your diary!'**
  String get createDiaryMessage;

  /// No description provided for @editDiaryPageMessage.
  ///
  /// In en, this message translates to:
  /// **'You are editing your diary!'**
  String get editDiaryPageMessage;

  /// No description provided for @createDiary.
  ///
  /// In en, this message translates to:
  /// **'Create diary'**
  String get createDiary;

  /// No description provided for @editDiaryMessage.
  ///
  /// In en, this message translates to:
  /// **'You are editing your diary!'**
  String get editDiaryMessage;

  /// No description provided for @createTimeCapsuleMessage.
  ///
  /// In en, this message translates to:
  /// **'You are creating your time capsule!'**
  String get createTimeCapsuleMessage;

  /// No description provided for @content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get content;

  /// No description provided for @yourProfile.
  ///
  /// In en, this message translates to:
  /// **'Your profile'**
  String get yourProfile;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surname;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get editProfile;

  /// No description provided for @emailMandatory.
  ///
  /// In en, this message translates to:
  /// **'Email is mandatory'**
  String get emailMandatory;

  /// No description provided for @usernameMandatory.
  ///
  /// In en, this message translates to:
  /// **'Username is mandatory'**
  String get usernameMandatory;

  /// No description provided for @nameMandatory.
  ///
  /// In en, this message translates to:
  /// **'Name is mandatory'**
  String get nameMandatory;

  /// No description provided for @surnameMandatory.
  ///
  /// In en, this message translates to:
  /// **'Surname is mandatory'**
  String get surnameMandatory;

  /// No description provided for @titleMandatory.
  ///
  /// In en, this message translates to:
  /// **'Title is mandatory'**
  String get titleMandatory;

  /// No description provided for @contentMandatory.
  ///
  /// In en, this message translates to:
  /// **'Content is mandatory'**
  String get contentMandatory;

  /// No description provided for @passwordMandatory.
  ///
  /// In en, this message translates to:
  /// **'Password is mandatory'**
  String get passwordMandatory;

  /// No description provided for @passwordsDontMatch.
  ///
  /// In en, this message translates to:
  /// **'The two passwords don\'t match'**
  String get passwordsDontMatch;

  /// No description provided for @passwordLength.
  ///
  /// In en, this message translates to:
  /// **'Password needs to have at least 8 characters'**
  String get passwordLength;

  /// No description provided for @usernameLength.
  ///
  /// In en, this message translates to:
  /// **'Username needs to have at least 3 characters'**
  String get usernameLength;

  /// No description provided for @sendResetPasswordEmail.
  ///
  /// In en, this message translates to:
  /// **'Send reset password email'**
  String get sendResetPasswordEmail;

  /// No description provided for @goBackToLogin.
  ///
  /// In en, this message translates to:
  /// **'Go back to login'**
  String get goBackToLogin;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @resetPasswordEmailSent.
  ///
  /// In en, this message translates to:
  /// **'Reset password email sent'**
  String get resetPasswordEmailSent;

  /// No description provided for @resetPasswordEmailError.
  ///
  /// In en, this message translates to:
  /// **'Error sending reset password email'**
  String get resetPasswordEmailError;

  /// No description provided for @goToSignup.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have an account? Signup'**
  String get goToSignup;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'You forgot your password?'**
  String get forgotPassword;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Do you already have an account? Login'**
  String get alreadyHaveAccount;

  /// No description provided for @signupSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Signup successful. Go back to login'**
  String get signupSuccessful;

  /// No description provided for @signupError.
  ///
  /// In en, this message translates to:
  /// **'Signup error'**
  String get signupError;

  /// No description provided for @loginError.
  ///
  /// In en, this message translates to:
  /// **'Login error'**
  String get loginError;

  /// No description provided for @noDateSelected.
  ///
  /// In en, this message translates to:
  /// **'No date selected'**
  String get noDateSelected;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get selectDate;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @usernameAlreadyTaken.
  ///
  /// In en, this message translates to:
  /// **'Username already taken'**
  String get usernameAlreadyTaken;

  /// No description provided for @emailAlreadyTaken.
  ///
  /// In en, this message translates to:
  /// **'Email already taken'**
  String get emailAlreadyTaken;

  /// No description provided for @selectADate.
  ///
  /// In en, this message translates to:
  /// **'Select a date'**
  String get selectADate;

  /// No description provided for @emailNotValid.
  ///
  /// In en, this message translates to:
  /// **'Email not valid'**
  String get emailNotValid;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// No description provided for @updateError.
  ///
  /// In en, this message translates to:
  /// **'Update error'**
  String get updateError;

  /// No description provided for @confirmDiaryDeletion.
  ///
  /// In en, this message translates to:
  /// **'Confirm diary deletion'**
  String get confirmDiaryDeletion;

  /// No description provided for @deleteDiary.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this diary? This action cannot be undone.'**
  String get deleteDiary;

  /// No description provided for @confirmPageDeletion.
  ///
  /// In en, this message translates to:
  /// **'Confirm page deletion'**
  String get confirmPageDeletion;

  /// No description provided for @deletePage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this page? This action cannot be undone.'**
  String get deletePage;

  /// No description provided for @movePrevSubpage.
  ///
  /// In en, this message translates to:
  /// **'Move to prev subpage'**
  String get movePrevSubpage;

  /// No description provided for @moveNextSubpage.
  ///
  /// In en, this message translates to:
  /// **'Move to next subpage'**
  String get moveNextSubpage;

  /// No description provided for @receiverMandatory.
  ///
  /// In en, this message translates to:
  /// **'At least one receiver is needed'**
  String get receiverMandatory;

  /// No description provided for @deadlineMandatory.
  ///
  /// In en, this message translates to:
  /// **'Deadline is mandatory'**
  String get deadlineMandatory;

  /// No description provided for @missingPhonePrefix.
  ///
  /// In en, this message translates to:
  /// **'Number not valid, add the prefix (e.g. +39)'**
  String get missingPhonePrefix;

  /// No description provided for @phoneNumberNotValid.
  ///
  /// In en, this message translates to:
  /// **'Number not valid'**
  String get phoneNumberNotValid;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @phoneNumberAlreadySelected.
  ///
  /// In en, this message translates to:
  /// **'Phone number already selected'**
  String get phoneNumberAlreadySelected;

  /// No description provided for @emailAlreadySelected.
  ///
  /// In en, this message translates to:
  /// **'Email already selected'**
  String get emailAlreadySelected;

  /// No description provided for @editDiary.
  ///
  /// In en, this message translates to:
  /// **'Edit diary'**
  String get editDiary;

  /// No description provided for @selectImage.
  ///
  /// In en, this message translates to:
  /// **'Select image'**
  String get selectImage;

  /// No description provided for @arrivalDate.
  ///
  /// In en, this message translates to:
  /// **'Arrival date'**
  String get arrivalDate;

  /// No description provided for @creationDate.
  ///
  /// In en, this message translates to:
  /// **'Creation date'**
  String get creationDate;

  /// No description provided for @receiver.
  ///
  /// In en, this message translates to:
  /// **'Receiver'**
  String get receiver;

  /// No description provided for @receivers.
  ///
  /// In en, this message translates to:
  /// **'Receivers'**
  String get receivers;

  /// No description provided for @sender.
  ///
  /// In en, this message translates to:
  /// **'Sender'**
  String get sender;

  /// No description provided for @contentNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Content not available'**
  String get contentNotAvailable;

  /// No description provided for @letterContent.
  ///
  /// In en, this message translates to:
  /// **'Letter content'**
  String get letterContent;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @pageNumber.
  ///
  /// In en, this message translates to:
  /// **'Page number'**
  String get pageNumber;

  /// No description provided for @createTimeCapsule.
  ///
  /// In en, this message translates to:
  /// **'Create time capsule'**
  String get createTimeCapsule;

  /// No description provided for @letterForTheFuture.
  ///
  /// In en, this message translates to:
  /// **'Letter for the future'**
  String get letterForTheFuture;

  /// No description provided for @letterForTheFutureDescription.
  ///
  /// In en, this message translates to:
  /// **'This letter is to send a message into the future'**
  String get letterForTheFutureDescription;

  /// No description provided for @createdOn.
  ///
  /// In en, this message translates to:
  /// **'Created on'**
  String get createdOn;

  /// No description provided for @arrivingOn.
  ///
  /// In en, this message translates to:
  /// **'Arriving on'**
  String get arrivingOn;

  /// No description provided for @arrivedOn.
  ///
  /// In en, this message translates to:
  /// **'Arrived on'**
  String get arrivedOn;

  /// No description provided for @editDiaryPage.
  ///
  /// In en, this message translates to:
  /// **'Edit diary page'**
  String get editDiaryPage;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a phone number'**
  String get enterPhoneNumber;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter an email'**
  String get enterEmail;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorMessage;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help and Feedbacks'**
  String get help;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

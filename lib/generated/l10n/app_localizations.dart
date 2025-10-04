import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @blogs.
  ///
  /// In en, this message translates to:
  /// **'Blogs'**
  String get blogs;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe;

  /// No description provided for @walid.
  ///
  /// In en, this message translates to:
  /// **'Walid'**
  String get walid;

  /// No description provided for @mobileAppDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Mobile App Developer'**
  String get mobileAppDeveloper;

  /// No description provided for @mobileAppDeveloperDesc.
  ///
  /// In en, this message translates to:
  /// **'I am a mobile app developer with over 5 years of experience in building high-quality applications using Flutter and Dart. I have a passion for creating innovative and user-friendly apps that meet the needs of users.'**
  String get mobileAppDeveloperDesc;

  /// No description provided for @cooperationRequest.
  ///
  /// In en, this message translates to:
  /// **'Cooperation Request'**
  String get cooperationRequest;

  /// No description provided for @hammoutiWalid.
  ///
  /// In en, this message translates to:
  /// **'Hammouti Walid'**
  String get hammoutiWalid;

  /// No description provided for @projectsdesc.
  ///
  /// In en, this message translates to:
  /// **'Here are some of the projects I\'ve worked on. If you\'re interested in learning more, feel free to contact me.'**
  String get projectsdesc;

  /// No description provided for @techStack.
  ///
  /// In en, this message translates to:
  /// **'Tech Stack'**
  String get techStack;

  /// No description provided for @techStackDesc.
  ///
  /// In en, this message translates to:
  /// **'Here are some of the technologies and tools I have experience with:'**
  String get techStackDesc;

  /// No description provided for @poweredByFlutter.
  ///
  /// In en, this message translates to:
  /// **'Powered by Flutter'**
  String get poweredByFlutter;

  /// No description provided for @aboutmeTitle.
  ///
  /// In en, this message translates to:
  /// **'Hammouti Walid, App & ML Developer'**
  String get aboutmeTitle;

  /// No description provided for @aboutmeDesc.
  ///
  /// In en, this message translates to:
  /// **'Hi, I’m Hammouti Walid, a passionate app developer and AI enthusiast from Algeria. I love building smart, user-friendly applications that combine beautiful Flutter interfaces with the power of machine learning. I’m currently exploring how AI can enhance real-world apps — from intelligent systems to automation tools. My goal is to create digital products that make life easier, smarter, and more connected.'**
  String get aboutmeDesc;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

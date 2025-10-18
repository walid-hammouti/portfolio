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
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
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

  /// No description provided for @contactme.
  ///
  /// In en, this message translates to:
  /// **'Contact Me'**
  String get contactme;

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
  /// **'I am a mobile app developer with one year of experience in developing high-quality Flutter and Dart applications. I enjoy creating innovative, user-friendly apps that solve real problems for users.'**
  String get mobileAppDeveloperDesc;

  /// No description provided for @hammoutiWalid.
  ///
  /// In en, this message translates to:
  /// **'Hammouti Walid'**
  String get hammoutiWalid;

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

  /// No description provided for @experince.
  ///
  /// In en, this message translates to:
  /// **'Experience & Skills'**
  String get experince;

  /// No description provided for @experincedesc.
  ///
  /// In en, this message translates to:
  /// **'A look at my experience across different development fields — from mobile to AI.'**
  String get experincedesc;

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

  /// No description provided for @reachMe.
  ///
  /// In en, this message translates to:
  /// **'Reach Me'**
  String get reachMe;

  /// No description provided for @welcometext.
  ///
  /// In en, this message translates to:
  /// **'Welcome to my portfolio! '**
  String get welcometext;

  /// No description provided for @herotitle.
  ///
  /// In en, this message translates to:
  /// **'Hello, I\'m  '**
  String get herotitle;

  /// No description provided for @hammouti.
  ///
  /// In en, this message translates to:
  /// **'Hammouti '**
  String get hammouti;

  /// No description provided for @mobileDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Mobile Development'**
  String get mobileDevelopment;

  /// No description provided for @mobileDevText1.
  ///
  /// In en, this message translates to:
  /// **'Built cross-platform mobile apps using Flutter and Dart'**
  String get mobileDevText1;

  /// No description provided for @mobileDevText2.
  ///
  /// In en, this message translates to:
  /// **'Integrated Supabase for authentication and real-time database'**
  String get mobileDevText2;

  /// No description provided for @mobileDevText3.
  ///
  /// In en, this message translates to:
  /// **'Designed responsive light and dark themes for better UX'**
  String get mobileDevText3;

  /// No description provided for @mobileDevText4.
  ///
  /// In en, this message translates to:
  /// **'Used Cubit, BLoC, Provider, and Riverpod for scalable state management'**
  String get mobileDevText4;

  /// No description provided for @aiMachineLearning.
  ///
  /// In en, this message translates to:
  /// **'AI & Machine Learning'**
  String get aiMachineLearning;

  /// No description provided for @aiText1.
  ///
  /// In en, this message translates to:
  /// **'Currently learning and exploring machine learning techniques'**
  String get aiText1;

  /// No description provided for @aiText2.
  ///
  /// In en, this message translates to:
  /// **'Performing data analysis and preprocessing using pandas and NumPy'**
  String get aiText2;

  /// No description provided for @aiText3.
  ///
  /// In en, this message translates to:
  /// **'Visualizing datasets and model performance with Matplotlib'**
  String get aiText3;

  /// No description provided for @desktopDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Desktop Development'**
  String get desktopDevelopment;

  /// No description provided for @desktopText1.
  ///
  /// In en, this message translates to:
  /// **'Built a Student Management System using C and GTK3'**
  String get desktopText1;

  /// No description provided for @desktopText2.
  ///
  /// In en, this message translates to:
  /// **'Developed a Linear Algebra Calculator with Python and Tkinter'**
  String get desktopText2;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'© 2025 HAMMOUTI Walid. All rights reserved.'**
  String get copyright;

  /// No description provided for @reach.
  ///
  /// In en, this message translates to:
  /// **'Reach '**
  String get reach;

  /// No description provided for @me.
  ///
  /// In en, this message translates to:
  /// **'Me'**
  String get me;

  /// No description provided for @contactDescription.
  ///
  /// In en, this message translates to:
  /// **'Feel free to reach out! You can contact me via email, phone, or through my social media channels. I\'d love to hear from you.'**
  String get contactDescription;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'w.walidcontacts@gmail.com'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'+213 5 6 26 57 67'**
  String get phone;

  /// No description provided for @contactLets.
  ///
  /// In en, this message translates to:
  /// **'Let\'s'**
  String get contactLets;

  /// No description provided for @contactTalk.
  ///
  /// In en, this message translates to:
  /// **'Talk'**
  String get contactTalk;

  /// No description provided for @contactSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Got something to say? Drop an anonymous message and let\'s keep it between us 👀'**
  String get contactSubtitle;

  /// No description provided for @contactYourName.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get contactYourName;

  /// No description provided for @contactNameValidation.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get contactNameValidation;

  /// No description provided for @contactYourMessage.
  ///
  /// In en, this message translates to:
  /// **'Your Message'**
  String get contactYourMessage;

  /// No description provided for @contactMessageValidation.
  ///
  /// In en, this message translates to:
  /// **'Please enter your message'**
  String get contactMessageValidation;

  /// No description provided for @contactMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Write your message here...'**
  String get contactMessageHint;

  /// No description provided for @contactSendButton.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get contactSendButton;

  /// No description provided for @contactSuccess.
  ///
  /// In en, this message translates to:
  /// **'Message sent successfully!'**
  String get contactSuccess;

  /// No description provided for @contactError.
  ///
  /// In en, this message translates to:
  /// **'Failed to send email. Please try again.'**
  String get contactError;
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
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

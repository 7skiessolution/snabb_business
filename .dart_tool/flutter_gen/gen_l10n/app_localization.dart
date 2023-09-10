import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localization_da.dart';
import 'app_localization_de.dart';
import 'app_localization_en.dart';
import 'app_localization_es.dart';
import 'app_localization_fi.dart';
import 'app_localization_fr.dart';
import 'app_localization_it.dart';
import 'app_localization_pl.dart';
import 'app_localization_sv.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localization.dart';
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
    Locale('da'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('it'),
    Locale('pl'),
    Locale('sv')
  ];

  /// No description provided for @accepttermsandconditions.
  ///
  /// In en, this message translates to:
  /// **'By signing up you are accepting terms and conditions and privacy policy'**
  String get accepttermsandconditions;

  /// No description provided for @accesstoallcategories.
  ///
  /// In en, this message translates to:
  /// **'Access to all categories'**
  String get accesstoallcategories;

  /// No description provided for @accountname.
  ///
  /// In en, this message translates to:
  /// **'account name'**
  String get accountname;

  /// No description provided for @accounts.
  ///
  /// In en, this message translates to:
  /// **'accounts'**
  String get accounts;

  /// No description provided for @accountsinformation.
  ///
  /// In en, this message translates to:
  /// **'account id'**
  String get accountsinformation;

  /// No description provided for @actually.
  ///
  /// In en, this message translates to:
  /// **'actually'**
  String get actually;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'add'**
  String get add;

  /// No description provided for @addcatagory.
  ///
  /// In en, this message translates to:
  /// **'add category'**
  String get addcatagory;

  /// No description provided for @addexpense.
  ///
  /// In en, this message translates to:
  /// **'add expense'**
  String get addexpense;

  /// No description provided for @addfile.
  ///
  /// In en, this message translates to:
  /// **'add file'**
  String get addfile;

  /// No description provided for @addincome.
  ///
  /// In en, this message translates to:
  /// **'add income'**
  String get addincome;

  /// No description provided for @allservicesbasic.
  ///
  /// In en, this message translates to:
  /// **'all services from basic'**
  String get allservicesbasic;

  /// No description provided for @allservicessuperior.
  ///
  /// In en, this message translates to:
  /// **'all services from superior'**
  String get allservicessuperior;

  /// No description provided for @alreadyaccount.
  ///
  /// In en, this message translates to:
  /// **'already have an account?'**
  String get alreadyaccount;

  /// No description provided for @alreadyhaveaccount.
  ///
  /// In en, this message translates to:
  /// **'already have an account?'**
  String get alreadyhaveaccount;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'amount'**
  String get amount;

  /// No description provided for @analysistools.
  ///
  /// In en, this message translates to:
  /// **'analysis tools'**
  String get analysistools;

  /// No description provided for @analyzeyour.
  ///
  /// In en, this message translates to:
  /// **'analyze your'**
  String get analyzeyour;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @andeverytounderstand.
  ///
  /// In en, this message translates to:
  /// **'and easy to understand'**
  String get andeverytounderstand;

  /// No description provided for @andpasswordforlogin.
  ///
  /// In en, this message translates to:
  /// **'and password for login'**
  String get andpasswordforlogin;

  /// No description provided for @anotherpage.
  ///
  /// In en, this message translates to:
  /// **'another page'**
  String get anotherpage;

  /// No description provided for @areyousuredeleteall.
  ///
  /// In en, this message translates to:
  /// **'are you sure you want to delete all your data? this action cannot be undone.'**
  String get areyousuredeleteall;

  /// No description provided for @areyousuredeletedata.
  ///
  /// In en, this message translates to:
  /// **'are you sure you want to delete all your data? this action'**
  String get areyousuredeletedata;

  /// No description provided for @areyousuretodeletetransaction.
  ///
  /// In en, this message translates to:
  /// **'are you sure you want to delete this transaction?'**
  String get areyousuretodeletetransaction;

  /// No description provided for @askhelp.
  ///
  /// In en, this message translates to:
  /// **'ask for help'**
  String get askhelp;

  /// No description provided for @avg.
  ///
  /// In en, this message translates to:
  /// **'avg '**
  String get avg;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'balance'**
  String get balance;

  /// No description provided for @bank.
  ///
  /// In en, this message translates to:
  /// **'bank'**
  String get bank;

  /// No description provided for @basicaccount.
  ///
  /// In en, this message translates to:
  /// **'basic account'**
  String get basicaccount;

  /// No description provided for @basicsetting.
  ///
  /// In en, this message translates to:
  /// **'basic setting'**
  String get basicsetting;

  /// No description provided for @basicsettings.
  ///
  /// In en, this message translates to:
  /// **'basic settings'**
  String get basicsettings;

  /// No description provided for @budget.
  ///
  /// In en, this message translates to:
  /// **'budget'**
  String get budget;

  /// No description provided for @budgetlimitfull.
  ///
  /// In en, this message translates to:
  /// **'budget limit full'**
  String get budgetlimitfull;

  /// No description provided for @bybank.
  ///
  /// In en, this message translates to:
  /// **'per bank'**
  String get bybank;

  /// No description provided for @bycash.
  ///
  /// In en, this message translates to:
  /// **'by cash'**
  String get bycash;

  /// No description provided for @bysigningupyouareaccepting.
  ///
  /// In en, this message translates to:
  /// **'by signing up you are accepting'**
  String get bysigningupyouareaccepting;

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'calendar'**
  String get calendar;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'camera'**
  String get camera;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel;

  /// No description provided for @categoriesexpensis.
  ///
  /// In en, this message translates to:
  /// **'categories - expenses'**
  String get categoriesexpensis;

  /// No description provided for @categoriesincome.
  ///
  /// In en, this message translates to:
  /// **'categories - income'**
  String get categoriesincome;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'category'**
  String get category;

  /// No description provided for @categorymanagement.
  ///
  /// In en, this message translates to:
  /// **'category management'**
  String get categorymanagement;

  /// No description provided for @changeemail.
  ///
  /// In en, this message translates to:
  /// **'change email'**
  String get changeemail;

  /// No description provided for @changelanguage.
  ///
  /// In en, this message translates to:
  /// **'change language'**
  String get changelanguage;

  /// No description provided for @changename.
  ///
  /// In en, this message translates to:
  /// **'change name'**
  String get changename;

  /// No description provided for @changetheme.
  ///
  /// In en, this message translates to:
  /// **'change theme'**
  String get changetheme;

  /// No description provided for @checked.
  ///
  /// In en, this message translates to:
  /// **'checked'**
  String get checked;

  /// No description provided for @checkyour.
  ///
  /// In en, this message translates to:
  /// **'check your'**
  String get checkyour;

  /// No description provided for @chooseyourcurrency.
  ///
  /// In en, this message translates to:
  /// **'choose your currency'**
  String get chooseyourcurrency;

  /// No description provided for @chosetheme.
  ///
  /// In en, this message translates to:
  /// **'choose a theme'**
  String get chosetheme;

  /// No description provided for @choseyourlanguage.
  ///
  /// In en, this message translates to:
  /// **'choose your language'**
  String get choseyourlanguage;

  /// No description provided for @client.
  ///
  /// In en, this message translates to:
  /// **'client'**
  String get client;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'close'**
  String get close;

  /// No description provided for @clouddatafromstorage.
  ///
  /// In en, this message translates to:
  /// **'cloud data from storage'**
  String get clouddatafromstorage;

  /// No description provided for @clouddatastorage.
  ///
  /// In en, this message translates to:
  /// **'cloud data storage'**
  String get clouddatastorage;

  /// No description provided for @cname.
  ///
  /// In en, this message translates to:
  /// **'c-name'**
  String get cname;

  /// No description provided for @condition.
  ///
  /// In en, this message translates to:
  /// **'condition'**
  String get condition;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'confirm'**
  String get confirm;

  /// No description provided for @confirmdeletion.
  ///
  /// In en, this message translates to:
  /// **'confirm deletion'**
  String get confirmdeletion;

  /// No description provided for @continuewithoutaccount.
  ///
  /// In en, this message translates to:
  /// **'continue without creating an account'**
  String get continuewithoutaccount;

  /// No description provided for @cr.
  ///
  /// In en, this message translates to:
  /// **'cr'**
  String get cr;

  /// No description provided for @createnewaccount.
  ///
  /// In en, this message translates to:
  /// **'create new account'**
  String get createnewaccount;

  /// No description provided for @createnewbudget.
  ///
  /// In en, this message translates to:
  /// **'create a new budget'**
  String get createnewbudget;

  /// No description provided for @createpdf.
  ///
  /// In en, this message translates to:
  /// **'create pdf report'**
  String get createpdf;

  /// No description provided for @createprintablepdf.
  ///
  /// In en, this message translates to:
  /// **'create a printable pdf file of your finance.'**
  String get createprintablepdf;

  /// No description provided for @createtheassociatedntransaction.
  ///
  /// In en, this message translates to:
  /// **'create the associated \ntransaction (expense)'**
  String get createtheassociatedntransaction;

  /// No description provided for @createtheassociatedtransaction.
  ///
  /// In en, this message translates to:
  /// **'create the associated transaction'**
  String get createtheassociatedtransaction;

  /// No description provided for @creationdate.
  ///
  /// In en, this message translates to:
  /// **'creation date'**
  String get creationdate;

  /// No description provided for @credit.
  ///
  /// In en, this message translates to:
  /// **'credit'**
  String get credit;

  /// No description provided for @creditdebittransactions.
  ///
  /// In en, this message translates to:
  /// **'credit/debit transactions'**
  String get creditdebittransactions;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'currency'**
  String get currency;

  /// No description provided for @current.
  ///
  /// In en, this message translates to:
  /// **'current'**
  String get current;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'daily'**
  String get daily;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'dark'**
  String get dark;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'dashboard'**
  String get dashboard;

  /// No description provided for @datasavedondevice.
  ///
  /// In en, this message translates to:
  /// **'data saved (on device)'**
  String get datasavedondevice;

  /// No description provided for @databasesetting.
  ///
  /// In en, this message translates to:
  /// **'database setting'**
  String get databasesetting;

  /// No description provided for @databasesettings.
  ///
  /// In en, this message translates to:
  /// **'database settings'**
  String get databasesettings;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'date'**
  String get date;

  /// No description provided for @debit.
  ///
  /// In en, this message translates to:
  /// **'debit '**
  String get debit;

  /// No description provided for @debitcredit.
  ///
  /// In en, this message translates to:
  /// **'debit/credit'**
  String get debitcredit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'delete'**
  String get delete;

  /// No description provided for @deleteall.
  ///
  /// In en, this message translates to:
  /// **'delete all data'**
  String get deleteall;

  /// No description provided for @deletetransaction.
  ///
  /// In en, this message translates to:
  /// **'delete transaction'**
  String get deletetransaction;

  /// No description provided for @dept.
  ///
  /// In en, this message translates to:
  /// **'dept'**
  String get dept;

  /// No description provided for @detailsendemail.
  ///
  /// In en, this message translates to:
  /// **'detail send to your email'**
  String get detailsendemail;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'done'**
  String get done;

  /// No description provided for @doyouwanttoselectanimagefromgallery.
  ///
  /// In en, this message translates to:
  /// **'do you want to select an image from the gallery or take a picture?'**
  String get doyouwanttoselectanimagefromgallery;

  /// No description provided for @dr.
  ///
  /// In en, this message translates to:
  /// **'dr'**
  String get dr;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'duration'**
  String get duration;

  /// No description provided for @dynamicmobileapp.
  ///
  /// In en, this message translates to:
  /// **'dynamic mobile app'**
  String get dynamicmobileapp;

  /// No description provided for @editdebitcredit.
  ///
  /// In en, this message translates to:
  /// **'edit debit credit'**
  String get editdebitcredit;

  /// No description provided for @editprofile.
  ///
  /// In en, this message translates to:
  /// **'edit profile'**
  String get editprofile;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'education'**
  String get education;

  /// No description provided for @elegantaccount.
  ///
  /// In en, this message translates to:
  /// **'elegant account'**
  String get elegantaccount;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get email;

  /// No description provided for @emailaddress.
  ///
  /// In en, this message translates to:
  /// **'email address'**
  String get emailaddress;

  /// No description provided for @emailsuccessverify.
  ///
  /// In en, this message translates to:
  /// **'email successfully verified'**
  String get emailsuccessverify;

  /// No description provided for @emergencyfunds.
  ///
  /// In en, this message translates to:
  /// **'emergency funds'**
  String get emergencyfunds;

  /// No description provided for @enteramount.
  ///
  /// In en, this message translates to:
  /// **'enter amount'**
  String get enteramount;

  /// No description provided for @enteravalidname.
  ///
  /// In en, this message translates to:
  /// **'enter a valid name'**
  String get enteravalidname;

  /// No description provided for @enteravalidphonenum.
  ///
  /// In en, this message translates to:
  /// **'enter a valid phone num'**
  String get enteravalidphonenum;

  /// No description provided for @entertainment.
  ///
  /// In en, this message translates to:
  /// **'entertainment'**
  String get entertainment;

  /// No description provided for @enteryouremail.
  ///
  /// In en, this message translates to:
  /// **'enter your email'**
  String get enteryouremail;

  /// No description provided for @enteryouremailaddress.
  ///
  /// In en, this message translates to:
  /// **'enter your email address'**
  String get enteryouremailaddress;

  /// No description provided for @enteryourinformmationbelow.
  ///
  /// In en, this message translates to:
  /// **'enter your information below'**
  String get enteryourinformmationbelow;

  /// No description provided for @enteryourpassword.
  ///
  /// In en, this message translates to:
  /// **'enter your password'**
  String get enteryourpassword;

  /// No description provided for @eraseall.
  ///
  /// In en, this message translates to:
  /// **'erase all'**
  String get eraseall;

  /// No description provided for @erasealldata.
  ///
  /// In en, this message translates to:
  /// **'erase all data and progress'**
  String get erasealldata;

  /// No description provided for @exchangerate.
  ///
  /// In en, this message translates to:
  /// **'exchange rate'**
  String get exchangerate;

  /// No description provided for @expense.
  ///
  /// In en, this message translates to:
  /// **'expense'**
  String get expense;

  /// No description provided for @expensename.
  ///
  /// In en, this message translates to:
  /// **'expense'**
  String get expensename;

  /// No description provided for @expensetransactions.
  ///
  /// In en, this message translates to:
  /// **'expense transactions'**
  String get expensetransactions;

  /// No description provided for @export.
  ///
  /// In en, this message translates to:
  /// **'export'**
  String get export;

  /// No description provided for @exportaspdf.
  ///
  /// In en, this message translates to:
  /// **'export as pdf'**
  String get exportaspdf;

  /// No description provided for @family.
  ///
  /// In en, this message translates to:
  /// **'family'**
  String get family;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'feedback'**
  String get feedback;

  /// No description provided for @fifteeneuro.
  ///
  /// In en, this message translates to:
  /// **'15 euro'**
  String get fifteeneuro;

  /// No description provided for @files.
  ///
  /// In en, this message translates to:
  /// **'files'**
  String get files;

  /// No description provided for @finance.
  ///
  /// In en, this message translates to:
  /// **'finance'**
  String get finance;

  /// No description provided for @financialincome.
  ///
  /// In en, this message translates to:
  /// **'financial income'**
  String get financialincome;

  /// No description provided for @fiveeuro.
  ///
  /// In en, this message translates to:
  /// **'5 euro'**
  String get fiveeuro;

  /// No description provided for @fooddrink.
  ///
  /// In en, this message translates to:
  /// **'food/drink'**
  String get fooddrink;

  /// No description provided for @forget.
  ///
  /// In en, this message translates to:
  /// **'forget'**
  String get forget;

  /// No description provided for @forgetpassword.
  ///
  /// In en, this message translates to:
  /// **'forget password'**
  String get forgetpassword;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'free'**
  String get free;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'from'**
  String get from;

  /// No description provided for @fromoptional.
  ///
  /// In en, this message translates to:
  /// **'from optional'**
  String get fromoptional;

  /// No description provided for @fullname.
  ///
  /// In en, this message translates to:
  /// **'full name'**
  String get fullname;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'gallery'**
  String get gallery;

  /// No description provided for @generatereport.
  ///
  /// In en, this message translates to:
  /// **'generate report'**
  String get generatereport;

  /// No description provided for @givefeedbackandsupport.
  ///
  /// In en, this message translates to:
  /// **'give feedback and support'**
  String get givefeedbackandsupport;

  /// No description provided for @givefeedbacksupport.
  ///
  /// In en, this message translates to:
  /// **'give feedback and support'**
  String get givefeedbacksupport;

  /// No description provided for @healthsport.
  ///
  /// In en, this message translates to:
  /// **'health/sport'**
  String get healthsport;

  /// No description provided for @hellodear.
  ///
  /// In en, this message translates to:
  /// **'hello dear'**
  String get hellodear;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'help'**
  String get help;

  /// No description provided for @helps.
  ///
  /// In en, this message translates to:
  /// **'helps'**
  String get helps;

  /// No description provided for @helptext.
  ///
  /// In en, this message translates to:
  /// **'help'**
  String get helptext;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'home'**
  String get home;

  /// No description provided for @homeoffice.
  ///
  /// In en, this message translates to:
  /// **'home office'**
  String get homeoffice;

  /// No description provided for @image.
  ///
  /// In en, this message translates to:
  /// **'image'**
  String get image;

  /// No description provided for @includereport.
  ///
  /// In en, this message translates to:
  /// **'include report'**
  String get includereport;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'income'**
  String get income;

  /// No description provided for @incomedetails.
  ///
  /// In en, this message translates to:
  /// **'income details'**
  String get incomedetails;

  /// No description provided for @incomename.
  ///
  /// In en, this message translates to:
  /// **'income'**
  String get incomename;

  /// No description provided for @incometransactions.
  ///
  /// In en, this message translates to:
  /// **'income transactions'**
  String get incometransactions;

  /// No description provided for @insurance.
  ///
  /// In en, this message translates to:
  /// **'insurance'**
  String get insurance;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'language'**
  String get language;

  /// No description provided for @languagename.
  ///
  /// In en, this message translates to:
  /// **'english'**
  String get languagename;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'light'**
  String get light;

  /// No description provided for @loadingfile.
  ///
  /// In en, this message translates to:
  /// **'loading file'**
  String get loadingfile;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'logout'**
  String get logout;

  /// No description provided for @maincategory.
  ///
  /// In en, this message translates to:
  /// **'main category'**
  String get maincategory;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'message'**
  String get message;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'monthly'**
  String get monthly;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'name'**
  String get name;

  /// No description provided for @newcreditor.
  ///
  /// In en, this message translates to:
  /// **'new creditor'**
  String get newcreditor;

  /// No description provided for @newdeptor.
  ///
  /// In en, this message translates to:
  /// **'new deptor'**
  String get newdeptor;

  /// No description provided for @newsubcategory.
  ///
  /// In en, this message translates to:
  /// **'new sub category '**
  String get newsubcategory;

  /// No description provided for @nextmonth.
  ///
  /// In en, this message translates to:
  /// **'next month'**
  String get nextmonth;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'no'**
  String get no;

  /// No description provided for @notransactionsforthegivenfilter.
  ///
  /// In en, this message translates to:
  /// **'no transactions for the given filter'**
  String get notransactionsforthegivenfilter;

  /// No description provided for @noconnection.
  ///
  /// In en, this message translates to:
  /// **'no connection'**
  String get noconnection;

  /// No description provided for @nodatafound.
  ///
  /// In en, this message translates to:
  /// **'no data found'**
  String get nodatafound;

  /// No description provided for @nofileforthistransaction.
  ///
  /// In en, this message translates to:
  /// **'no file for this transaction'**
  String get nofileforthistransaction;

  /// No description provided for @nonotificationyet.
  ///
  /// In en, this message translates to:
  /// **'no notification yet!'**
  String get nonotificationyet;

  /// No description provided for @noschedualedtransaction.
  ///
  /// In en, this message translates to:
  /// **'not scheduled transaction'**
  String get noschedualedtransaction;

  /// No description provided for @nosubcategory.
  ///
  /// In en, this message translates to:
  /// **'no sub category '**
  String get nosubcategory;

  /// No description provided for @noteoptional.
  ///
  /// In en, this message translates to:
  /// **'note optional'**
  String get noteoptional;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'notes'**
  String get notes;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'notification'**
  String get notification;

  /// No description provided for @notransaction.
  ///
  /// In en, this message translates to:
  /// **'no transaction'**
  String get notransaction;

  /// No description provided for @notransactions.
  ///
  /// In en, this message translates to:
  /// **'no transactions'**
  String get notransactions;

  /// No description provided for @numberoftimes.
  ///
  /// In en, this message translates to:
  /// **'number of times'**
  String get numberoftimes;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'ok'**
  String get ok;

  /// No description provided for @onboardingassistance.
  ///
  /// In en, this message translates to:
  /// **'one on one onboarding assistance'**
  String get onboardingassistance;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'other'**
  String get other;

  /// No description provided for @otherincome.
  ///
  /// In en, this message translates to:
  /// **'other'**
  String get otherincome;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'paid'**
  String get paid;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get password;

  /// No description provided for @passwordmustbeatleast1digitlong.
  ///
  /// In en, this message translates to:
  /// **'password must be at least 1 digit long'**
  String get passwordmustbeatleast1digitlong;

  /// No description provided for @payable.
  ///
  /// In en, this message translates to:
  /// **'payable'**
  String get payable;

  /// No description provided for @paybackcredit.
  ///
  /// In en, this message translates to:
  /// **'payback (credit)'**
  String get paybackcredit;

  /// No description provided for @paybackdate.
  ///
  /// In en, this message translates to:
  /// **'payback date'**
  String get paybackdate;

  /// No description provided for @paybackdebit.
  ///
  /// In en, this message translates to:
  /// **'payback (debit)'**
  String get paybackdebit;

  /// No description provided for @permissiondenied.
  ///
  /// In en, this message translates to:
  /// **'permission denied'**
  String get permissiondenied;

  /// No description provided for @pets.
  ///
  /// In en, this message translates to:
  /// **'pets'**
  String get pets;

  /// No description provided for @picture.
  ///
  /// In en, this message translates to:
  /// **'picture'**
  String get picture;

  /// No description provided for @pleasecheckconnection.
  ///
  /// In en, this message translates to:
  /// **'please check your internet connection'**
  String get pleasecheckconnection;

  /// No description provided for @pleaseenteraccountname.
  ///
  /// In en, this message translates to:
  /// **'please enter account name'**
  String get pleaseenteraccountname;

  /// No description provided for @pleaseenteracurrency.
  ///
  /// In en, this message translates to:
  /// **'please enter a currency'**
  String get pleaseenteracurrency;

  /// No description provided for @pleaseenteraname.
  ///
  /// In en, this message translates to:
  /// **'please enter a name'**
  String get pleaseenteraname;

  /// No description provided for @pleaseenteranamount.
  ///
  /// In en, this message translates to:
  /// **'please enter an amount'**
  String get pleaseenteranamount;

  /// No description provided for @pleaseenteranemail.
  ///
  /// In en, this message translates to:
  /// **'please enter an email'**
  String get pleaseenteranemail;

  /// No description provided for @pleaseenteravalidemailaddress.
  ///
  /// In en, this message translates to:
  /// **'please enter a valid email address'**
  String get pleaseenteravalidemailaddress;

  /// No description provided for @pleaseenteravalidnumber.
  ///
  /// In en, this message translates to:
  /// **'please enter a valid number'**
  String get pleaseenteravalidnumber;

  /// No description provided for @pleaseenterthebalanceamount.
  ///
  /// In en, this message translates to:
  /// **'please enter the balance amount'**
  String get pleaseenterthebalanceamount;

  /// No description provided for @pleaseenterthecurrentdate.
  ///
  /// In en, this message translates to:
  /// **'please enter the current date'**
  String get pleaseenterthecurrentdate;

  /// No description provided for @pleaseentertheduedate.
  ///
  /// In en, this message translates to:
  /// **'please enter the due date'**
  String get pleaseentertheduedate;

  /// No description provided for @pleasefullfillallfields.
  ///
  /// In en, this message translates to:
  /// **'please fill out all fields'**
  String get pleasefullfillallfields;

  /// No description provided for @pleasegrantpermissionphoto.
  ///
  /// In en, this message translates to:
  /// **'please grant permission to access photo'**
  String get pleasegrantpermissionphoto;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'preferences'**
  String get preferences;

  /// No description provided for @privatepolicy.
  ///
  /// In en, this message translates to:
  /// **'privacy policy'**
  String get privatepolicy;

  /// No description provided for @profileview.
  ///
  /// In en, this message translates to:
  /// **'change password'**
  String get profileview;

  /// No description provided for @repeat.
  ///
  /// In en, this message translates to:
  /// **'rapeat'**
  String get repeat;

  /// No description provided for @repeatesevery.
  ///
  /// In en, this message translates to:
  /// **'repeats every'**
  String get repeatesevery;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'report'**
  String get report;

  /// No description provided for @resetyourpassword.
  ///
  /// In en, this message translates to:
  /// **'reset your password'**
  String get resetyourpassword;

  /// No description provided for @residualamount.
  ///
  /// In en, this message translates to:
  /// **'residual amount'**
  String get residualamount;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'results'**
  String get results;

  /// No description provided for @rs.
  ///
  /// In en, this message translates to:
  /// **'rs'**
  String get rs;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'save'**
  String get save;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'schedule?'**
  String get schedule;

  /// No description provided for @scheduledtransaction.
  ///
  /// In en, this message translates to:
  /// **'scheduled transaction'**
  String get scheduledtransaction;

  /// No description provided for @scheduledtransfer.
  ///
  /// In en, this message translates to:
  /// **'scheduled transfer'**
  String get scheduledtransfer;

  /// No description provided for @seeall.
  ///
  /// In en, this message translates to:
  /// **'see all'**
  String get seeall;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'select'**
  String get select;

  /// No description provided for @selectacountfrom.
  ///
  /// In en, this message translates to:
  /// **'select account to transfer from'**
  String get selectacountfrom;

  /// No description provided for @selectacountto.
  ///
  /// In en, this message translates to:
  /// **'select account to transfer to'**
  String get selectacountto;

  /// No description provided for @selectcategory.
  ///
  /// In en, this message translates to:
  /// **'select category'**
  String get selectcategory;

  /// No description provided for @selectimage.
  ///
  /// In en, this message translates to:
  /// **'select image'**
  String get selectimage;

  /// No description provided for @selectimagecontent.
  ///
  /// In en, this message translates to:
  /// **'do you want to select an image from the gallery or take a picture?'**
  String get selectimagecontent;

  /// No description provided for @selecttype.
  ///
  /// In en, this message translates to:
  /// **'select image'**
  String get selecttype;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'settings'**
  String get settings;

  /// No description provided for @shopping.
  ///
  /// In en, this message translates to:
  /// **'shopping'**
  String get shopping;

  /// No description provided for @signin.
  ///
  /// In en, this message translates to:
  /// **'sign in'**
  String get signin;

  /// No description provided for @signinnow.
  ///
  /// In en, this message translates to:
  /// **'sign in'**
  String get signinnow;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'sign up'**
  String get signup;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'skip'**
  String get skip;

  /// No description provided for @snabbbudgetcalculator.
  ///
  /// In en, this message translates to:
  /// **'snabb budget calculator'**
  String get snabbbudgetcalculator;

  /// No description provided for @snabbudget.
  ///
  /// In en, this message translates to:
  /// **'snabb budget'**
  String get snabbudget;

  /// No description provided for @snabbwallet.
  ///
  /// In en, this message translates to:
  /// **'snabb wallet'**
  String get snabbwallet;

  /// No description provided for @startaddingtransactions.
  ///
  /// In en, this message translates to:
  /// **'start adding your transactions'**
  String get startaddingtransactions;

  /// No description provided for @stayontopofyourexpenese.
  ///
  /// In en, this message translates to:
  /// **'stay on top of your expenses and income'**
  String get stayontopofyourexpenese;

  /// No description provided for @subcatagoriesof.
  ///
  /// In en, this message translates to:
  /// **'subcategories of'**
  String get subcatagoriesof;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'success'**
  String get success;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'summary'**
  String get summary;

  /// No description provided for @superioraccount.
  ///
  /// In en, this message translates to:
  /// **'superior account'**
  String get superioraccount;

  /// No description provided for @superiorintegrations.
  ///
  /// In en, this message translates to:
  /// **'superior integrations'**
  String get superiorintegrations;

  /// No description provided for @superiorsupport.
  ///
  /// In en, this message translates to:
  /// **'superior support'**
  String get superiorsupport;

  /// No description provided for @supplier.
  ///
  /// In en, this message translates to:
  /// **'supplier'**
  String get supplier;

  /// No description provided for @taxes.
  ///
  /// In en, this message translates to:
  /// **'taxes'**
  String get taxes;

  /// No description provided for @termand.
  ///
  /// In en, this message translates to:
  /// **'terms and'**
  String get termand;

  /// No description provided for @theappthat.
  ///
  /// In en, this message translates to:
  /// **'the app that'**
  String get theappthat;

  /// No description provided for @thismonth.
  ///
  /// In en, this message translates to:
  /// **'this month'**
  String get thismonth;

  /// No description provided for @thismount.
  ///
  /// In en, this message translates to:
  /// **'this amount'**
  String get thismount;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get to;

  /// No description provided for @tocreateanaccount.
  ///
  /// In en, this message translates to:
  /// **'to create an account'**
  String get tocreateanaccount;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'today'**
  String get today;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'total'**
  String get total;

  /// No description provided for @totalamount.
  ///
  /// In en, this message translates to:
  /// **'total amount'**
  String get totalamount;

  /// No description provided for @totalbalance.
  ///
  /// In en, this message translates to:
  /// **'total balance'**
  String get totalbalance;

  /// No description provided for @totalcrdr.
  ///
  /// In en, this message translates to:
  /// **'total cr/dr'**
  String get totalcrdr;

  /// No description provided for @totalexpence.
  ///
  /// In en, this message translates to:
  /// **'total expense'**
  String get totalexpence;

  /// No description provided for @totalincome.
  ///
  /// In en, this message translates to:
  /// **'total income'**
  String get totalincome;

  /// No description provided for @trancactions.
  ///
  /// In en, this message translates to:
  /// **'transactions'**
  String get trancactions;

  /// No description provided for @transactiondetails.
  ///
  /// In en, this message translates to:
  /// **'transaction details'**
  String get transactiondetails;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'transactions'**
  String get transactions;

  /// No description provided for @transationdetails.
  ///
  /// In en, this message translates to:
  /// **'transaction details'**
  String get transationdetails;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'transfer'**
  String get transfer;

  /// No description provided for @transferamount.
  ///
  /// In en, this message translates to:
  /// **'transfer amount'**
  String get transferamount;

  /// No description provided for @transferamountexceedsavailableamount.
  ///
  /// In en, this message translates to:
  /// **'transfer amount exceeds available amount'**
  String get transferamountexceedsavailableamount;

  /// No description provided for @transferdetails.
  ///
  /// In en, this message translates to:
  /// **'transfer details'**
  String get transferdetails;

  /// No description provided for @transfermoney.
  ///
  /// In en, this message translates to:
  /// **'transfer money'**
  String get transfermoney;

  /// No description provided for @transferred.
  ///
  /// In en, this message translates to:
  /// **'transferred'**
  String get transferred;

  /// No description provided for @transfervalue.
  ///
  /// In en, this message translates to:
  /// **'transfer value'**
  String get transfervalue;

  /// No description provided for @transportation.
  ///
  /// In en, this message translates to:
  /// **'transportation'**
  String get transportation;

  /// No description provided for @travel.
  ///
  /// In en, this message translates to:
  /// **'travel'**
  String get travel;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'type'**
  String get type;

  /// No description provided for @understandyourfinancialhabits.
  ///
  /// In en, this message translates to:
  /// **'understand your financial habits'**
  String get understandyourfinancialhabits;

  /// No description provided for @uniqueintegrations.
  ///
  /// In en, this message translates to:
  /// **'unique integrations'**
  String get uniqueintegrations;

  /// No description provided for @unlimitedfilerestore.
  ///
  /// In en, this message translates to:
  /// **'unlimited file restore'**
  String get unlimitedfilerestore;

  /// No description provided for @unlimitedinvoicesave.
  ///
  /// In en, this message translates to:
  /// **'unlimited invoice save'**
  String get unlimitedinvoicesave;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'update'**
  String get update;

  /// No description provided for @usurechangecurrency.
  ///
  /// In en, this message translates to:
  /// **'are you sure you want to change currency?'**
  String get usurechangecurrency;

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'value'**
  String get value;

  /// No description provided for @verifyingemail.
  ///
  /// In en, this message translates to:
  /// **'verifying email...'**
  String get verifyingemail;

  /// No description provided for @viewallyour.
  ///
  /// In en, this message translates to:
  /// **'view all your'**
  String get viewallyour;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'wallet'**
  String get wallet;

  /// No description provided for @walletname.
  ///
  /// In en, this message translates to:
  /// **'wallet-name'**
  String get walletname;

  /// No description provided for @weeklyudgetindex.
  ///
  /// In en, this message translates to:
  /// **'weeklyudget index'**
  String get weeklyudgetindex;

  /// No description provided for @wehavesentyouaemailon.
  ///
  /// In en, this message translates to:
  /// **'we have sent you an email on'**
  String get wehavesentyouaemailon;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'welcome!'**
  String get welcome;

  /// No description provided for @welltosnabbbbudget.
  ///
  /// In en, this message translates to:
  /// **'welcome to snabb budget'**
  String get welltosnabbbbudget;

  /// No description provided for @withsimple.
  ///
  /// In en, this message translates to:
  /// **'with simple'**
  String get withsimple;

  /// No description provided for @xlsdownload.
  ///
  /// In en, this message translates to:
  /// **'.xls download'**
  String get xlsdownload;

  /// No description provided for @yearly.
  ///
  /// In en, this message translates to:
  /// **'yearly'**
  String get yearly;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'you'**
  String get you;

  /// No description provided for @yourdebtsareempty.
  ///
  /// In en, this message translates to:
  /// **'your debts are empty.\nwanna create an account?'**
  String get yourdebtsareempty;

  /// No description provided for @yourhasbeenupdate.
  ///
  /// In en, this message translates to:
  /// **'your has been updated'**
  String get yourhasbeenupdate;

  /// No description provided for @yourselectedlanis.
  ///
  /// In en, this message translates to:
  /// **'your selected language is'**
  String get yourselectedlanis;

  /// No description provided for @youtosave.
  ///
  /// In en, this message translates to:
  /// **'you to save'**
  String get youtosave;

  /// No description provided for @zeroimesmeanslimitless.
  ///
  /// In en, this message translates to:
  /// **'zero times means limitless'**
  String get zeroimesmeanslimitless;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['da', 'de', 'en', 'es', 'fi', 'fr', 'it', 'pl', 'sv'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'da': return AppLocalizationsDa();
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fi': return AppLocalizationsFi();
    case 'fr': return AppLocalizationsFr();
    case 'it': return AppLocalizationsIt();
    case 'pl': return AppLocalizationsPl();
    case 'sv': return AppLocalizationsSv();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

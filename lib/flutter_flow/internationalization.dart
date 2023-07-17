import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ta'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? taText = '',
  }) =>
      [enText, taText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    '4gpuizxx': {
      'en': 'Welcome!',
      'ta': '',
    },
    '0ikjoxfe': {
      'en': 'To the future of transportation',
      'ta': '',
    },
    'ct3be76v': {
      'en': '',
      'ta': '',
    },
    'qn1g32bv': {
      'en': 'Email',
      'ta': '',
    },
    '8408x3co': {
      'en': '',
      'ta': '',
    },
    'eq3fq77k': {
      'en': 'Password',
      'ta': '',
    },
    'kpn5zyy2': {
      'en': 'Login',
      'ta': '',
    },
    '20ij07lg': {
      'en': 'Forgot Password?',
      'ta': '',
    },
    'law5yqeq': {
      'en': 'Use a Social Platform to Login',
      'ta': '',
    },
    '1v9l6tk4': {
      'en': 'Home',
      'ta': '',
    },
  },
  // forgotPassword
  {
    'uyn6sn1o': {
      'en': 'Forgot Password',
      'ta': '',
    },
    't9ud4695': {
      'en': 'Your Email Address...',
      'ta': '',
    },
    'msmgefe0': {
      'en': 'Enter your email here...',
      'ta': '',
    },
    '9i7h1um0': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
      'ta': '',
    },
    'q572vgou': {
      'en': 'Send Reset Link',
      'ta': '',
    },
    'zpp15hai': {
      'en': 'Home',
      'ta': '',
    },
  },
  // Login1
  {
    'bbygqf7c': {
      'en': 'Sign In',
      'ta': '',
    },
    '3n70fv6c': {
      'en': 'Email Address',
      'ta': '',
    },
    '64qhj53x': {
      'en': 'Password',
      'ta': '',
    },
    'c8oj97nd': {
      'en': 'Login',
      'ta': '',
    },
    'zfmr23sd': {
      'en': 'Forgot Password?',
      'ta': '',
    },
    'fsr0ovi3': {
      'en': 'Or use a social account to login',
      'ta': '',
    },
    '0ozeaufe': {
      'en': 'Sign Up',
      'ta': '',
    },
    '88bw8do0': {
      'en': 'Email Address',
      'ta': '',
    },
    '9tjk4uep': {
      'en': 'Password',
      'ta': '',
    },
    'bj47hece': {
      'en': 'Confirm Password',
      'ta': '',
    },
    '9oc3vuya': {
      'en': 'Create Account',
      'ta': '',
    },
    'tanqrn1h': {
      'en': 'Or use a social account to create account',
      'ta': '',
    },
  },
  // onboarding
  {
    '64ov9cj7': {
      'en': 'Sairam Bus ',
      'ta': '',
    },
    '71pyjiby': {
      'en': 'Keep track of all your bus routes in one application.',
      'ta': '',
    },
    'ge4g0u6g': {
      'en': 'Mark Attendance',
      'ta': '',
    },
    'gtsgvmmv': {
      'en': 'Mark attendance justby boarding the bus and scanning the tag.',
      'ta': '',
    },
    'dpkqvhyi': {
      'en': 'Never Miss Your Bus',
      'ta': '',
    },
    '39za7l3d': {
      'en':
          'Always track your bus with integrated GPS and know the current bus stop of your bus.',
      'ta': '',
    },
    'hafgdspg': {
      'en': 'Continue',
      'ta': '',
    },
    'x3w4t2c2': {
      'en': 'Home',
      'ta': '',
    },
  },
  // HomePage
  {
    'y4f6dubk': {
      'en': 'Your Bus',
      'ta': '',
    },
    'by3gtx88': {
      'en': 'Status',
      'ta': '',
    },
    'kz9518ls': {
      'en': 'Started',
      'ta': '',
    },
    'jgoelnp1': {
      'en': 'Track Bus',
      'ta': '',
    },
    '45jmgiet': {
      'en': '•',
      'ta': '',
    },
  },
  // profilePage
  {
    'h4pa40re': {
      'en': 'Switch to Dark Mode',
      'ta': '',
    },
    'z5q1a9wr': {
      'en': 'Switch to Light Mode',
      'ta': '',
    },
    'a1fuohcd': {
      'en': 'Change Password',
      'ta': '',
    },
    'a0j5me30': {
      'en': 'Log Out',
      'ta': '',
    },
    '67jv87h3': {
      'en': '•',
      'ta': '',
    },
  },
  // changePassword
  {
    'kakiqb86': {
      'en': 'Change Password',
      'ta': '',
    },
    '0yizvx1r': {
      'en': 'Your email address',
      'ta': '',
    },
    'h3eaudk3': {
      'en': 'Enter your email here...',
      'ta': '',
    },
    'ca57813q': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
      'ta': '',
    },
    '5se5qkiz': {
      'en': 'Update Password',
      'ta': '',
    },
    'adp27foc': {
      'en': 'Home',
      'ta': '',
    },
  },
  // trackCar
  {
    'echyj6og': {
      'en': 'Running Status',
      'ta': '',
    },
    '6airqb5j': {
      'en': 'Status',
      'ta': '',
    },
    'hyr4nhqs': {
      'en': 'On Time',
      'ta': '',
    },
    '2wwqawgl': {
      'en': 'Bus Start Time',
      'ta': '',
    },
    'yv88mop5': {
      'en': 'Map',
      'ta': '',
    },
  },
  // paymentModal
  {
    'gfh7k4uu': {
      'en': 'Pay Early',
      'ta': '',
    },
    'ls0w5ph0': {
      'en': 'Fill out your information in order to pay early.',
      'ta': '',
    },
    'dxsqew3k': {
      'en': 'Your Payment',
      'ta': '',
    },
    'mvaq5k5i': {
      'en': 'Due Sep 1, 2021',
      'ta': '',
    },
    'j6dmmc3d': {
      'en': 'Pay Now',
      'ta': '',
    },
  },
  // emptyPayments
  {
    'x342sn1x': {
      'en': 'No Payment History',
      'ta': '',
    },
    'h19kf3c5': {
      'en':
          'It seems you don\'t have any payment history, once you have created a payment it will show up here.',
      'ta': '',
    },
  },
  // appointmentEmpty
  {
    'zi11v28a': {
      'en': 'No Appointment History',
      'ta': '',
    },
    '9lruj5jn': {
      'en': 'You are good to go! No past appointments.',
      'ta': '',
    },
  },
  // appointmentEmptyCopy
  {
    'kjgtwc6l': {
      'en': 'No Pending',
      'ta': '',
    },
    'xfe9va29': {
      'en': 'You doin\'t have any upcoming appointments.',
      'ta': '',
    },
  },
  // Miscellaneous
  {
    'bj0upuxw': {
      'en': '',
      'ta': '',
    },
    'l3ak18qm': {
      'en': '',
      'ta': '',
    },
    'up0facjq': {
      'en': '',
      'ta': '',
    },
    'r3nyeeoj': {
      'en': '',
      'ta': '',
    },
    'c4yag8tu': {
      'en': '',
      'ta': '',
    },
    'cd286l1t': {
      'en': '',
      'ta': '',
    },
    '5n5itmm9': {
      'en': '',
      'ta': '',
    },
    '1cwlueqy': {
      'en': '',
      'ta': '',
    },
    'mmfd95p7': {
      'en': '',
      'ta': '',
    },
    '2d1277cq': {
      'en': '',
      'ta': '',
    },
    'hj6w41dm': {
      'en': '',
      'ta': '',
    },
    '3kntqmat': {
      'en': '',
      'ta': '',
    },
    'd4w6y7zl': {
      'en': '',
      'ta': '',
    },
    'df6ahq69': {
      'en': '',
      'ta': '',
    },
    'tq6efk27': {
      'en': '',
      'ta': '',
    },
    'rjrcv3x9': {
      'en': '',
      'ta': '',
    },
    'izq2wcvd': {
      'en': '',
      'ta': '',
    },
    'sdyk10q7': {
      'en': '',
      'ta': '',
    },
    'x73voxlz': {
      'en': '',
      'ta': '',
    },
    's9hbnts4': {
      'en': '',
      'ta': '',
    },
  },
].reduce((a, b) => a..addAll(b));

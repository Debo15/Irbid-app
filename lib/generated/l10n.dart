// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Irbid`
  String get title {
    return Intl.message(
      'Irbid',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `The north's pride`
  String get dance {
    return Intl.message(
      'The north\'s pride',
      name: 'dance',
      desc: '',
      args: [],
    );
  }

  /// `Home page`
  String get homePage {
    return Intl.message(
      'Home page',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `Irbid history`
  String get irbidHis {
    return Intl.message(
      'Irbid history',
      name: 'irbidHis',
      desc: '',
      args: [],
    );
  }

  /// `Culture in Irbid`
  String get irbidCul {
    return Intl.message(
      'Culture in Irbid',
      name: 'irbidCul',
      desc: '',
      args: [],
    );
  }

  /// `Economy in Irbid`
  String get irbidEco {
    return Intl.message(
      'Economy in Irbid',
      name: 'irbidEco',
      desc: '',
      args: [],
    );
  }

  /// `Education in Irbid`
  String get irbidEdu {
    return Intl.message(
      'Education in Irbid',
      name: 'irbidEdu',
      desc: '',
      args: [],
    );
  }

  /// `Tourism in Irbid`
  String get irbidTou {
    return Intl.message(
      'Tourism in Irbid',
      name: 'irbidTou',
      desc: '',
      args: [],
    );
  }

  /// `Health in Irbid`
  String get irbidHeal {
    return Intl.message(
      'Health in Irbid',
      name: 'irbidHeal',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

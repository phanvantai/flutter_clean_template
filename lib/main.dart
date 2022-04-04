import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'injection_container.dart' as di;
import 'routing.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('vi', 'VN'), Locale('en', 'US')],
      path: 'assets/translations',
      // <-- change the path of the translation files
      fallbackLocale: const Locale('vi', 'VN'),
      child: const MyAppView(),
    ),
  );
}

class MyAppView extends StatefulWidget {
  const MyAppView({Key? key}) : super(key: key);

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppViewState>()?.restartApp();
  }

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppViewState? state = context.findAncestorStateOfType<_MyAppViewState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  Key key = UniqueKey();
  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  void setLocale(Locale value) async {
    await context.setLocale(value);
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: _materialApp(),
    );
  }

  _provider() {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //     create: (context) => di.getIt<SplashViewModel>()),
        // ChangeNotifierProvider(create: (context) => di.getIt<LoginViewModel>()),
      ],
      child: _materialApp(),
    );
  }

  _materialApp() {
    return MaterialApp(
      builder: EasyLoading.init(),
      //navigatorKey: di.getIt<AppNavigator>().navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: '',
      onGenerateRoute: Routing.generateRoute,
      initialRoute: Routing.splash,
    );
  }
}

import 'package:athaar_app/home/splash_screen.dart';
import 'package:athaar_app/home/tabs/home_tab/icons_button/artifacts_list.dart';
import 'package:athaar_app/home/tabs/home_tab/icons_button/events_list.dart';
import 'package:athaar_app/home/tabs/home_tab/icons_button/museums_list.dart';
import 'package:athaar_app/home/tabs/home_tab/icons_button/nearby_list.dart';
import 'package:athaar_app/home/tabs/home_tab/see_all/experience_near_see_all.dart';
import 'package:athaar_app/home/tabs/home_tab/see_all/featured_museums_see_all.dart';
import 'package:athaar_app/providers/app_theme_provider.dart';
import 'package:athaar_app/utils/app_routes.dart';
import 'package:athaar_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/auth/login/login_screen.dart';
import 'home/auth/registration/sign_in_screen.dart';
import 'home/home_screen.dart';
import 'home/onboarding/onboarding_screen.dart';
import 'l10n/app_localizations.dart';
import 'providers/app_language_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeProvider = AppThemeProvider();
  await themeProvider.loadTheme();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AppLanguageProvider(),
      ),
      ChangeNotifierProvider.value(
        value: themeProvider,
      ),
    ],
    child: const MyApp(),
  ),);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteScreen,
      routes: {
        AppRoutes.onBoardingRouteScreen: (context) => OnBoardingScreen(),
        AppRoutes.homeRouteScreen: (context) => HomeScreen(),
        AppRoutes.loginScreen: (context) => LoginScreen(),
        AppRoutes.signinScreen: (context) => SignInScreen(),
        AppRoutes.museumsScreen: (context) => MuseumsList(),
        AppRoutes.artifactsScreen: (context) => ArtifactsList(),
        AppRoutes.nearbyScreen: (context) => NearbyList(),
        AppRoutes.eventsScreen: (context) => EventsList(),
        AppRoutes.fMSeeAllScreen: (context) => FeaturedMuseumsSeeAll(),
        AppRoutes.eNSeeAllScreen: (context) => ExperienceNearSeeAll(),

      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
      locale: Locale(languageProvider.appLanguage),


    );
  }
}
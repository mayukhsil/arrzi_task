import 'package:arrzitask/l10n/l10n.dart';
import 'package:arrzitask/modules/home/home.dart';
import 'package:arrzitask/repository/dashboard_repository.dart';
import 'package:arrzitask/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: AppColor.appBlack,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: AppColor.appPrimary,
          backgroundColor: AppColor.appGrey,
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: RepositoryProvider(
        create: (context) => DashboardRepository(),
        child: const HomeView(),
      ),
    );
  }
}

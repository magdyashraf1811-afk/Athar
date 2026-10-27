import 'package:athaar_app/home/widget/app_bar_widget.dart';
import 'package:athaar_app/home/widget/custom_elevated_button.dart';
import 'package:athaar_app/home/widget/list_view_widget.dart';
import 'package:athaar_app/l10n/app_localizations.dart';
import 'package:athaar_app/utils/app_colors.dart';
import 'package:athaar_app/utils/app_image.dart';
import 'package:athaar_app/utils/app_routes.dart';
import 'package:athaar_app/utils/app_style.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    final gold = themeProvider.isDarkMode()
        ? AppColors.gold
        : AppColors.darkGold;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.18,
        ),
        child: const AppBarWidget(),
      ),
      backgroundColor: themeProvider.isDarkMode() ? AppColors.darkColor : AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.02,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            spacing: height * 0.02,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: width*0.08,
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      borderSideColor: gold.withOpacity(
                        themeProvider.isDarkMode() ? 0.90 : 0.80,
                      ),
                      backgroundColor: themeProvider.isDarkMode()
                          ? AppColors.darkColor
                          : AppColors.whiteColor,
                      onPressed: () {
                        // todo go to museums list
                        Navigator.pushReplacementNamed(context, AppRoutes.museumsScreen);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: height * 0.005,
                        children: [
                          Image.asset(AppImage.museumIcon),
                          Text(
                            AppLocalizations.of(context)!.museums,
                            style: themeProvider.isDarkMode()
                                ? AppStyle.bold16bgWhite
                                : AppStyle.bold16lightGray,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      borderSideColor: gold.withOpacity(
                        themeProvider.isDarkMode() ? 0.90 : 0.80,
                      ),
                      backgroundColor: themeProvider.isDarkMode()
                          ? AppColors.darkColor
                          : AppColors.whiteColor,
                      onPressed: () {
                        // todo go to Artifacts liat
                        Navigator.pushReplacementNamed(context, AppRoutes.artifactsScreen);

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        spacing: height * 0.005,
                        children: [
                          Image.asset(AppImage.artifactsIcon),
                          Text(
                            AppLocalizations.of(context)!.artifacts,
                            style: themeProvider.isDarkMode()
                                ? AppStyle.bold16bgWhite
                                : AppStyle.bold16lightGray,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      borderSideColor: gold.withOpacity(
                        themeProvider.isDarkMode() ? 0.90 : 0.80,
                      ),
                      backgroundColor: themeProvider.isDarkMode()
                          ? AppColors.darkColor
                          : AppColors.whiteColor,
                      onPressed: () {
                        // todo go to nearby list
                        Navigator.pushReplacementNamed(context, AppRoutes.nearbyScreen);

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        spacing: height * 0.005,
                        children: [
                          Image.asset(AppImage.locationIcon),
                          Text(
                            AppLocalizations.of(context)!.nearby,
                            style: themeProvider.isDarkMode()
                                ? AppStyle.bold16bgWhite
                                : AppStyle.bold16lightGray,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      borderSideColor: gold.withOpacity(
                        themeProvider.isDarkMode() ? 0.90 : 0.80,
                      ),
                      backgroundColor: themeProvider.isDarkMode()
                          ? AppColors.darkColor
                          : AppColors.whiteColor,
                      onPressed: () {
                        // todo go to events list
                        Navigator.pushReplacementNamed(context, AppRoutes.eventsScreen);

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: height * 0.005,
                        children: [
                          Image.asset(AppImage.eventsIcon),
                          Text(
                            AppLocalizations.of(context)!.events,
                            style: themeProvider.isDarkMode()
                                ? AppStyle.bold16bgWhite
                                : AppStyle.bold16lightGray,
                          ),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.feature_museums,
                    style: themeProvider.isDarkMode()
                        ? AppStyle.bold18White
                        : AppStyle.bold18Black,
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: See All
                      Navigator.pushReplacementNamed(context, AppRoutes.fMSeeAllScreen);

                    },
                    child: Text(
                      AppLocalizations.of(context)!.see_all,
                      style: AppStyle.bold14Primary,
                    ),
                  ),
                ],
              ),
              ListViewWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.near,
                    style: themeProvider.isDarkMode()
                        ? AppStyle.bold18White
                        : AppStyle.bold18Black,
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: See All
                      Navigator.pushReplacementNamed(context, AppRoutes.eNSeeAllScreen);

                    },
                    child: Text(
                      AppLocalizations.of(context)!.see_all,
                      style: AppStyle.bold14Primary,
                    ),
                  ),
                ],
              ),
              ListViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/app_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';
import 'custom_text_form_field.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    final gold = themeProvider.isDarkMode() ? AppColors.gold : AppColors.darkGold;

    return AppBar(
      title: Padding(
        padding:  EdgeInsets.symmetric(
          vertical: height*0.02,
          horizontal: width * 0.01,

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: height*0.02,

          children: [
            Row(
              children: [
                Text(
                  'ATHAR',
                  maxLines: 1,
                  style: GoogleFonts.cinzel(
                      fontSize: 30,
                      color: const Color(0xffd4af37),
                      fontWeight: FontWeight.bold

                  ),
                ),
                Spacer(),
                Icon(Icons.circle_notifications_outlined,color: Color(0xffd4af37)),
                Icon(Icons.person_3_outlined,color: Color(0xffd4af37))
              ],
            ),
            CustomTextFormField(

              filled: true,
              fillColor: themeProvider.isDarkMode()
                  ? AppColors.darkColor
                  : AppColors.whiteColor,
              borderSideColor: gold.withOpacity(themeProvider.isDarkMode()?0.90:0.80) ,
              hintText: AppLocalizations.of(context)!.search,
              hintStyle: AppStyle.bold16lightGray,
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.primaryColor,
              ),
            ),

          ],
        ),
      ),
      toolbarHeight: 160,
      backgroundColor: themeProvider.isDarkMode()?AppColors.transparentColor: AppColors.beigeDesertColor,
      shape:  RoundedRectangleBorder(
          borderRadius: const BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)
          )
      ),
    );
  }
}

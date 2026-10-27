import 'package:athaar_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_image.dart';
import '../../utils/app_style.dart';

class ListViewWidget extends StatelessWidget {

  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> museumsNamesList = [
      AppLocalizations.of(context)!.grand_egyption_museum,
      AppLocalizations.of(context)!.graeco_roman_museum,
      AppLocalizations.of(context)!.islamic_arts_museum,
    ];

    final List<String> museumsList = [
      AppImage.grandMuseumImage,
      AppImage.graecoRomanMuseumImage,
      AppImage.islamicArtMuseumImage,
    ];
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: museumsList.length,
        itemBuilder: (context, index) {
          return Container(

            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 280,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(
                  color: themeProvider.isDarkMode()?AppColors.gold.withOpacity(0.90):AppColors.darkGold.withOpacity(0.80),
                  width: 2
              ),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(museumsList[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.55),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            museumsNamesList[index],
                            style: AppStyle.bold16White,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Color(0xffd4af37),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

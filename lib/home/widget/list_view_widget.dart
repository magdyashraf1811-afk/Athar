import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_style.dart';

class ListViewWidget extends StatelessWidget {
  final double height;
  final double itemWidth;
  final double size;
  final List<String> titles;
  final List<String> images;
  final IconData? icon;
  final TextStyle style ;

  const ListViewWidget({
    super.key,
    required this.height,
    required this.size,
    required this.style,
    required this.itemWidth,
    required this.titles,
    required this.images,
    this.icon,
  }) : assert(titles.length == images.length);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: itemWidth,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              border: Border.all(
                color: themeProvider.isDarkMode()
                    ? AppColors.gold.withOpacity(0.90)
                    : AppColors.darkGold.withOpacity(0.80),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(images[index]),
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
                            titles[index],
                            style: style,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (icon != null) ...[
                          SizedBox(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.museumsDetailsScreen,
                                );
                              },
                              child: Icon(
                                icon,
                                size: size,
                                color: Color(0xffd4af37),
                              ),
                            ),
                          ),
                        ],
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

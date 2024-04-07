import 'package:flutter/material.dart';

import '../appProperties/app_colors.dart';

class AppMasterBar extends StatelessWidget {
  final VoidCallback enableAppMaster;
  final double appMasterVisibility;
  const AppMasterBar({
    super.key,
    required this.enableAppMaster,
    required this.appMasterVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: enableAppMaster,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cruelty_free_outlined,
            size: 40,
            color: AppColor.white.withOpacity(0.02 + appMasterVisibility),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                "Made By",
                style: TextStyle(
                  color: AppColor.white.withOpacity(0.02 + appMasterVisibility),
                ),
              ),
              Text(
                "G A U R A V",
                style: TextStyle(
                  color: AppColor.red.withOpacity(0.16 + appMasterVisibility),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.cruelty_free_outlined,
            size: 40,
            color: AppColor.white.withOpacity(0.02 + appMasterVisibility),
          ),
        ],
      ),
    );
  }
}

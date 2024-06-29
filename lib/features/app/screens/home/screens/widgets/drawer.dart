import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../about/about_screen.dart';
import '../../../theme/change_theme_screen.dart';
import '../../../diseases/diseases_screen.dart';
import '../../../settings/settings_screen.dart';
import '../../../team_members/team_members_screen.dart';
import '../../../../../../utils/constants/image_strings.dart';
import 'drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250.0,
      backgroundColor: Colors.teal,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Image.asset(Images.appLogo, height: 100),
                const Text(
                  'Mental Health',
                  style: TextStyle(fontFamily: 'Pacifico'),
                ),
              ],
            ),
          ),
          DrawerItem(
            image: Images.diseasesIcon,
            text: 'Diseases',
            onTap: () => Get.to(() => const DiseasesList()),
          ),
          DrawerItem(
            image: Images.aboutIcon,
            text: 'About',
            onTap: () => Get.to(() => AboutScreen()),
          ),
          DrawerItem(
            image: Images.teamIcon,
            text: 'Team Members',
            onTap: () => Get.to(() => const TeamMembersScreen()),
          ),
          DrawerItem(
            image: Images.settingsIcon,
            text: 'How to use the app',
            onTap: () => Get.to(() => const SettingsScreen()),
          ),
          DrawerItem(
            image: Images.themeIcon,
            text: 'App Theme',
            onTap: () => Get.to(() => const ChangeThemeScreen()),
          ),
        ],
      ),
    );
  }
}

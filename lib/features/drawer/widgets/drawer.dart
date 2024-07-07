import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/about/about_screen.dart';
import '../screens/team_members/team_members_screen.dart';
import '../screens/diseases/diseases_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../../../utils/constants/image_strings.dart';
import '../screens/theme/change_theme_screen.dart';
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
            text: 'User Guide',
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

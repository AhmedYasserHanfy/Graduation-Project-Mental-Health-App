import 'package:flutter/material.dart';
import 'package:mental_health/common/widgets/refresh.dart';
import 'package:mental_health/utils/constants/image_strings.dart';
import 'package:mental_health/features/drawer/screens/team_members/widgets/member_container.dart';

class TeamMembersScreen extends StatelessWidget {
  const TeamMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Team Members'), centerTitle: true),
      body: const Refresh(
        widget: SingleChildScrollView(
          child: Column(
            children: [
              // Yasser
              MemberContainer(name: 'Ahmed Yasser Hanafy', image: Images.ahmed),
              SizedBox(height: 10),

              // Adel
              MemberContainer(name: 'Adel Hani Mohamed', image: Images.adel),
              SizedBox(height: 10),

              // Soliman
              MemberContainer(
                name: 'Ahmed Mohamed Soliman',
                image: Images.soliman,
              ),
              SizedBox(height: 10),

              // Gasser
              MemberContainer(
                name: 'Gasser Mohamed AlMasah',
                image: Images.gasser,
              ),
              SizedBox(height: 10),

              // Dead Man
              MemberContainer(
                name: 'Abdel-Badi Abdullah Salem',
                image: Images.abdelBadi,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

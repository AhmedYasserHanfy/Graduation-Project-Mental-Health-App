import 'package:flutter/material.dart';

class MemberContainer extends StatelessWidget {
  final String? name;
  final String? image;

  const MemberContainer({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xff92BEFD),
        borderRadius: BorderRadius.circular(30),
      ),
      height: 110,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              radius: 45,
              child: CircleAvatar(
                radius: 47,
                backgroundImage: AssetImage(image!),
              ),
            ),
          ),
          Text(
            name!,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialPlatform {
  final String name;
  final IconData icon;
  final Color color;
  bool isConnected;

  SocialPlatform({
    required this.name,
    required this.icon,
    required this.color,
    this.isConnected = false,
  });
}

List<SocialPlatform> getPlatforms() {
  return [
    SocialPlatform(name: 'TikTok', icon: FontAwesomeIcons.tiktok, color: const Color(0xFFE62A5D), isConnected: true),
    SocialPlatform(name: 'YouTube', icon: FontAwesomeIcons.youtube, color: const Color(0xFFFF0000), isConnected: true),
    SocialPlatform(name: 'Instagram', icon: FontAwesomeIcons.instagram, color: const Color(0xFFC13584), isConnected: true),
    SocialPlatform(name: 'LinkedIn', icon: FontAwesomeIcons.linkedin, color: const Color(0xFF0077B5)),
    SocialPlatform(name: 'Snapchat', icon: FontAwesomeIcons.snapchat, color: const Color(0xFFFFFC00), isConnected: true),
    SocialPlatform(name: 'Pinterest', icon: FontAwesomeIcons.pinterest, color: const Color(0xFFBD081C)),
    SocialPlatform(name: 'Google Sheets', icon: FontAwesomeIcons.fileCsv, color: const Color(0xFF0F9D58)),
    SocialPlatform(name: 'Google Drive', icon: FontAwesomeIcons.googleDrive, color: const Color(0xFF4285F4)),
    SocialPlatform(name: 'Facebook', icon: FontAwesomeIcons.facebook, color: const Color(0xFF1877F2)),
    SocialPlatform(name: 'Twitter (X)', icon: FontAwesomeIcons.xTwitter, color: Colors.white),
  ];
}

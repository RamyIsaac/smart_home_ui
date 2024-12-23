import 'package:flutter/material.dart';
import 'package:smart_home/theme.dart';

class SceneControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SceneTile(sceneName: 'Good Morning', icon: 'assets/morning.png'),
        SceneTile(sceneName: 'Movie Night', icon: 'assets/sleep.png'),
        SceneTile(sceneName: 'Sleep Mode', icon: 'assets/crescent-moon.png'),
      ],
    );
  }
}

class SceneTile extends StatelessWidget {
  final String sceneName;
  final String icon;

  SceneTile({required this.sceneName, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        icon,
        width: 30,
        height: 30,
        color: AppColors.highlight,
      ),
      title: Text(sceneName, style: AppTextStyles.sceneName),
      trailing: Icon(Icons.arrow_forward_ios, color: AppColors.highlight),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_home/theme.dart';
import 'package:smart_home/widgets/device_control.dart';
import 'package:smart_home/widgets/energy_monitoring.dart';
import 'package:smart_home/widgets/scene_control.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('SmartHome'),
        backgroundColor: AppColors.highlight,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home Status', style: AppTextStyles.deviceName),
              SizedBox(height: 10),
              DeviceControl(),
              SizedBox(height: 20),
              Text('Scenes', style: AppTextStyles.deviceName),
              SizedBox(height: 10),
              SceneControl(),
              SizedBox(height: 20),
              Text('Energy Monitoring', style: AppTextStyles.deviceName),
              SizedBox(height: 10),
              EnergyMonitoring(),
            ],
          ),
        ),
      ),
    );
  }
}

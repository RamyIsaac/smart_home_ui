import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../theme.dart';

class DeviceControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DeviceTile(
          deviceName: 'Living Room Light',
          isOn: true,
          onColor: AppColors.onColor,
          offColor: AppColors.offColor,
          hasSlider: true,
          sliderValue: 0.5,
        ),
        DeviceTile(
          deviceName: 'Thermostat',
          isOn: false,
          onColor: AppColors.onColor,
          offColor: AppColors.offColor,
        ),
        DeviceTile(
          deviceName: 'Security System',
          isOn: true,
          onColor: AppColors.onColor,
          offColor: AppColors.offColor,
        ),
      ],
    );
  }
}

class DeviceTile extends StatelessWidget {
  final String deviceName;
  final bool isOn;
  final Color onColor;
  final Color offColor;
  final bool hasSlider;
  final double sliderValue;

  DeviceTile({
    required this.deviceName,
    required this.isOn,
    required this.onColor,
    required this.offColor,
    this.hasSlider = false,
    this.sliderValue = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(deviceName, style: AppTextStyles.deviceName),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasSlider)
            Container(
              width: 100,
              child: Slider(
                value: sliderValue,
                onChanged: (value) {},
                activeColor: onColor,
                inactiveColor: offColor.withOpacity(0.3),
              ),
            ),
          Switch(
            value: isOn,
            onChanged: (value) {},
            activeColor: onColor,
            inactiveThumbColor: offColor,
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle action selection
            },
            itemBuilder: (BuildContext context) {
              return {'Edit', 'Delete'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}

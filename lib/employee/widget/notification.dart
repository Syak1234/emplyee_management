import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';

void showNotification(
    BuildContext context, String title, String description, int index) {
  if (index == 0)
    ElegantNotification.success(
      width: 360,
      title: Text(title),
      description: Text(description),
    ).show(context);
  //  showDialog(context: context, builder: );
  else if (index == 1)
    ElegantNotification.error(
      width: 360,
      title: Text(title),
      description: Text(description),
    ).show(context);
}


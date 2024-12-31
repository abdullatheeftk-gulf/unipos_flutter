import 'package:flutter/material.dart';

Future<DateTime?> showDateSelectorDialog({required BuildContext context}) {
  return showDatePicker(
    context: context,
    firstDate: DateTime.now().subtract(const Duration(days: 1460)),
    lastDate: DateTime.now().add(
      const Duration(days: 1460),
    ),
  );
}

Future<TimeOfDay?> showTimeSelectorDialog({required BuildContext context}) {
  return showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
}

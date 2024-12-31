import 'package:intl/intl.dart';

String dateFormat(DateTime dateTime){
  return DateFormat("dd-MM-yyyy").format(dateTime);
}

String timeFormat(DateTime dateTime){
  return DateFormat("hh:mm a").format(dateTime);
}
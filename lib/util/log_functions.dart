import 'dart:developer';

const String red = '\x1B[31m';
const String green = '\x1B[32m';
const String yellow = '\x1B[33m';
const String blue = '\x1B[34m';
const String magenta = '\x1B[35m';
const String reset = '\x1B[0m';
const String white = '\x1B[37m';

void errorLog(dynamic message, {String name = 'ERROR'}) {
  log(
    "$red$message$reset",
    name: name,
  );
}

void warningLog(dynamic message, {String name = 'WARNING'}) {
  log(
    "$yellow$message$reset",
    name: name,
  );
}

void infoLog(dynamic message, {String name = 'INFO'}) {
  log(
    "$blue$message$reset",
    name: name,
  );
}

void debugLog(dynamic message, {String name = 'DEBUG'}) {
  log(
    "$white$message$reset",
    name: name,
  );
}

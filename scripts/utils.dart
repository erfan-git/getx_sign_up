import 'dart:io';

const _red = '\u001b[31m';
const _resetColor = '\u001B[39m';

void checkIsRootDirectory() {
  if (File('pubspec.yaml').existsSync() == false) {
    print(
      '${_red}Error: No pubspec.yaml file found.\n'
      'This command should be run from the root of your Flutter project.$_resetColor',
    );
    exit(1);
  }
}

String snakeCaseToCamelCase(String snakeCaseString) {
  final words = snakeCaseString.split('_');
  return [
    for (var i = 0; i < words.length; i++)
      i == 0 ? words[i] : words[i][0].toUpperCase() + words[i].substring(1)
  ].join();
}

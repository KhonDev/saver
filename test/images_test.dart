import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:power_bank/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.russia).existsSync(), isTrue);
    expect(File(Images.uzb).existsSync(), isTrue);
  });
}

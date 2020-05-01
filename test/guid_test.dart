import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Guid Tests", () {
    test("Guid Equality Test Works", () {
      final guidAlpha = new Guid("ac3fa00f-8f5b-4e93-b7a5-2ee3051a12b9");
      final guidBeta = new Guid("AC3fa00f-8f5b-4e93-b7a5-2ee3051a12b9");

      final areEqual = guidAlpha == guidBeta;

      expect(true, areEqual);
    });

    test("Guid Equality Test With Null Does Not Crash", () {
      final guidAlpha = new Guid("");
      final Guid guidBeta = null;

      final areEqual = guidAlpha == guidBeta;

      expect(areEqual, false);
    });
  });
}

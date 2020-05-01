library flutter_guid;

import 'package:uuid/uuid.dart';

/// Class that emulates as closely as possible the C# Guid type.
class Guid {
  
  static const String _defaultGuid = "00000000-0000-0000-0000-000000000000";

  /// The Guid whose value is the default sequence of characters that represent a 'zero-value' UUID in .Net "00000000-0000-0000-0000-000000000000"
  static Guid get defaultValue => new Guid(_defaultGuid);

  String _value;

  /// Constructor, expects a valid UUID and will throw an exception if the value provided is invalid.
  Guid(String v) {
    _failIfNotValidGuid(v);
    _value = v;
  }

  /// Generates a new UUID and returns a GUID instance with the new UUID.
  static Guid get newGuid {
    return new Guid(Uuid().v1());
  }

  _failIfNotValidGuid(String v) {
    if (v == null || v.isEmpty) {
      v = _defaultGuid;
    }
    Uuid().parse(v);
  }

  /// Gets the UUID value contained by the Guid object as a string.
  String get value {
    if (_value == null || _value.isEmpty) {
      return _defaultGuid;
    } else {
      return _value;
    }
  }

  /// Performs a case insensitive comparison on the UUIDs contained in two Guid objects.
  /// Comparison is by value and not by reference.
  bool operator ==(other) {
    return this.value.toLowerCase() == other.toString().toLowerCase();
  }


  /// Returns the hashCode.
  @override
  int get hashCode {
    return super.hashCode;
  }

  /// Gets the UUID value contained by the Guid object as a string.
  @override
  String toString() {
    return value;
  }
}

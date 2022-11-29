library flutter_guid;

import 'package:flutter_guid/flutter_guid_error.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

/// Class that emulates as closely as possible the C# Guid type.
class Guid {
  static const String _defaultGuid = "00000000-0000-0000-0000-000000000000";

  /// The Guid whose value is the default sequence of characters that represent a 'zero-value' UUID in .Net "00000000-0000-0000-0000-000000000000"
  static Guid get defaultValue => new Guid(_defaultGuid);

  String? _value;

  /// Generates a new v4 UUID during instantiation and returns a GUID instance with the new UUID.
  Guid.generate() : this(Guid.newGuid.value);

  /// Constructor, expects a valid UUID and will throw an exception if the value provided is invalid.
  Guid(String? v) {
    _failIfNotValidGuid(v);
    _value = v;
  }

  /// Generates a new v4 UUID and returns a GUID instance with the new UUID.
  static Guid get newGuid {
    return new Guid(Uuid().v4());
  }

  /// Checks whether a value is a valid Guid
  /// Returns false if 'guid' is null or has an invalid value
  /// Returns true if guid is valid
  static bool isValid(Guid? guid) {
    if (guid == null) {
      return false;
    } else {
      return isUUID(guid.value);
    }
  }

  _failIfNotValidGuid(String? v) {
    if (v == null || v.isEmpty) {
      v = _defaultGuid;
    }
    final isInvalid = isUUID(v) == false;
    if (isInvalid) {
      throw new FlutterGuidError("Value '$v' is not a valid UUID");
    }
  }

  /// Gets the UUID value contained by the Guid object as a string.
  String get value {
    if (_value == null || _value!.isEmpty) {
      return _defaultGuid;
    } else {
      return _value!;
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

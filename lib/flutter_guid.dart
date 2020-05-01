library flutter_guid;

import 'package:uuid/uuid.dart';

class Guid {
  static const String _defaultGuid = "00000000-0000-0000-0000-000000000000";

  static Guid get defaultValue => new Guid(_defaultGuid);

  String _value;

  Guid(String v) {
    _failIfNotValidGuid(v);
    _value = v;
  }

  static Guid get newGuid {
    return new Guid(Uuid().v1());
  }

  _failIfNotValidGuid(String v) {
    if (v == null || v.isEmpty) {
      v = _defaultGuid;
    }
    Uuid().parse(v);
  }

  String get value {
    if(_value == null || _value.isEmpty){
      return _defaultGuid;
    }else{
      return _value;
    }
  }

  set value(String v) {
    _value = v;
  }

  bool operator ==(other) {
    return this.value.toLowerCase() == other.toString().toLowerCase();
  }

  @override
  int get hashCode {
    return super.hashCode;
  }

  @override
  String toString() {
    return value;
  }
}


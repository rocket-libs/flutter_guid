import 'package:flutter_guid/flutter_guid.dart';

class Employee {
  final Guid id;
  final Guid departmentId;

  Employee({
    required this.id,
    required this.departmentId,
  });
}

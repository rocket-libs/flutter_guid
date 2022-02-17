import 'package:flutter_guid/flutter_guid.dart';

import 'Employee.dart';

class EmployeeManager {
  static final String workShopGuidString =
      "edea6638-dd1d-4e26-a207-e4044ad22687";
  final employeeList = <Employee>[];

  // initialize a guid from a string
  final accountsDepartmentId = new Guid("41e879aa-859c-4bda-b77b-37b7e07c6674");

  // initialize a new guid with the 'workShopGuidString' value, Lowercased.
  final workshopDepartmentIdLowerCased =
      new Guid(workShopGuidString.toLowerCase());

  // initialize a second guid with the 'workShopGuidString' value, BUT UPPERCASED this time.
  final workshopDepartmentIdUpperCased =
      new Guid(workShopGuidString.toUpperCase());

  populateEmployeeList() {
    final accountant = new Employee(
        departmentId: accountsDepartmentId, // use pre-initialized guid value.
        id: Guid
            .newGuid // Generate a guid on the fly (Uses the superb package 'https://pub.dev/packages/uuid').
        );

    final engineer = new Employee(
        departmentId: workshopDepartmentIdLowerCased, id: Guid.newGuid);

    employeeList
      ..add(accountant)
      ..add(engineer);
  }

  Employee getEngineer() {
    final theEngineer = employeeList.singleWhere((employee) {
      //Comparison done on guid value is case-insensitive
      //employee.departmentId was initialized with a lowercase string but is compared to a guid initialized with an uppercase string and WILL SUCCESSFULLY match
      return employee.departmentId == workshopDepartmentIdUpperCased;
    });

    return theEngineer;
  }

  bool engineerIdIsDefault() {
    final engineer = getEngineer();

    // Returns true if engineerId == "00000000-0000-0000-0000-000000000000".
    // This value is assigned to Guids if no other value is explicitly set on them
    // NOTE: The guid variable itself if nullable but, its value once initialized is guaranteed to always be either the defaultValue or a valid UUID
    return engineer.id == Guid.defaultValue;
  }
}

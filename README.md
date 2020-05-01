# flutter_guid

A flutter package that emulates the C# type Guid. Use this package to:
1. Generate new UUIDs.
1. Add variables of type Guid to your classes.
1. Compare two 'Guid' variables safely against each other.
1. Guarantee validity of data when working with UUID values.

## Getting Started
### Installing
Install from https://pub.dev/packages/flutter_guid#-installing-tab- , "flutter_guid's installation page on pub.dev"

### Usage
#### Add to your class.
```dart
import 'package:flutter_guid/flutter_guid.dart';

class Employee{
  final Guid id;
  final Guid departmentId;

  Employee({this.id, this.departmentId});
}
```

#### Initialize Guid values
```dart

// initialize a guid from a string
final accountsDepartmentId = new Guid("41e879aa-859c-4bda-b77b-37b7e07c6674");

 // Generate a guid on the fly (Uses the superb package 'https://pub.dev/packages/uuid').
final employeeId = Guid.newGuid;

```

#### Compare Guids
```dart
// initialize a guid from a lowercase string
final accountsDepartmentIdLowerCase = new Guid("41e879aa-859c-4bda-b77b-37b7e07c6674");

// initialize a guid with same string, but UPPERCASE
final accountsDepartmentIdUpperCase = new Guid("41E879AA-859C-4BDA-B77B-37B7E07C6674");

// performs case-insensitive comparison and evaluates to 'true'
final equal = accountsDepartmentIdUpperCase == accountsDepartmentIdLowerCase;

```

#### Getting the UUID value contained in the GUID
```dart
final Guid accountsDepartmentIdLowerCase = new Guid("41e879aa-859c-4bda-b77b-37b7e07c6674");

// this works.
String uuidString = accountsDepartmentIdLowerCase.value;

// this also works.
uuidString = accountsDepartmentIdLowerCase.toString();
```

## Testing
### Basic Testing
Clone the repo and run ```flutter test```
### Testing With Coverage Information (Linux only)
1. Ensure you have lcov installed and setup on your system (http://ltp.sourceforge.net/coverage/lcov.php).
2. Ensure the run-tests script in the project root is executable (```chmod +x ./run-tests.sh```).
3. Execute the run-tests script in the project root ```./run-tests.sh```.
4. Navigate into directory ./coverage/html/ (relative to project root). 
5. Open index.html to view coverage information.

### Coverage Information On Other Systems
It is unlikely that I'll be porting the run-tests.sh script to other systems, my reason mostly being that I don't frequently use any other OS and would not want to pick a sub-optimal tool for coverage generation (also laziness probably is a factor).

Anyhow, it should be fairly straight-forward to do the porting if you so wish.

The run-tests.sh consists of all of two lines:
1. flutter test --coverage
1. genhtml ./coverage/lcov.info  -o ./coverage/html

The first line is platform independent and generates the file ./coverage/lcov.info (again relative to project root).
On Linux, we can consume the coverage info contained in this file via the lcov tool. On Windows and other
platforms, there exists also tools that would be able to similarly consume the coverage information and produce human friendly
output.

In essense, port the script to desired platform by
1. Keeping the first line 'as is'.
1. Finding a tool to process the ./coverage/lcov.info file.
1. Profit!

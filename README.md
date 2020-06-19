 A Random generator for Dates given range of years.
 
 This package ability to take in startYear and optional endYear(exclusive) and Options to generate a valid date within
 the range. Uses [Dart Math Random][] to generate random value.
 
  [Dart Math Random]: https://api.dart.dev/stable/2.8.4/dart-math/Random-class.html
 
 ### Optional Arguments
 EndYear When not provided, we consider current year plus 5 years
 You can choose to skip leap years within the range. 
 
 ## Usage
 
 
 ```dart
 import 'package:random_date/random_date.dart'
 ```
 
 The most common way of using this function is calling with a range.
 
 ```dart
 var randomDate = RandomDate();
// generates a random date within range of years 1980 and 2000
 var dateTime = randomDate.generateRandomDate(1980,2000);
 ```

 ```dart
 var randomDate = RandomDate();
// deduces endYear from current year plus 5 years
 var dateTime = randomDate.generateRandomDate(1980);
 ```

 ```dart
 var randomDate = RandomDate();
 var options = RandomDateOptions();
 // in case of endYear not provided, this option adds 10 years to the current year
 options.addYearsToCurrent = 10
// deduces endYear from current year plus 10 years
 var dateTime = randomDate.generateRandomDate(1980);
 ```

 ```dart
 var randomDate = RandomDate();
 var options = RandomDateOptions();
 // while generating dates, excludes leap year, until a non leap year is found, we keep generating
// dates.
 options.excludeLeapYear = true
 var dateTime = randomDate.generateRandomDate(1980);
 ```

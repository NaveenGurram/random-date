 A Random generator for Dates given range of years.
 
 This package ability to take in startYear and optional endYear(exclusive) and Options to generate a valid date within
 the range. Uses [Dart Math Random][] to generate random value.
 
  [Dart Math Random]: https://api.dart.dev/stable/2.8.4/dart-math/Random-class.html
  [leap year]: https://en.wikipedia.org/wiki/Leap_year
  
 ### Defaults
 Includes [leap year] Leap Years
 
 EndYear when not provided, considers current year plus 5 years.
 
 _eg:_  2025 ( for current year 2020)
 
 ### Optional Arguments
 EndYear When not provided, we consider current year plus 5 years
 You can choose to skip leap years within the range. 
 
  ```dart
  var options = RandomDateOptions();
    // years to add in case endYear is not provided
    options.addYearsToCurrent = 10;
    // in case of excluding leap years
    options.excludeLeapYear = true;
  ```
 
 ## Usage
 
 
 ```dart
 import 'package:random_date/random_date.dart';
 ```

## Constructors
```dart
//with just start year
var randomDate = RandomDate.withStartYear(2000);
//with range
var randomDate = RandomDate.withRange(2000,2005);
//with StartYear and Options
var randomDate = RandomDate.withStartYearAndOptions(2000,RandomDateOptions());
//with Range and Options
var randomDate = RandomDate.withRangeAndOptions(2000,2005,RandomDateOptions());

// Constructors for RandomDateOptions
  // modifying default value
var randomDateOptions = RandomDateOptions.withDefaultYearsToCurrent(10);
// setting exclude leap years
var randomDateOptions = RandomDateOptions.excludeLeapYears();
// modifying default values
var randomDateOptions = RandomDateOptions.withValues(true,10);
```
 
 The most common way of using this function is calling with a range.
 
 ```dart
// generates a random date within range of years 1980 and 2000
 var dateTime = RandomDate.withRange(2000, 2010).random();
 ```

 ```dart
// deduces endYear from current year plus 5 years when endDate is not provided
 var dateTime = RandomDate.withStartYear(1980).random();
 ```

 ```dart
 var randomDate = RandomDate();
 var options = RandomDateOptions();
 // in case of endYear not provided, this option adds 10 years to the current year
 options.addYearsToCurrent = 10
// deduces endYear from current year plus 10 years
 var dateTime = RandomDate.withRangeAndOptions(1980,2000,options).random();
 ```

 ```dart
 var randomDate = RandomDate();
 var options = RandomDateOptions();
 // while generating dates, excludes leap year, until a non leap year is found, we keep generating
// dates.
 options.excludeLeapYear = true
 var dateTime = RandomDate.withStartYear(1980).random();
 ```

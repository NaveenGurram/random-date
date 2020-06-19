import 'package:random_date/random_date.dart';
import 'package:test/test.dart';

void main() {
  group('RandomDates', () {
    RandomDate randomDate;
    RandomDateOptions randomDateOptions;
    setUp(() {
      randomDate = RandomDate();
      randomDateOptions = RandomDateOptions();
    });

    test('justWithStartDate', () {
      randomDate.generateRandomDate(1980).year > 1980;
    });

    test('justWithStartDateAndAssertReturnedDate', () {
      var randomDateTime = randomDate.generateRandomDate(1980);
      // when end date is not provided, we add +5 to current so date returned
      // has to be less than 2025 and greater than 1980
      var returnedYear = randomDateTime.year;
      returnedYear > 1980 && returnedYear < 2025;
    });

    test('withBothStartAndEndDate', () {
      var randomDateTime = randomDate.generateRandomDate(1980, 2010);
      randomDateTime.year > 1980 && randomDateTime.year < 2010;
    });

    test('withBothDatesAndExcludeLeapYears', () {
      randomDateOptions.excludeLeapYear = true;
      var randomDateTime =
          randomDate.generateRandomDate(2001, 2001, randomDateOptions);
      randomDateTime.year == 2000;
    });

    test('testReturnedYearIsValid', () {
      randomDateOptions.excludeLeapYear = true;
      var randomDateTime =
          randomDate.generateRandomDate(1981, 2020, randomDateOptions);
      var output = DateTime.tryParse(randomDateTime.toIso8601String());
      output != null;
    });

    test('withBothDatesAndExcludeLeapYearsWithLeapYearExpectError', () {
      randomDateOptions.excludeLeapYear = true;
      expect(
          () => randomDate.generateRandomDate(2000, 2000, randomDateOptions),
          throwsA(allOf(
              isArgumentError,
              predicate((e) =>
                  e.message ==
                  'Start and End year cannot be same when leap years are excluded'))));
    });

    test('withEndYearLessThanStartYear', () {
      expect(
          () => randomDate.generateRandomDate(2000, 200),
          throwsA(allOf(
              isArgumentError,
              predicate((e) =>
                  e.message == 'Start year cannot be less then End year'))));
    });
  });
}

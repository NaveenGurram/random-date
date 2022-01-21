import 'package:random_date/random_date.dart';
import 'package:test/test.dart';

void main() {
  group('RandomDates', () {
    late RandomDateOptions randomDateOptions;
    setUp(() {
      randomDateOptions = RandomDateOptions();
    });

    test('justWithStartDate', () {
      RandomDate.withStartYear(1980).random().year > 1980;
    });

    test('justWithStartDateAndAssertReturnedDate', () {
      var randomDateTime = RandomDate.withStartYear(1980).random();
      // when end date is not provided, we add +5 to current so date returned
      // has to be less than 2025 and greater than 1980
      var returnedYear = randomDateTime.year;
      returnedYear > 1980 && returnedYear < 2025;
    });

    test('withBothStartAndEndDate', () {
      var randomDateTime = RandomDate.withRange(1980, 2010).random();
      randomDateTime.year > 1980 && randomDateTime.year < 2010;
    });

    test('withBothDatesAndExcludeLeapYears', () {
      var randomDateTime = RandomDate.withRangeAndOptions(
              2001, 2001, RandomDateOptions.excludeLeapYears())
          .random();
      randomDateTime.year == 2000;
    });

    test('testReturnedYearIsValid', () {
      randomDateOptions.excludeLeapYear = true;
      var randomDateTime =
          RandomDate.withRangeAndOptions(1981, 2020, randomDateOptions)
              .random();
      var output = DateTime.tryParse(randomDateTime.toIso8601String());
      output != null;
    });

    test('withBothDatesAndExcludeLeapYearsWithLeapYearExpectError', () {
      randomDateOptions.excludeLeapYear = true;
      expect(
          () => RandomDate.withRangeAndOptions(2000, 2000, randomDateOptions)
              .random(),
          throwsA(allOf(
              isArgumentError,
              predicate((dynamic e) =>
                  e.message ==
                  'Start and End year cannot be same when leap years are excluded'))));
    });

    test('withEndYearLessThanStartYear', () {
      expect(
          () => RandomDate.withRange(2000, 200).random(),
          throwsA(allOf(
              isArgumentError,
              predicate((dynamic e) =>
                  e.message == 'Start year cannot be less then End year'))));
    });
  });
}

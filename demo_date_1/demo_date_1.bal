type Date record {|
    int year;
    int month;
    int day;
|};

const cumulativeDays = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365];

public function getDateAfterWeeks(string dateString, int weeks, int days) returns string|error {
    Date date = check convertStringDateToRecord(dateString);
    int givenDateCumulative = cumulativeDays[date.month - 1] + date.day;
    int totalDaysToBeAdded = weeks * 7 + days;
    int newDateCumulative = givenDateCumulative + totalDaysToBeAdded;
    int month = getMonthOfCumulativeDay(newDateCumulative);
    return string `${date.year}-${month}-${newDateCumulative - cumulativeDays[month - 1]}`;
}

function getMonthOfCumulativeDay(int day) returns int {
    int month = 1;
    while cumulativeDays[month] < day {
        month += 1;
    }
    return month;
}

function convertStringDateToRecord(string dateString) returns Date|error {
    string:RegExp pattern = re `-`;
    string[] parts = pattern.split(dateString);
    if parts.length() != 3 {
        return error("Invalid date format");
    }
    return {
        year: check int:fromString(parts[0]),
        month: check int:fromString(parts[1]),
        day: check int:fromString(parts[2])
    };
}

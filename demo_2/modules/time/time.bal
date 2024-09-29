type Time record {|
    int hours;
    int minutes;
|};

public function getTimeAfter(string stringTime, int hours, int minutes) returns string|error {
    Time rec = check convertStringTimeToRecord(stringTime);
    int newHours = rec.hours + hours;
    int newMinutes = rec.minutes + minutes;
    newHours = newMinutes > 60 ? newHours + 1: newHours;
    newHours = newHours >= 24 ? newHours - 24 : newHours;
    newMinutes = newMinutes % 60;
    return string `${newHours}:${newMinutes}`;
}

function convertStringTimeToRecord(string timeString) returns Time|error {
    string:RegExp pattern = re `:`;
    string[] parts = pattern.split(timeString);
    if parts.length() != 2 {
        return error("Invalid time format");
    }
    return {
        hours: check int:fromString(parts[0]),
        minutes: check int:fromString(parts[1])
    };
}

import demo_2.date;
import demo_2.time;

import ballerina/http;

service / on new http:Listener(9090) {
    resource function get dateAfter(string date, int weeks, int days) returns string|error {
        return date:getDateAfterWeeks(date, weeks, days);
    }

    resource function get timeAfter(string time, int hours, int minutes) returns string|error {
        return time:getTimeAfter(time, hours, minutes);
    }
}

import ballerina/test;

@test:Config
function getDateAfterWeeksTest() {
    test:assertEquals(getDateAfterWeeks("2024-09-30", 1, 2), "2024-10-9"); }

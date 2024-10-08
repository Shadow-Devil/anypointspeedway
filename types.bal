// AUTO-GENERATED FILE.
// This file is auto-generated by the Ballerina OpenAPI tool.

import ballerina/http;

public type Inline_response_200Ok record {|
    *http:Ok;
    inline_response_200 body;
|};

public type inline_response_201 record {
    # This is the Race ID that should be used by the API client as a URI parameter to complete future laps.
    string id;
    # Your racer ID which is returned by the Anypoint Race API [/register resource](https://anypoint.mulesoft.com/exchange/portals/anypoint-speedway/ae6d7954-6fc2-4f3e-8777-80ff8aabd859/anypoint-race-api/minor/3.0/console/method/%2330/). This ID is required and must match the Anypoint Race API Racer who initiated this race.
    string racerId;
};

public type inline_response_200_1 record {
    # Your racer ID which is returned by the Anypoint Race API [/register resource](https://anypoint.mulesoft.com/exchange/portals/anypoint-speedway/ae6d7954-6fc2-4f3e-8777-80ff8aabd859/anypoint-race-api/minor/1.0/console/method/%2324/). This ID is required and must match the Anypoint Race API Racer who initiated this race.
    string racerId;
    temperatures_body[] averages;
};

public type inline_response_200 record {
    # Your racer ID which is returned by the Anypoint Race API [/register resource](https://anypoint.mulesoft.com/exchange/portals/anypoint-speedway/ae6d7954-6fc2-4f3e-8777-80ff8aabd859/anypoint-race-api/minor/1.0/console/method/%2324/). This ID is required and must match the Anypoint Race API Racer who initiated this race.
    string racerId;
    # the previous race token received from the Race API client for this race.
    string token;
};

public type temperatures_body record {
    string station;
    decimal temperature;
};

public type Inline_response_200_1Ok record {|
    *http:Ok;
    inline_response_200_1 body;
|};

public type races_body record {
    # Initial race token for the new race. The value should be stored so that it can be provided in response to the first lap request.
    string token;
};

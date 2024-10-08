// AUTO-GENERATED FILE.
// This file is auto-generated by the Ballerina OpenAPI tool.

import ballerina/http;
import ballerina/uuid;

configurable string racerId = ?;
configurable string clientId = ?;
configurable string clientSecret = ?;

listener http:Listener ep0 = new (9090);

final table<record {|readonly string id; string token;|}> key(id) tokens = table [];

service / on ep0 {
    //'client:Client racerClient = check new (serviceUrl = " https://api.anypointspeedway.com/race", config = {auth: {username: clientId, password: clientSecret}});

    function init() returns error? {
    }

    # + return - Race started 
    resource function post races(@http:Payload races_body payload) returns inline_response_201 {
        string id = uuid:createRandomUuid();
        tokens.add({id: id, token: payload.token});
        return {id: id, racerId: racerId};
    }

    # + id - Race ID that was returned in the response from POST /races
    # + return - returns can be any of following types 
    # http:NotFound (Race ID not found)
    resource function post races/[string id]/laps(@http:Payload string payload) returns Inline_response_200Ok|http:NotFound {
        var entry = tokens[id];
        if entry == () {
            return http:NOT_FOUND;
        }
        tokens.put({id: id, token: payload});
        
        return <Inline_response_200Ok>{body: {racerId: racerId, token: entry.token}};
    }

    # Accepts a JSON containing up to 1 billion temperature measurements, and returns average temperatures, alphabetized by location.
    # 
    # This is a RESTful API adaptation of Gunnar Morling's One Billion Row Challenge at https://github.com/gunnarmorling/1brc. That code is licensed under the Apache 2.0 license.
    #
    # + Content\-Encoding - The client MAY send the payload compressed using gzip compression, and your racer will need to decompress it if this header is present and has the value "gzip"
    resource function post temperatures(@http:Header string? content\-encoding, @http:Payload temperatures_body[] payload) returns Inline_response_200_1Ok|error {
        var response = from var {temperature, station} in payload
            group by station
            order by station
            select {station: station, temperature: avg(temperature).round(5)};
        
        return <Inline_response_200_1Ok>{body: {racerId: racerId, averages: response}};
    }
}

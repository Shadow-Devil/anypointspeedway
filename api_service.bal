// AUTO-GENERATED FILE.
// This file is auto-generated by the Ballerina OpenAPI tool.

import ballerina/http;
import ballerina/uuid;

listener http:Listener ep0 = new (9090);

final map<string> tokens = {};

service / on ep0 {
    # + return - Race started 
    resource function post races(@http:Payload races_body payload) returns inline_response_201 {
        string id = uuid:createRandomUuid();
        tokens[payload.token] = id;
        return {id: id, racerId: payload.token};
    }

    # + id - Race ID that was returned in the response from POST /races
    # + return - returns can be any of following types 
    # http:NotFound (Race ID not found)
    resource function post races/[string id]/laps(@http:Payload string payload) returns Inline_response_200Ok|http:NotFound {
        if tokens[id] == () {
            return http:NOT_FOUND;
        }
        
        return {body: {racerId: id, token: tokens[id]}};
    }

    # Accepts a JSON containing up to 1 billion temperature measurements, and returns average temperatures, alphabetized by location.
    # 
    # This is a RESTful API adaptation of Gunnar Morling's One Billion Row Challenge at https://github.com/gunnarmorling/1brc. That code is licensed under the Apache 2.0 license.
    #
    # + Content\-Encoding - The client MAY send the payload compressed using gzip compression, and your racer will need to decompress it if this header is present and has the value "gzip"
    resource function post temperatures(@http:Header string? content\-encoding, @http:Payload temperatures_body[] payload) returns Inline_response_200_1Ok|error {
        return error("Not implemented");
    }
}

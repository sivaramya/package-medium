// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/mime;
import ballerina/http;

documentation {Medium client connector
    F{{httpClient}} - The HTTP Client
}
public type MediumConnector object {
    public {
        http:Client httpClient = new;
    }

    documentation {Get Profile Information
        R{{}} - Data object on success and MediumError on failure
    }
    public function getProfileInfo() returns Data[]|MediumError;

    documentation {Get List of Publications the user have contributed
        P{{userId}} - A unique identifier for the user
        R{{}} - PublishedData object on success and MediumError on failure
    }
    public function getPublications(string userId) returns PublishedData[]|MediumError;

    documentation {Get List of Contributors for a Publication
        P{{publicationId}} - ID of relevant publication
        R{{}} - Contributers object on success and MediumError on failure
    }
    public function getContributors(string publicationId) returns Contributers[]|MediumError;

    documentation {Get List of Contributors for a Publication
        P{{userId}} - A unique identifier for the user
        P{{payload}} - Json payload containing the post
        R{{}} - ProfilePost object on success and MediumError on failure
    }
    public function createProfilePost(string userId, json payload) returns ProfilePost[] |MediumError;

    documentation {Get List of Contributors for a Publication
        P{{publicationId}} - ID of relevant publication
        P{{payload}} - Json payload containing the post
        R{{}} - PublicationPost object on success and MediumError on failure
    }
    public function createPublicationPost(string publicationId, json payload) returns PublicationPost[] |MediumError;
};


public function MediumConnector::getProfileInfo() returns Data[] |MediumError {
    endpoint http:Client httpClient = self.httpClient;
    http:Request request = new;
    Data[] mediumResponse = [];
    MediumError mediumError = {};
    var httpResponse = httpClient->get(PROFILE_PATH, request = request);
    match httpResponse {
        error err => {
            mediumError.message = err.message;
            mediumError.cause = err.cause;
            return mediumError;
        }
        http:Response response => {
            int statusCode = response.statusCode;
            var mediumJSONResponse = response.getJsonPayload();
            match mediumJSONResponse {
                error err => {
                    mediumError.message = "Error occured while extracting Json Payload";
                    mediumError.cause = err.cause;
                    return mediumError;
                }
                json jsonResponse => {
                    if (statusCode == http:OK_200) {
                        mediumResponse = convertToProfileDatas(jsonResponse);
                        return mediumResponse;
                    } else {
                        mediumError.message = jsonResponse["errors"].toString();
                        mediumError.statusCode = statusCode;
                        return mediumError;
                    }
                }
            }
        }
    }
}

public function MediumConnector::getPublications(string userId) returns PublishedData[] | MediumError {
    endpoint http:Client httpClient = self.httpClient;
    http:Request request = new;
    PublishedData[] mediumResponse = [];
    MediumError mediumError = {};
    string getPublicationsPath = USERS_PATH + userId + PUBLICATIONS;
    var httpResponse = httpClient->get(getPublicationsPath, request = request);
    match httpResponse {
        error err => {
            mediumError.message = err.message;
            mediumError.cause = err.cause;
            return mediumError;
        }
        http:Response response => {
            int statusCode = response.statusCode;
            var mediumJSONResponse = response.getJsonPayload();
            match mediumJSONResponse {
                error err => {
                    mediumError.message = "Error occured while extracting Json Payload";
                    mediumError.cause = err.cause;
                    return mediumError;
                }
                json jsonResponse => {
                    if (statusCode == http:OK_200) {
                        mediumResponse = convertToPublishedDatas(jsonResponse["data"]);
                        return mediumResponse;
                    } else {
                        mediumError.message = jsonResponse["errors"].toString();
                        mediumError.statusCode = statusCode;
                        return mediumError;
                    }
                }
            }
        }
    }
}

public function MediumConnector::getContributors(string publicationId) returns Contributers[] | MediumError {
    endpoint http:Client httpClient = self.httpClient;
    http:Request request = new;
    Contributers[] mediumResponse = [];
    MediumError mediumError = {};
    string getContributorsPath = PUBLICATION_PATH + publicationId + CONTRIBUTERS;
    var httpResponse = httpClient->get(getContributorsPath, request = request);
    match httpResponse {
        error err => {
            mediumError.message = err.message;
            mediumError.cause = err.cause;
            return mediumError;
        }
        http:Response response => {
            int statusCode = response.statusCode;
            var mediumJSONResponse = response.getJsonPayload();
            match mediumJSONResponse {
                error err => {
                    mediumError.message = "Error occured while extracting Json Payload";
                    mediumError.cause = err.cause;
                    return mediumError;
                }
                json jsonResponse => {
                    if (statusCode == http:OK_200) {
                        mediumResponse = convertToContributers(jsonResponse["data"]);
                        return mediumResponse;
                    } else {
                        mediumError.message = jsonResponse["errors"].toString();
                        mediumError.statusCode = statusCode;
                        return mediumError;
                    }
                }
            }
        }
    }
}

public function MediumConnector::createProfilePost(string userId, json payload) returns ProfilePost[] | MediumError {
    endpoint http:Client httpClient = self.httpClient;
    http:Request request = new;
    ProfilePost[] profilePostResponse = [];
    MediumError mediumError = {};
    request.setJsonPayload(payload);
    string  createProfilePostPath = USERS_PATH + userId + POSTS;
    var httpResponse = httpClient->post(createProfilePostPath, request = request);
    match httpResponse {
        error err => {
            mediumError.message = err.message;
            mediumError.cause = err.cause;
            return mediumError;
        }
        http:Response response => {
            int statusCode = response.statusCode;
            var profileJSONResponse = response.getJsonPayload();
            match profileJSONResponse {
                error err => {
                    mediumError.message = "Error occured while extracting Json Payload";
                    mediumError.cause = err.cause;
                    return mediumError;
                }
                json jsonResponse => {
                    if (statusCode == 201) {
                        profilePostResponse = convertToProfilePost(jsonResponse);
                        return profilePostResponse;
                    } else {
                        mediumError.message = jsonResponse["errors"].toString();
                        mediumError.statusCode = statusCode;
                        return mediumError;
                    }
                }
            }
        }
    }
}

public function MediumConnector::createPublicationPost(string publicationId, json payload) returns PublicationPost[] | MediumError {
    endpoint http:Client httpClient = self.httpClient;
    http:Request request = new;
    PublicationPost[] profilePostResponse = [];
    MediumError mediumError = {};
    request.setJsonPayload(payload);
    string  createPublicationPostPath = PUBLICATION_PATH + publicationId + POSTS;
    var httpResponse = httpClient->post(createPublicationPostPath, request = request);
    match httpResponse {
        error err => {
            mediumError.message = err.message;
            mediumError.cause = err.cause;
            return mediumError;
        }
        http:Response response => {
            int statusCode = response.statusCode;
            var profileJSONResponse = response.getJsonPayload();
            match profileJSONResponse {
                error err => {
                    mediumError.message = "Error occured while extracting Json Payload";
                    mediumError.cause = err.cause;
                    return mediumError;
                }
                json jsonResponse => {
                    if (statusCode == 201) {
                        profilePostResponse = convertToPublicationPost(jsonResponse);
                        return profilePostResponse;
                    } else {
                        mediumError.message = jsonResponse["errors"].toString();
                        mediumError.statusCode = statusCode;
                        return mediumError;
                    }
                }
            }
        }
    }
}

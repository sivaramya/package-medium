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

import ballerina/config;
import ballerina/io;
import ballerina/test;

string accessToken = config:getAsString("ACCESS_TOKEN");
string clientId = config:getAsString("CLIENT_ID");
string clientSecret = config:getAsString("CLIENT_SECRET");
string refreshToken = config:getAsString("REFRESH_TOKEN");
string userId = config:getAsString("USER_ID");
string publicationId = config:getAsString("PUBLICATION_ID");

endpoint Client mediumClient {
    clientConfig:{
        auth:{
            accessToken:accessToken,
            refreshToken:refreshToken,
            clientId:clientId,
            clientSecret:clientSecret
        }
    }
};

@test:Config
function testGetProfileInfo() {
    io:println("-----------------Test case for getProfileInfo method------------------");
    var profileDetails = mediumClient->getProfileInfo();

    match profileDetails {
        Data[] response => {
            test:assertNotEquals(response, null, msg = "Failed to call getProfileInfo()");
        }
        MediumError err => {
            test:assertFail(msg = err.message);
        }
    }
}

@test:Config
function testGetPublications() {
    io:println("-----------------Test case for getPublications method------------------");
    var publicationDetails = mediumClient->getPublications(userId);

    match publicationDetails {
        PublishedData[] response => {
            test:assertNotEquals(response, null, msg = "Failed to call getPublications()");
        }
        MediumError err => {
            test:assertFail(msg = err.message);
        }
    }
}

@test:Config
function testGetContributors() {
    io:println("-----------------Test case for getContributors method------------------");
    var contributorsDetails = mediumClient->getContributors(publicationId);

    match contributorsDetails {
        Contributers[] response => {
            test:assertNotEquals(response, null, msg = "Failed to call getContributors()");
        }
        MediumError err => {
            test:assertFail(msg = err.message);
        }
    }
}

@test:Config
function testCreateProfilePost() {
    io:println("-----------------Test case for createProfilePost method------------------");
    json payload = {"title": "Testing",
        "contentFormat": "html",
        "content": "<h1>Liverpool FC</h1><p>You’ll never walk alone.</p>",
        "canonicalUrl": "http://jamietalbot.com/posts/liverpool-fc",
        "tags": ["football", "sport", "Liverpool"],
        "publishStatus": "public"};
    var profilePostDetails = mediumClient->createProfilePost(userId, payload);
    match profilePostDetails {
        ProfilePost[] response => {
            test:assertNotEquals(response, null, msg = "Failed to call createProfilePost()");
        }
        MediumError err => {
            test:assertFail(msg = err.message);
        }
    }
}

@test:Config
function testCreatePubicationPost() {
    io:println("-----------------Test case for createPublicationPost method------------------");
    json payload = { "title": "Hard things in software development", "contentFormat": "html",
        "content": "<p>Cache invalidation</p><p>Naming things</p>", "tags": ["development", "design"],
        "publishStatus": "draft"};
    var publicationPostDetails = mediumClient->createPublicationPost(publicationId, payload);
    match publicationPostDetails {
        PublicationPost[] response => {
            test:assertNotEquals(response, null, msg = "Failed to call createPublicationPost()");
        }
        MediumError err => {
            test:assertFail(msg = err.message);
        }
    }
}


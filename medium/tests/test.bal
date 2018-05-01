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
            io:println(response);
            test:assertNotEquals(response, null, msg = "Failed to call getService()");
        }
        MediumError err => {
            io:println(err.message);
            test:assertFail(msg = err.message);
        }
    }
}

//@test:Config
//function testGetPublications() {
//    io:println("-----------------Test case for getPublications method------------------");
//    var profileDetails = mediumClient->getPublications("15fc867f3caf0265534d858ecda098");
//
//    match profileDetails {
//        PublishedData[] response => {
//            io:println(response);
//            test:assertNotEquals(response, null, msg = "Failed to call getPublications()");
//        }
//        MediumError err => {
//            io:println(err.message);
//            test:assertFail(msg = err.message);
//        }
//    }
//}
//
//@test:Config
//function testGetContributors() {
//    io:println("-----------------Test case for getContributors method------------------");
//    var profileDetails = mediumClient->getContributors("b45573563f5a");
//
//    match profileDetails {
//        Contributers[] response => {
//            io:println(response);
//            test:assertNotEquals(response, null, msg = "Failed to call getContributors()");
//        }
//        MediumError err => {
//            io:println(err.message);
//            test:assertFail(msg = err.message);
//        }
//    }
//}

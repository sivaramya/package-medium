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

function convertToProfileDatas(json jsonDatas) returns Data[] {
    int i = 0;
    Data[] data = [];
    foreach jsonData in jsonDatas {
        data[i] = convertToProfileData(jsonData);
        i = i + 1;
    }
    return data;
}

function convertToProfileData(json jsonData) returns Data {
    Data data = {};
    data.id = jsonData.id != null ? jsonData.id.toString() : "";
    data.userName = jsonData.username != null ? jsonData.username.toString() : "";
    data.name = jsonData.name != null ? jsonData.name.toString() : "";
    data.url = jsonData.url != null ? jsonData.url.toString() : "";
    data.imageUrl = jsonData.imageUrl != null ? jsonData.imageUrl.toString() : "";
    return data;
}

function convertToPublishedDatas(json jsonDatas) returns PublishedData[] {
    int i = 0;
    PublishedData[] data = [];
    foreach jsonData in jsonDatas {
        data[i] = convertToPublishedData(jsonData);
        i = i + 1;
    }
    return data;
}

function convertToPublishedData(json jsonData) returns PublishedData {
    PublishedData data = {};
    data.id = jsonData.id != null ? jsonData.id.toString() : "";
    data.name = jsonData.name != null ? jsonData.name.toString() : "";
    data.description = jsonData.description != null ? jsonData.description.toString() : "";
    data.url = jsonData.url != null ? jsonData.url.toString() : "";
    data.imageUrl = jsonData.imageUrl != null ? jsonData.imageUrl.toString() : "";
    return data;
}

function convertToContributers(json jsonDatas) returns Contributers[] {
    int i = 0;
    Contributers[] data = [];
    foreach jsonData in jsonDatas {
        data[i] = convertToContributer(jsonData);
        i = i + 1;
    }
    return data;
}

function convertToContributer(json jsonData) returns Contributers {
    Contributers data = {};
    data.publicationId = jsonData.publicationId != null ? jsonData.publicationId.toString() : "";
    data.userId = jsonData.userId != null ? jsonData.userId.toString() : "";
    data.role = jsonData.role != null ? jsonData.role.toString() : "";
    return data;
}
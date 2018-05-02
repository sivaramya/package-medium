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

function convertToProfilePost(json jsonDatas) returns ProfilePost[] {
    int i = 0;
    ProfilePost[] data = [];
    foreach jsonData in jsonDatas {
        data[i] = convertToPost(jsonData);
        i = i + 1;
    }
    return data;
}

function convertToPost(json jsonData) returns ProfilePost {
    ProfilePost data = {};
    data.id = jsonData.id != null ? jsonData.id.toString() : "";
    data.title = jsonData.title != null ? jsonData.title.toString() : "";
    data.authorId = jsonData.authorId != null ? jsonData.authorId.toString() : "";
    data.url = jsonData.url != null ? jsonData.url.toString() : "";
    data.canonicalUrl = jsonData.canonicalUrl != null ? jsonData.canonicalUrl.toString() : "";
    data.publishStatus = jsonData.publishStatus != null ? jsonData.publishStatus.toString() : "";
    data.publishedAt = jsonData.publishedAt != null ? convertToInt(jsonData.publishedAt) : 0;
    data.license = jsonData.license != null ? jsonData.license.toString() : "";
    data.licenseUrl = jsonData.licenseUrl != null ? jsonData.licenseUrl.toString() : "";
    data.tags = jsonData.tags != null ? convertToArray(jsonData.tags) : [];
    return data;
}

function convertToPublicationPost(json jsonDatas) returns PublicationPost[] {
    int i = 0;
    PublicationPost[] data = [];
    foreach jsonData in jsonDatas {
        data[i] = convertToPublication(jsonData);
        i = i + 1;
    }
    return data;
}

function convertToPublication(json jsonData) returns PublicationPost {
    PublicationPost data = {};
    data.id = jsonData.id != null ? jsonData.id.toString() : "";
    data.title = jsonData.title != null ? jsonData.title.toString() : "";
    data.authorId = jsonData.authorId != null ? jsonData.authorId.toString() : "";
    data.url = jsonData.url != null ? jsonData.url.toString() : "";
    data.canonicalUrl = jsonData.canonicalUrl != null ? jsonData.canonicalUrl.toString() : "";
    data.publishStatus = jsonData.publishStatus != null ? jsonData.publishStatus.toString() : "";
    data.publicationId = jsonData.publicationId != null ? jsonData.publicationId.toString() : "";
    data.license = jsonData.license != null ? jsonData.license.toString() : "";
    data.licenseUrl = jsonData.licenseUrl != null ? jsonData.licenseUrl.toString() : "";
    data.tags = jsonData.tags != null ? convertToArray(jsonData.tags) : [];
    return data;
}

function convertToInt(json jsonVal) returns int {
    string stringVal = jsonVal.toString();
    if (stringVal != "") {
        return check <int>stringVal;
    } else {
        return 0;
    }
}

function convertToArray(json jsonValues) returns string[] {
    string[] tags = [];
    int i = 0;
    foreach jsonVal in jsonValues {
        tags[i] = jsonVal.toString();
        i = i + 1;
    }
    return tags;
}

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

documentation {Struct to define the Data
    F{{id}} A unique identifier for the user
    F{{userName}} The user’s username on Medium
    F{{name}} The user’s name on Medium
    F{{url}} The URL to the user’s profile on Medium
    F{{imageUrl}} The URL to the user’s avatar on Medium
}
public type Data {
    string id;
    string userName;
    string name;
    string url;
    string imageUrl;
};

documentation {Struct to define the PublishedData
    F{{id}} A unique identifier for the user
    F{{name}} The user’s name on Medium
    F{{url}} The URL to the user’s profile on Medium
    F{{imageUrl}} The URL to the user’s avatar on Medium
    F{{description}} Short description of the publication
}
public type PublishedData {
    string id;
    string name;
    string url;
    string imageUrl;
    string description;
};

documentation {Struct to define the Contributers
    F{{publicationId}} An ID for the publication
    F{{userId}} A user ID of the contributor
    F{{role}} Role of the user identified by userId
}
public type Contributers {
    string publicationId;
    string userId;
    string role;
};

documentation {Struct to define the ProfilePost
    F{{id}} A unique identifier for the post
    F{{title}} The post’s title
    F{{authorId}} The userId of the post’s author
    F{{url}} The URL of the post on Medium
    F{{canonicalUrl}} The canonical URL of the post
    F{{publishStatus}} The publish status of the post
    F{{publishedAt}} The post’s published date
    F{{license}} The license of the post
    F{{licenseUrl}} The URL to the license of the post
    F{{tags}} The post’s tags
}
public type ProfilePost {
    string id;
    string title;
    string authorId;
    string url;
    string canonicalUrl;
    string publishStatus;
    int publishedAt;
    string license;
    string licenseUrl;
    string[] tags;
};

documentation {Struct to define the PublicationPost
    F{{id}} A unique identifier for the post
    F{{title}} The post’s title
    F{{authorId}} The userId of the post’s author
    F{{url}} The URL of the post on Medium
    F{{canonicalUrl}} The canonical URL of the post
    F{{publishStatus}} The publish status of the post
    F{{publicationId}} ID of the publication
    F{{license}} The license of the post
    F{{licenseUrl}} The URL to the license of the post
    F{{tags}} The post’s tags
}
public type PublicationPost {
    string id;
    string title;
    string authorId;
    string url;
    string canonicalUrl;
    string publishStatus;
    string publicationId;
    string license;
    string licenseUrl;
    string[] tags;
};

documentation {Struct to define the error
    F{{message}} - Error message of the response
    F{{cause}} - The error which caused the Medium error
    F{{statusCode}} - The status code
}
public type MediumError {
    string message;
    error? cause;
    int statusCode;
};
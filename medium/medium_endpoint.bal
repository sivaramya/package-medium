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

import ballerina/http;

documentation {MediumConfiguration is used to set up the Medium configuration. In order to use
this connector, you need to provide the oauth2 credentials.
    F{{clientConfig}} - The HTTP client congiguration
}
public type MediumConfiguration {
    http:ClientEndpointConfig clientConfig = {};
};

documentation {Medium Endpoint object.
    E{{}}
    F{{mediumConfig}} - Medium client endpoint configuration object
    F{{mediumConnector}} - Medium connector object
}
public type Client object {
    public {
        MediumConfiguration mediumConfig = {};
        MediumConnector mediumConnector = new;
    }

    documentation {Medium endpoint initialization function
        P{{mediumConfig}} - Medium client endpoint configuration object
    }
    public function init(MediumConfiguration mediumConfig);

    documentation {Get Medium connector client
        R{{}} - Medium connector client
    }
    public function getCallerActions() returns MediumConnector;
};

public function Client::init(MediumConfiguration mediumConfig) {
    mediumConfig.clientConfig.url = BASE_URL;
    match mediumConfig.clientConfig.auth {
        () => {}
        http:AuthConfig authConfig => {
            authConfig.refreshUrl = REFRESH_URL;
            authConfig.scheme = SCHEME;
        }
    }
    self.mediumConnector.httpClient.init(mediumConfig.clientConfig);
}

public function Client::getCallerActions() returns MediumConnector {
    return self.mediumConnector;
}
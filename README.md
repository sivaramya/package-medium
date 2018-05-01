Connects to Medium from Ballerina.

# Package Overview

The Medium connector allows you to get Profile Information, List of Publications the user have 
contributed, List of Contributors for a Publication REST API.
It handles OAuth 2.0 authentication.

**Profile Operations**

The `wso2/medium` package contains operations that retrieve the profile information.

**Publication Operations**

The `wso2/medium` package contains operations to get List of Publications the user have contributed and the List of 
Contributors for a Publication. 

## Compatibility

|                                 |       Version                  |
|  :---------------------------:  |  :---------------------------: |
|  Ballerina Language             |   0.970.0                      |
|  Medium API         |   V4                           |

## Sample

First, import the `wso2/medium` package into the Ballerina project.

```ballerina
import wso2/medium;
```

Instantiate the connector by giving authentication details in the HTTP client config. The Medium 
connector can be minimally instantiated in the HTTP client config using the access token or the client ID, client secret, and refresh token.

**Obtaining Tokens to Run the Sample**

1. Visit [Medium](https://medium.com/me/applications), and register an application and then you will get an clientId and a clientSecret with which you may access Medium’s API
project.
2. Visit [Medium Api Document](https://medium.com/me/applications), and get the access token and refresh token.

You can now enter the credentials in the HTTP client config:
```ballerina
endpoint medium:Client mediumClient {
    clientConfig:{
        auth:{
            accessToken:accessToken,
            clientId:clientId,
            clientSecret:clientSecret,
            refreshToken:refreshToken
        }
    }
};
```

The `getProfileInfo` function retrieve the profile information.
```ballerina
var profileDetails = mediumClient->getProfileInfo();
```

The `getPublications` function retrieve the List of Publications the user have contributed.
```ballerina
var PublicationDetails = mediumClient->getPublications(userId);
```
The `getPublications` function retrieve the List of Contributors for a Publication.
```ballerina
var contributorsDetails = mediumClient->getContributors(publicationId);
```# package-medium

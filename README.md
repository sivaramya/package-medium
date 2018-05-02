# Ballerina Medium Endpoint

The Medium connector allows you to get Profile Information, the list of Publications the user have 
contributed, the list of Contributors for a Publication through the Medium REST API. It also allows you to create a 
profile post and 
publication post.
It handles OAuth 2.0 authentication.

The following sections provide you with information on how to use the Ballerina Medium endpoint.
- [Compatibility](#compatibility)
- [Getting started](#getting-started)


### Compatibility

| Ballerina Language Version  | Medium API Version |
| ----------------------------| -------------------------------|
|  0.970.0                    |   V1                           |

##### Prerequisites
Download the ballerina [distribution](https://ballerinalang.org/downloads/).

##### Contribute To Develop
Clone the repository by running the following command
    `git clone https://github.com/sivaramya/package-medium.git`

## Working with Medium Endpoint actions
All the actions return valid response or MediumError. If the action is a success, then the requested resource will be 
returned. Else MediumError object will be returned.

In order for you to use the Medium Endpoint, first you need to create a Medium Client
endpoint.
```ballerina
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
```



#### Sample
```ballerina
    import wso2/medium;

    public function main (string[] args) {
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
```
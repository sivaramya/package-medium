## Compatibility

| Ballerina Language Version  | Medium API Version |
| ----------------------------| -------------------------------|
|  0.970.0                    |   V1                           |

### Prerequisites

1. Visit [Medium](https://medium.com/me/applications), and register an application.
2. Obtain the following parameters
    * Client Id
    * Client Secret
    * Redirect URI
    * Access Token
    * Refresh Token

    **IMPORTANT** This access token and refresh token can be used to make API requests on your own
    account's behalf. Do not share your access token, client  secret with anyone.

Visit [here](https://medium.com/me/applications) for more information on obtaining OAuth2 credentials.

## Running Samples
You can use the `tests.bal` file to test all the connector actions by following the below steps:
1. Create ballerina.conf file in package-medium.
2. Obtain the client Id, client secret, access token and refresh token as mentioned above and add those values in the ballerina.conf file.
    ```
    ACCESS_TOKEN="your_access_token"
    CLIENT_ID="your_client_id"
    CLIENT_SECRET="your_client_secret"
    REFRESH_TOKEN="your_refresh_token"
    USER_ID = "your_user_id"
    PUBLICATION_ID = "your_publication_id"
    ```
3. Navigate to the folder `package-medium`.
4. Run the following commands to execute the tests.
    ```
    ballerina init
    ballerina test medium --config ballerina.conf
    ```

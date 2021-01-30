# Messagere

Application for easy message exchange and chatting with members!
With this app, you will be able to send & receive messages among app members.
You can also chat with members without reloading the page each time.
* Messagere - Try to sign up and log in to start chatting with members.

## Built With

* [Le Wagon Devise Template](https://github.com/lewagon/rails-templates) - This template enables you to start with postgresql and devise gem installed. However, this has several limits for devise fuctions and you need to change codes in applicatio.rb if necessary. 
* [Omniauth](https://github.com/omniauth/omniauth) - For SNS sign up and login, used this gem together with [Omniauth for facebook](https://github.com/simi/omniauth-facebook) and [Omniauth for Google](https://github.com/zquestz/omniauth-google-oauth2)
* [Kaminari](https://github.com/kaminari/kaminari) - For pagination used Kaminari gem styled by [Bootsrap4 Kaminari](https://github.com/KamilDzierbicki/bootstrap4-kaminari-views)

## Getting Started

After you clone, make sure to set your mailer address to SMTP_USER_NAME and also Facebook & Google API keys in your local .env file.
```
SMTP_USER_NAME="********"
SMTP_PASSWD="*******"
FACEBOOK_CLIENT_ID='*******'
FACEBOOK_CLIENT_SECRET='******'
GOOGLE_CLIENT_ID='******'
GOOGLE_CLIENT_SECRET='******'
```

### Prerequisites

For Websocket, make sure to set

```
heroku addons:create rediscloud:30
```
if you deploy to heroku for your production.

## Messagere API

* GET

For fetching your conversations, you can make get request with
```
https://www.messagere.xyz/api/v1/conversations/<Conversation ID>
```
To check your conversation id, please check the URL of your conversation page with a member such as
```
https://www.messagere.xyz/conversations/<HERE>
```

* POST

For creating conversation and message, you will need to get your access token. 
To request for your access token, please send your message to 'Admin' through this application after you log in.
To make POST request for conversation,
```
curl -i -X POST                                                              \
     -H 'Content-Type: application/json'                                     \
     -H 'X-User-Email: YOUR_LOG_IN_EMAIL'                                      \
     -H 'X-User-Token: YOUR_TOKEN'                                 \
     -d '{ "conversation": { "starter_id": XX, "recipient_id": XX } }' \
     http://localhost:3000/api/v1/conversations
```

To make POST request for messages,
```
curl -i -X POST                                                              \
     -H 'Content-Type: application/json'                                     \
     -H 'X-User-Email: YOUR_LOG_IN_EMAIL'                                      \
     -H 'X-User-Token: YOUR_TOKEN'                                 \
     -d '{ "message": { "sender_id": XX, "content": "XXXX" } }' \
     http://localhost:3000/api/v1/conversations/:conversation_id/messages
```





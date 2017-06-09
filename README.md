[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Ski Trackr Api - Capstone

API for Ski Trackr site.

This project uses `express` as an API and includes user authentication and common middlewares including `mongoose`.

This API follows Rails-like conventions for organizing controller and
model code, and has a routing layer which is similar to the Rails routing DSL.

## Project Links

#### Front-End Ski-Trackr Client Application URL
-   [`Front-End Client URL`](https://rlarsonil71.github.io/ski-trackr-client/)

#### Heroku API URL
-   [`Heroku API URL`](https://protected-gorge-95856.herokuapp.com/)

#### GitHub Application Repositories
-   [`Front-End Client`](https://github.com/rlarsonil71/ski-trackr-client)
-   [`Back-End API`](https://github.com/rlarsonil71/ski-trackr-api/)

## Project Requirements
-   [`capstone-project`](https://github.com/ga-wdi-boston/capstone-project)

## Project Dependencies
-   [`browser-template`](https://github.com/ga-wdi-boston/browser-template)
-   [`ski-trackr-api`](https://github.com/ga-wdi-boston/ski-trackr-api)
-   [`express-api-template`](https://github.com/ga-wdi-boston/express-api-template)
-   [`express-api-deployment-guide`](https://github.com/ga-wdi-boston/express-api-deployment-guide)
-   [`heroku`](https://dashboard.heroku.com/apps)

## Dependencies

Install with `npm install`.

-   [`express`](http://expressjs.com/)
-   [`mongoose`](http://mongoosejs.com/)

## Installation

Install with:
 - `git push heroku master`
 - `heroku restart`
 - `heroku open`

## Structure

This API follows the standard API project structure in Express.

`curl` command scripts are stored in [`scripts`](scripts) with names that
correspond to API actions.

User authentication is built-in.

Dependencies are stored in [`package.json`](package.json).

- [`app/controllers`](app/controllers)
- [`app/models`](app/models)
- [`config/routes.js`](config/routes.js)

## ERD

![Alt text](/public/images/SkiTrackrAPIERD.jpg?raw=true "Ski Trackr ERD")

## Database Structures (Schemas)

 - [`tripSchema`](tripSchema)
   tripDate      - Date (Required)
   resort        - String (Required)
   equipmentType - String (Required)
   conditions    - String (Required)
   numberOfRuns  - Number (Required)
   favoriteRun   - String (Required)
   comments      - String (Required)

## API

Use this as the basis for your own API documentation. Add a new third-level
heading for your custom entities, and follow the pattern provided for the
built-in user authentication documentation.

Scripts are included in [`scripts`](scripts) to test built-in actions. Add your
own scripts to test your custom API.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl --include --request POST http://localhost:4741/sign-up \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password",
      "password_confirmation": "an example password"
    }
  }'
```

```sh
scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

#### POST /sign-in

Request:

```sh
curl --include --request POST http://localhost:4741/sign-in \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "an@example.email",
      "password": "an example password"
    }
  }'
```

```sh
scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "33ad6372f795694b333ec5f329ebeaaa"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH http://localhost:4741/change-password/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "an example password",
      "new": "super sekrit"
    }
  }'
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl --include --request DELETE http://localhost:4741/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl --include --request GET http://localhost:4741/users \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "another@example.email"
    },
    {
      "id": 1,
      "email": "an@example.email"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=33ad6372f795694b333ec5f329ebeaaa scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "another@example.email"
  }
}
```

### Trips Resource (VERB/URL Pattern/Controller#Action)

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/trips`               | `trips#create`    |
| GET    | `/trips/:id`           | `trips#show`      |
| GET    | `/usertrips/:id`       | `trips#indexUser` |
| PATCH  | `/trips/:id`           | `trips#update`    |
| DELETE | `/trips/:id`           | `trips#delete`    |

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
2.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.

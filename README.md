<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
</p>

## chat-api

How to use this api?

1. Clone this repo
2. `composer install`
3. `cp .env.example .env`
4. Create database and modify .env
5. `php artisan migrate`
6. `php artisan key:generate`
7. `php artisan jwt:secret`
8. `php artisan serve`
9. continue to watch postman documentation and implement it on your postman app!

NB: you can also use the provided sql database and import it to your own database. 

:raised_hands::collision:  Up and Running :collision::raised_hands::raised_hands:

### Important Endpoints

list of endpoints available 

#endpoint                       | #METHOD      | #information
-----------------------         | -------------| -----------------------
api/register                    | POST         | Register a new account
api/login                       | GET          | Login your account
api/logout                      | GET          | Logout 
api/refresh                     | GET          | Refresh JWT Token
api/whoami                      | GET          | check the current user
api/messages/with/{to_user_id}  | GET          | watch your certain conversation
api/messages/all/               | GET          | watch your all conversation with latest messages and unreadcount
api/messages/send/              | POST         | Open manage server


### License

Copyright (C) afaf-tech.id - All Rights Reserved
Unauthorized copying of this file, via any medium is strictly prohibited
Proprietary and confidential
Written by afaf-tech , August 2019

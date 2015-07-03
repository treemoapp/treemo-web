[![Build Status](https://travis-ci.org/treemoapp/treemo-web.svg?branch=master)](https://travis-ci.org/treemoapp/treemo-web)
[![Coverage Status](https://coveralls.io/repos/treemoapp/treemo-web/badge.svg)](https://coveralls.io/r/treemoapp/treemo-web)

# treemo-web

https://www.youtube.com/watch?v=GKo-Sh5F9QM

Contribute to global reforestation, one check-in at a time - web & mobile app @ Makers Academy - Final Project

Kanban board: https://waffle.io/treemoapp/treemo-web

Project planning: https://drive.google.com/folderview?id=0B2Rum2zEpwhgT1NJTGlJc05LV0E&usp=sharing

## Goals for app
- Raise awareness and funds for reforestation programs
- Leverage social media for social good

## Backlog

- [ ] Billing
- [ ] Stats
- [ ] Provide user data to business owners
- [ ] Additional integration - Twitter, Instagram etc
- [ ] Geofencing
- [ ] Scalability
- [ ] Sticker package logistics
- [ ] Responsive: mobile & tablet
- [ ] Customer feedback
- [ ] Location beacons
- [ ] FB 'Like our page'

## User personas

- [ ] Users - customer, business owner
- [ ] admin

## What's going to give?

|   |  LIKELY |   | MAYBE  |   | DEFINITELY NOT  |
|---|:---:|:---:|:---:|:---:|:---:|
|SCOPE  |   |   |   | X  |   |
|HOURS   |   |   | X  |   |   |
|TESTING/QUALITY   |   |   | X |  |   |
|TEAMWORK/PAIRING/COMMUNICATION   |   |   |   |   | X  |
|UX/DESIGN   |   |   |   | X |   |

## Tech stack - web
- Rails, Postgres, Angular
- Testing: Unit & Feature
- Bootstrap?
- Travis CI
- Coveralls
- Gitflow using feature branches

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* Ruby on Rails
* PSQL

### Project setup on local environment

```
git clone git@github.com:treemoapp/treemo-web.git
cd treemo-web
bundle
bin/rake db:create
rails s
```

Add the following ~/.bash_profile:

export TREEMO_APP_ID=''
export TREEMO_APP_SECRET=''

Actual IDs will be circulated within the team

Now visit http://localhost:3000/ in your browser!

#### Tests

```
bin/rake db:create RAILS_ENV=test
rspec
```

Seed Database

This creates 200 users and 200 locations:

```bin/rake db:seed```

Reset database:

```bin/rake db:reset```

## API Calls
### GET Locations

http://localhost:3000/locations.json?lat=5.09703679&lng=0.361858
Required parameters: lat, lng

### POST Checkin
http://localhost:3000/checkins.json
Required parameters: fb_location_id, fb_user_id

Request example via terminal:
```
$ curl -H 'Content-Type: application/json'  -X POST http://localhost:3000/checkins.json -d "{\"checkin\":{\"fb_user_id\":\"2215598518618201\", \"fb_location_id\":\"6028637512237347\"}}"

```
Expected response:
```
{"id":203,"user_id":25,"location_id":25}
```
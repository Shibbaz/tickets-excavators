Hello The solution is implemented using Postgis - Postgres extension for geospatial data, to store polygons in database
- [x] Installation postgis to your postgres database:
  - https://trac.osgeo.org/postgis/wiki/UsersWikiPostGIS3UbuntuPGSQLApt
- [x] Gems
  - bundle install
- [x] New Master.key
  - If you're asking if you can create a new config/master.key, yes.
  - Delete config/master.key and config/credentials.yml.enc. Then run rails credentials:edit and it will make a new key and encrypted credentials file.
- [x] Database creation
  - rails db:create
- [x] Database migration
  - rails db:migrate
- [x] Database seeds
  - rails db:seeds
- [x] Add credentials
  - Create account https://www.mapbox.com/ and generate api key
  - EDITOR=nano rails credentials:edit
  - add new line:
    - access_token: YOUR public access token from mapbox.com'
  - save
- [x] Running server
  - rails s
     
- [x] Posting Ticket
  - POST request
  - endpoint http://localhost:3000/tickets
  - must have all params from the json you provided me, there is sample json below
  - body
    - {"data": json}
      - replace json keyword with the content of the file  https://github.com/Shibbaz/tickets-excavators/blob/TASK-001/spec/ticket.json
- [x] Getting Ticket
  - GET request
  - http://localhost:3000/tickets/id
  - id can be found be Ticket.first.id, user rails c
  - replace id keyword with the found id
     
  - Sample usage
    

https://github.com/Shibbaz/tickets-excavators/assets/107750344/e10d375b-0773-44a4-8f16-0833016efd93

- [x] Testing
  - rspec
  - coverage 95%
  - request and model specs
  - repositories specs








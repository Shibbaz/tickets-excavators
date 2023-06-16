Hello The solution is implemented using Postgis - Postgres extension for geospatial data, to store polygons in database
- [x] Installation postgis to your postgres database:
  - https://trac.osgeo.org/postgis/wiki/UsersWikiPostGIS3UbuntuPGSQLApt
- [x] Gems
  - bundle install
- [x] Database creation
  - rails db:create
- [x] Database migration
  - rails db:migrate
- [x] Database seeds
  - rails db:seeds
- [x] Add MAPBOX_ACCESS_TOKEN to your env
  - Create account https://www.mapbox.com/ and generate api key
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








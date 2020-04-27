### Authors
[Robin Lillqvist](https://github.com/robin-lillqvist)  
[Emma-Maria Thalen](https://github.com/emtalen)  
[Johan Bons](https://github.com/johanbounce)  
[Karolina Frostare](https://github.com/kfrostare)  
[Anish Kanswal](https://github.com/Anish2504) 

## Built with
**Front End:** Rails 6.0.2.1 | Ruby 2.5.1   
**Testing framework:** Rspec   
**Deployed at:** [Heroku](https://grog-bot.herokuapp.com/).

## The code   
This was our midcourse project at Craft Academy. We used two external API's to create a website where the user can choose  virgin ingredient and get result of different cocktails containing that ingredient. When chosen a cocktail the user can also see what Swedish produced alcohol that Systembolaget provides.
To see the upstream repo for our client interface:
* [Client](https://github.com/CraftAcademy/team_2_grog_bot_client)

### External Api's:
[CocktailDB](https://www.thecocktaildb.com/api.php)
[Systembolaget](https://api-portal.systembolaget.se/)

## Getting started
### Dependencies  
* rack-cors
* rest-client
* ruby-measurement
* unitwise
* webmock
* coveralls
* pry-rails
* byebug
* rspec-rails
* shoulda-matchers
* factory_bot_rails


### Setup   
To test this application, fork the repo to your own GitHub account and clone it to your local workspace. </br>
*Note:*Be sure to set up the front end (noted above), in order to fully interact with the application. 
To install all of the dependencies:  
```
$ bundle install 
```
To create a new database with sample data:  
```
$ rails db:create db:migrate db:seed 
```
To run the unit tests:  

```
$ rspec
``` 
  
To start the application and run it on your local host:
```
$ rails s
```


## Updates/Improvements   
- Functionaliy for user to choose several ingredients and get a more narrow result.
- Sanitizing the response from the Systembolaget API to not have the client handle too much unnessecary information
- Functionality for a user to log in and keep track of previous search results

## License  
[MIT-license](https://en.wikipedia.org/wiki/MIT_License)

### Acknowledgement  
- Material provided by [Craft Academy](https://craftacademy.se)

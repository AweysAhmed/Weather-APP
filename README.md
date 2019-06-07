
The application is built using Ruby on Rails. 

After you pull this from my github repository, you will need to start the rails server by typing "rails s" in 
the terminal. You'll need to be in the correct directory. 

You will need to create an account our you can use my login details which will be included in the email to Lauren.

One you login, you will be able to search for the weather conditions of a city. It will render the weather conditions 
from two weather apis. One is from Open weather map and the other is weatherbit. 

I have created a Users model and a temperature model. The temperature model would belong_to a user and a user could would 
have (has_many) temperatures. The temperatures table would store: city:string temperature:integer humidity:integer and 
conditions:string.


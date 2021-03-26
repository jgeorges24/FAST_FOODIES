register page
page to show form 
page shows all the foods and details price description
allows user to CRUD rows or food in foods table


change colum in user to password_digest 
install bcrypt



questions 
1. pages won't load after inputting information email and name and password to /signup
2. database stores username name and passwor_digest
3. stytling the website with a nav bar and setting it up
4. work on show page for each food entry for show page when user request for page by ID.
5. after sign up page does not responds to button or redirects

10. create foods form for entry of foods row ie food name, price, 

**** check edit for errors 12. with food entry form how to make healthy radio dial button valid with healthy? boolean in databse

done up top 


6. must add flash messages for errors bonus



7. use "redirect "/login" if !logged_in?" saftey method for unauthorized access to those pages if not logged in.

8. must protect those routs for food.rb with current_user helper method.


9. use private methods to make this easire with protecting info only for current user


11. use the private method in food_controller to redirect if not user to protect those routes from being seen



13. make validations meet uniquness 


14. delete food entries, user must be able to delete food entry



15. able to sign up even though i'm still logged in, this should not be possible.


NEW NOTES

1. delete button not going through or responding on show erb page, Rack::methodoverride

2. search bar to delete a food entry

3. tough to fix or error handle like after deleting an entry and if a user goes tot hat entry it gives an error, for example if i delete food entry ID 3, and i load that :ID, ex.. /Foods/3 i get an error

4. UPDATE FOOD ENTRY BUTTON NOT PUSHING thROUGH tO EDIT PAGE FOR FOOD ENTRY -- USED a tags instead

5. RENDER A 404 page for the results or food entrys not listed


work on

home page 

user login home page

background

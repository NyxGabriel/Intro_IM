**Meditative Spiral**

Final Project for Intro to IM by Nicole Dobreva

The goal of this project was to create a program that recognizes speech and displpays it in a spiral while also 
creating a word cloud of the most commonly used words in the center of the screen. It is supposed to be a type of a diary that just gives you a bit of statistical 
insight into your thoughts/ the language you use. 
In order to exit the program you have to press Backspace. That will save your current session in a file called Diary. For your next session you would have to upload this file to the sketch. 
The easiest way to work with the multiple sessions is to add them in one .txt file and upload it every time. 
I guess I could connect it to an online database so that results can be saved and accessed through there but I am not sure it will work with our pssword, MFA protected Google Drives. 

Here is a link to the [Meditative Spiral]().

The creation of this spiral was not easy. First I had to move from processing to p5 as the Processing speech recognition library was old and did not work. 
Credit for the speech regocnition can be found [here] ().

Then I borrowed some code from []() to help me visualize the text in a spiral. Although it was a good start a lot of modifications had to be made in order for the code to dynamically take input, show it in different spirals etc. 

The last component was the creation of the word cloud. It is borrowed from [](). I used the sort by count of the concodrance in order to get the values I needed. 

As much as I found helful code on the internet to help me in this endaviour I still faced some issues. 

1. The speech recognition is very slow, which slows down the rest of the code. It does not create a very pleasant and smooth user expirience as I was hoping for. 
Maybe with more time and maybe some expert help I could fix the library and make it be faster.  
Another issue that comes from there is that the clear word cloud and display word cloud functions sometimes are seen. I am not sure why this happens but I have obsreved it happens if I have said a lot of things that the Speech recognizor has to deal with.

2. Due to the online nature of this editor I could not create a database where each session could be collected and then uploaded back in order to the word cloud to reflect all sessions until now.
When saved the current session is saved on your private computer and you have to upload it in order for it to be read.
However combined with the next issue this was not a big problem. 

3. The size of the word cloud had to dynamically change in order to fit all the words in the center of the smallest possible spiral. However, I could not figure out a good algorithm that would visually reflect the number of times a word has been mentioned and also change in order to fit all of the words inside the word cloud. Thus I decided that only the 4 most common words would be displayed. This way I didn't have to worry about the bounds and also made the function of multiplpe entries in a diary kind of obsolete as only the 4 most commons words would be displayed and that is not a lot. 


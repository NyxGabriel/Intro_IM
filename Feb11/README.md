**Multiple Inputs and Outputs**

For my multiple inputs and output project I decided to play with an input sensor we haven’t yet used and that I tried using in class but it didn’t work so I decided to figure it out: photo resistor.  

I had to learn how to us it first and I googled it and found out you have to use the analog read as it gives more values than just on or off, but also everything it detects in between.
As I was looking into that I realised that the LEDs can also be analog and so they can change their brightness. 
Here is a video: https://youtu.be/1EujbaSOVfk

My circuit works by pressing the switch to turn the two LEDs on and then by increasing the light coming into the photo resistor they will get dimmer. 

I had to figure out what values the photo resistor gives and that was kind of hard, but by printing them in the serial monitor I managed to see that the room was about 790 brightness and when I shine a light to it, it is above 1000. Also I created a counter for the button so that you don’t have to hold is but instead it act like a switch. An issue with that is that you have to be fast in pressing it because if you hold it, you will add to the counter and it might not be correct with which there are sometimes still issues. 

Issues and concerns:
I cannot make the photo resistor show a zero even when I blind it fully, the minimum I can get is around 350. The internet said that different photo visitors have different values so I guess it might be the case this one goes from about 350 to about 1200. 

The speed with which you press the button really matters because of the loop that updates super fast so you have to move fast. 


**Humble Interactive Simulation of Covid-19 Spread**
*Using Objects*

I have created a simple simulation of a virus spread. One can change the probability of getting the virus, the spread at which it can be spread and I have also introduced social distancing. 
[Here is a link to the video](https://youtu.be/HjHSbS5N2Nc "Video of Simulation")


The issues I have are the following:

1) I couldnt decided what to call a time step in order to be able to show the progression in terms of "time". 

2 )When doing the check for the social distancing the code iterates over all other "People" present. 
However, as this takes time and they also move a lot it is not always accuarate. 
So somebody could be trying to move away from somebody else but while doing so get sick from another neighbought they already checked just now and they moved, or somebody new. 
This is unfortunate and I could use advice on how to fix it. 

Creadit to [controlP5](http://www.sojamo.de/libraries/controlP5/#about "About controlP5"), a library written by Andreas Schlegel for the programming environment processing. 
I created the GUI with it. 

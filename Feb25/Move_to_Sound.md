**Move to Sound**
I wanted to create a device similar to a Theremin but with a base, that can provide rhythm. The ultrasonic sensory would be the keyboard and the servo will move something to make a noise for the rhythm. 

However, using an ultrasonic sensor I cannot control both volume and frequency. So I decided to settle on the more important one - frequency. I use an ultrasonic sensor to detect the distance from the sensor and map it to the frequency. But once I tested it it didn’t work very well as the notes frequencies are very broad from  35 to almost 4800. So I decided to instead map the distance to a particular note - they are 88 in total. And although this is a smaller map it worked and is somewhat controllable if you learn, as the resolution of  the ultrasonic sensor is 0.3 and the delay between the beginning and return of the impulse is 5 milliseconds, you have to be very prescience to play exact notes. I also settled on mapping them oppositely that is the close you are to the sensor the higher the notes are. Then I wanted to add the base. I was thinking about banging a spoon against a pan as I was thinking of materials I have access to. However, I randomly found a bell on the floor of one classroom in A4 and decided to use it for the rhythm instead. The user has the option to control the bell by pressing or holding a button. 

Here is the schematic of the circuit: 
<p align="center">
  <img src="project3_circut_schematic.jpg" width="350" title="Ugly circuit">
</p>

Here is how it looks in real life:
<p align="center">
  <img src="project3_circut_schematic.jpg" width="350" title="Ugly circuit">
</p>


And here is a video of it: 
[Video]()

Issues:

1. The servo makes more noise than the bell no matter how fast or slow I move it. I guess that is going to be the rhythm. 
2. Also it moves around a lot, so I had to find a stabiliser for it. 
3. The readings from the ultrasound are sometimes too slow and it doesn’t know what to play.
4. Hitting all notes with the ultrasound sensor is quite hard. 
5. The ultrasound has a backbeat the although contributes to the piece. I am guessing that that happens because of low frequency notes that cannot actually be played by the buzzer or heard by us. 

*Indoor Ashtray*

I wanted to use recycled parts as usual and so I dug in the misalencious items in the lab until I got inspired enough to create something out of them. I selected a computer fan and two wooden plates. I decided to make an indoor ashtray that blows the smoke away from the smoker and provides a place to ash your cigarettes and keep the butts. 

I wanted it to be used for smokers who smoke with either hand, so there is the option to use the left or the right ashtray. There is a stand for the user’s hand where they can rest it comfortably. Inside the stand there are two pressure sensors on either side that turn on an LED that indicates which ashtray is currently in use. When an ashtray fills up a red LED turns on to indicate it needs to be replaced. The fan turns on when there is a hand in the stand by using photoresists placed in the base of the constructions. 

This is the circuit diagram:
<p align="center">
  <img src="ashtraycircuit.jpg" width="350" title="Ugly circuit">
</p>

This is a photo of how the device looks on top and underneath:

<p align="center">
  <img src="attempt1.jpg" width="350" title="Ugly underwire">
</p>

Second Iteration looks like this:

<p align="center">
  <img src="attempt2.jpg" width="350" title="Pretty fake wire">
</p>

For this one I tried to use female ports stacked on top of each other with the naked wires plugged inside. However, for some reason that did not work. The serial would print zeros which is very weird: it did not read random values like it does usually when it is not connected properly but read all zero. This is very exceptional and I do not know why it has happened. 

Issues: 
- I soldiered everything and nothing works. I though we had to do this because we learned soldering I guess we didn’t. Explanation below:

- At first there was an issue because there aren’t enough spaces for ground and 5V on the protoshield, so I included a few more however it turned out that the centre pieces that look like they are connected are not actually connected so I had to solder them together. But because they are so close to each other multiple times I connected ground and 5vs which was not very good. 

- The size of the stripped part of the wire matters a lot and you have to count it into the size of the whole wire.

- I had to change the computer I am using since my macbook was giving me a lot of trouble having to be restarted every time I had to upload something as it would lose the driver. 


2nd Attempt

I am guessing that the naked wires didn’t reach into the metal plates of the female ports stacked on top of each other. 


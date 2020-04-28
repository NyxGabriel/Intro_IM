//create images types 
PImage img; //initial
PImage final_img; //final
color c; //color value of initial image
color c_final; //color value of final image
//RGB for initial image
float c_r;
float c_b;
float c_g;
//RGB generated 
float cd_r;
float cd_b;
float cd_g;
//RBG for final image
int cf_r;
int cf_b;
int cf_g;


void setup() {
  size(600, 600);
  //load images and pixels to work with
  img = loadImage("me.png");
  img.resize(0, 600);
  final_img = img;
  img.loadPixels();
  final_img.loadPixels();

  //Go through each pixel in original image, 
  //check RGB values and change them to some random values, a
  //and then display them in the new image
  for (int p=0; p<img.width*img.height; p++) {

    color c = img.pixels[p]; //get color of Pixel
  //Get each color component value
    c_r = red(c); 
    c_b = blue(c);
    c_g = green(c);

    //if component in given range 
    if (c_r<random(150) && c_r>random(50)) {
      ///change
      cd_r = random(255);
      cf_r=int(cd_r);
    }
    if (c_b<random(160) && c_b>random(100)) {
      cd_b = random(255);
      cf_b=int(cd_b);
    }
    if (c_g<random(202) && c_g>random(80)) {
      cd_g = random(255);
      cf_g=int(cd_g);
    }
    //create the color from the RGB values
    color cfp=color(cf_r, cf_b, cf_g);
    final_img.pixels[p]= cfp; //assign to new pixel
  }
  image(final_img, 0, 0); //load image
}
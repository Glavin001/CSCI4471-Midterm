// FEEL FREE TO CHANGE ANY OF THE VALUES, BUT PLEASE USE THESE VARIABLE NAMES
// AS A START. OF COURSE, YOU MIGHT NOT NEED TO USE ALL OF THE VARIABLES I HAVE DECLARED HERE,
// AND YOU CAN ALSO CREATE ADDITIONAL VARIABLES AS NEEDED.


float sunSize = 50; // radius of sun
float sunSpin = 0.0; // initial angle of sun rotation
float sunTilt = 0.0; // tilt of sun

float earthSize = 30 ; // radius of earth
float earthSpin = 0.0 ; // initial angle of earth rotation (about its own axis)
float earthTilt = 0.45; // tilt of earth's axis
float earthOrbit = 0.0 ; // initial angular value of earth's orbit around the sun

float moon1Size = 20 ; // radius of moon 1  (in case you create a moon2 later on)
float moon1Spin = 0.0 ;
float moon1Tilt = 0.0 ;
float moon1Orbit = 0.0 ;

float distSunEarth = 200 ; 
float distEarthMoon1 = 55 ;


void setup() { 
  size(640, 640, P3D);
  noStroke();  
} 

// YOU MIGHT WANT TO CREATE A DRAW-BODY FUNCTION THAT DRAWS A PLANETARY BODY, 
// GIVEN SOME INPUT PARAMETERS SUCH AS SIZE, ORBIT, etc (EXACTLY WHAT THOSE INPUT PARAMS WOULD BE IS YOUR
// CHOICE).


void draw() {
  
  lights();
  
  background(0, 0, 26);
  fill(250);
  translate(width/2, height/2); 
  
  
  // draw sun 
  fill(250,250,0);  // YELLOW
  sphereDetail(4); // THIS MAKES IT LOW RESOLUTION SO THAT WE CAN SEE THE SPINNING CLEARLY
  sphere(sunSize);

  // draw earth
  rotateY(earthOrbit); // a)
  translate(distSunEarth,0);
  fill(0,0,250); // BLUE
  sphere(earthSize);
  
  // Make the moon gray. 
  // Note that the colours are actually important for debugging, so that you know which sphere you are
  // looking at.
  rotateY(moon1Orbit); // b)
  translate(distEarthMoon1,0);
  fill(250,250,250); // GREY
  sphere(moon1Size);
  
  earthOrbit += 0.01;  // RIGHT NOW THIS DOES NOTHING, BUT THIS IS AN EXAMPLE OF HOW YOU CAN UPDATE THE GLOBAL
                      //  VARIABLES SO THAT THEY KEEP INCREMENTING EVERYTIME THE draw() FUNCTION IS CALLED
  moon1Orbit += 0.05;
} 


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
float earthAxis = 0.0; // tilted axis of earth around sun

float moon1Size = 20 ; // radius of moon 1  (in case you create a moon2 later on)
float moon1Spin = 0.0 ;
float moon1Tilt = 0.0 ;
float moon1Orbit = 0.0 ;
boolean moon1Planar = true ; // if true then moon orbits the earth in the same plane as the earth orbists the sun

float distSunEarth = 200 ; 
float distEarthMoon1 = 55 ;

boolean topView = false;

void setup() { 
  size(640, 640, P3D);
  noStroke();  
} 

// YOU MIGHT WANT TO CREATE A DRAW-BODY FUNCTION THAT DRAWS A PLANETARY BODY, 
// GIVEN SOME INPUT PARAMETERS SUCH AS SIZE, ORBIT, etc (EXACTLY WHAT THOSE INPUT PARAMS WOULD BE IS YOUR
// CHOICE).

void drawEarthAndMoon(float earthAxis, float earthOrbit, float distSunEarth, float earthTilt, float earthSpin, float earthSize, boolean moonPlanar, float moonOrbit, float distEarthMoon, float moonSize) {
  pushMatrix(); // Save Sun matrix

  // draw earth
  rotateZ(earthAxis);
  rotateY(earthOrbit);
  translate(distSunEarth,0);
  rotateY(-earthOrbit);
  rotateZ(earthTilt);
  rotateY(earthSpin);
  fill(0,0,250); // BLUE
  dsphere(earthSize);
  
  // 1e) moon planar
  if (moon1Planar) {
   rotateY(-earthSpin);
   rotateZ(-earthTilt);
   rotateY(earthSpin);
  }
  // Draw moon
  rotateY(moon1Orbit);
  translate(distEarthMoon,0);
  // Make the moon gray. 
  // Note that the colours are actually important for debugging, so that you know which sphere you are
  // looking at.
  fill(250,250,250); // GREY
  dsphere(moonSize);
    
  // Restore sun matrix
  popMatrix();
  
}

void dsphere(float s) {
 sphere(s); 
}

void draw() {

  
  lights();
  
  background(0, 0, 26);
  fill(250);
  translate(width/2, height/2);

  if (topView) {
    rotateX(radians(90));
  }
  
  // draw sun 
  fill(250,250,0);  // YELLOW
  sphereDetail(2); // THIS MAKES IT LOW RESOLUTION SO THAT WE CAN SEE THE SPINNING CLEARLY
  dsphere(sunSize);

  // Earth and moon pair 1
  drawEarthAndMoon(earthAxis, earthOrbit, distSunEarth, earthTilt, earthSpin, earthSize, moon1Planar, moon1Orbit, distEarthMoon1, moon1Size);

  // Earth and moon pair 2
  drawEarthAndMoon(earthAxis+0.5, earthOrbit/0.9, distSunEarth, earthTilt, earthSpin, earthSize, moon1Planar, moon1Orbit, distEarthMoon1, moon1Size);
  
  // Tick
  earthOrbit += 0.01;  // RIGHT NOW THIS DOES NOTHING, BUT THIS IS AN EXAMPLE OF HOW YOU CAN UPDATE THE GLOBAL
                      //  VARIABLES SO THAT THEY KEEP INCREMENTING EVERYTIME THE draw() FUNCTION IS CALLED
  earthSpin += 0.03; 
  moon1Orbit += 0.05; // Moon orbit around earth is 5 times earth orbit around sun

  
  
} 


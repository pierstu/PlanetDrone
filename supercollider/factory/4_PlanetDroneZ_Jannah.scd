s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

 (

   s.options.numWireBufs = (8192*12000);

   x = {

   arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a=0,
   planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;
  
      FreqShift.ar(

       GVerb.ar(
        
        x=Saw.ar([50+(planetDrone_1a*50),50.1+(planetDrone_2a*50)]);8.do{|i|f=2**(8-i+(planetDrone_3a*6));x=BRF.ar(AllpassN.ar(x,1,0.1/(12-i+abs(planetDrone_4a*47)),2),80**TRand.ar(0,1,Impulse.ar(f/32,1/2)).lag(1/f)*80,2)};x,

       roomsize: 400, revtime: 4, damping: 0.65, inputbw: 0.46, spread: 16, drylevel: -3, earlyreflevel: -4.47, taillevel: 0.65, maxroomsize: 401, mul: 1.0, add: 0),

      0+planetDrone_effect_1*225) / ((2..8)+   SinOsc.ar(freq: 0.025+(planetDrone_effect_3*2.25), phase: 0.0, mul: planetDrone_effect_2*0.75, add: 0.0) )

   }.play;

  s.volume = -95;

 )

}

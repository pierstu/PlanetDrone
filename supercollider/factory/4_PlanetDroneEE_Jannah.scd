s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

 (

   s.options.numWireBufs = (8192*12000);

   x = {

   arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a=0,
   planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;
  
       FreqShift.ar(

	    GVerb.ar(

		 SinOsc.ar(LFNoise0.ar(10).range(
				100+(planetDrone_1a*1000)    + SinOsc.ar(freq: 0.03, phase: 0.0, mul: (planetDrone_4a*251), add: 0.0)   ,
				10000+(planetDrone_2a*10000) + SinOsc.ar(freq: 0.03, phase: 0.0, mul: (planetDrone_4a*522), add: 0.0)  ),
			    0,0.095)*Decay.kr(Dust.kr(1))*LFNoise1.ar(40+(planetDrone_3a*8000)),

	    299,400,0.5,0.5,50,0,0.2,0.9),

	   0+planetDrone_effect_1*500) / ((2..8)+   SinOsc.ar(freq: 0.00025+(planetDrone_effect_3), phase: 0.0, mul: planetDrone_effect_2*0.25, add: 0.0) )

   }.play;

  s.volume = -95;

 )

}

s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

 (

   s.options.numWireBufs = (8192*12000);

   x = {

   arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a=0,
   planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;
  
       GVerb.ar(

		~bohlen=[1,27/25,25/21,9/7,7/5,75/49,5/3,9/5,49/25,15/7,7/3,63/25,25/9,3];

		{a=LFTri.ar(1/3+abs(planetDrone_3a*75));7.do{a=BAllPass.ar(a,PinkNoise.kr(0.1+(planetDrone_1a*8),35+abs(planetDrone_2a*700)),1);
			a=BAllPass.ar(a,LFNoise0.kr(7/8,2400,2200),2);a=(a*LFNoise0.kr(3/4,7+(planetDrone_4a*25),2)).tanh;a=LeakDC.ar(a)};a/10}!2,

       roomsize: 300, revtime: 3, damping: 0.55, inputbw: 0.26, spread: 16, drylevel: -7, earlyreflevel: -2.47, taillevel: 0.26, maxroomsize: 301, mul: 1.0, add: 0)

   }.play;

  s.volume = -95;

 )

}

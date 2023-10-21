s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

 (

   x = {

      arg planetDrone_1a=0,
      planetDrone_2a=0,
      planetDrone_3a=0,
      planetDrone_4a=0,
      planetDrone_effect_1=0,
      planetDrone_effect_2=0,
      planetDrone_effect_3=0;

      a=Impulse;
     
       GVerb.ar(

        tanh(a.kr(8+(planetDrone_1a*8)).lag*Crackle.ar(LFSaw.kr(3+(planetDrone_2a*10)).abs.lag*1.8)
	+GVerb.ar([a.kr(2+(planetDrone_4a*75))+a.kr(4,0.5)].lag*Blip.ar(5.9+(planetDrone_3a*40),7,0.4)!2,1,1)*5),

       roomsize: 2, revtime: 0.6+(planetDrone_effect_1*0.4), damping: 0.165, inputbw: 0.46, spread: 25, drylevel: -6+(planetDrone_effect_2*50), earlyreflevel: -10.47+(planetDrone_effect_3*70), taillevel: -10.076, maxroomsize: 100, mul: 1.0, add: 0)

   }.play;

  s.volume = -95;

 )

}

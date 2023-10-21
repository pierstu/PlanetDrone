s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

 (

   x = {

   arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a=0,
   planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;
  
   var factor = 300;

   factor = factor + (abs(planetDrone_effect_3)*1272);

       FreeVerb.ar(

        LPF.ar(

         BPF.ar(

              Splay.ar({|i|f=2.5**i/(128);
	      BPF.ar(PinkNoise.ar(1!2),abs(planetDrone_1a*99)+SinOsc.ar(freq: 0.03+abs(planetDrone_2a*5),phase: 0.0, mul: 0.0125,
	      add: 0.0)+4**LFNoise2.kr(1.2**i/16)*factor,0.15)*(4**LFNoise2.ar(f)/(i+8)*200)}!14),

	   800+abs(planetDrone_3a*750), 0.9, 0.15),

	(900+(planetDrone_4a*750)), 0.9, 0.15),

       0.1 + planetDrone_effect_1, 0.1 + planetDrone_effect_2)

   }.play;

  s.volume = -95;

 )

}

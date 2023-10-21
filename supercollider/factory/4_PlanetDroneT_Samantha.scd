s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

 (

   x = {

     arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a = 0,
	   planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;

     a=Saw;

     FreqShift.ar(

     FreeVerb.ar(

     GVerb.ar(Splay.ar(BBandPass.ar(a.ar("8234986".ascii),a.ar((2+(planetDrone_4a*45))/"slow".ascii)*1000+(800+(planetDrone_1a*475)),a.ar((8.6+(planetDrone_3a*30))/"c7ding".ascii)+(0.0162+abs(planetDrone_2a*0.75)))/1.75)),

     0.1 + planetDrone_effect_1, 0.1 + planetDrone_effect_2),

     (0 + (planetDrone_effect_3*0.75)) / (4..8)
     );


   }.play;

  s.volume = -95; // -15;

 )

}

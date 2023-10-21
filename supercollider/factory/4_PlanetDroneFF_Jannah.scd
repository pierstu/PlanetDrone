s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

 (

   s.options.numWireBufs = (8192*12000);

   x = {

   arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a=0,
   planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;
  
   var pd_1a = planetDrone_1a*750, pd_2a = planetDrone_2a*750, pd_3a = planetDrone_3a*170, pd_4a = planetDrone_4a*750;

       FreqShift.ar(

	    GVerb.ar(

	    Klank.ar(`[[40,99,98,953,923],nil,[1,1,1,1]],
            GVerb.ar(CombC.ar(Gendy1.ar(6,6,3,Dust.ar([99+pd_1a,98+pd_2a    +SinOsc.ar(freq: 0.000125, phase: 0.0, mul: 4, add: 0.0)                     ],1),18+abs(pd_3a),
            375+abs(pd_4a       +SinOsc.ar(freq: 0.000525, phase: 0.0, mul: 3, add: 0.0)                      )),1,0.01,0.02),9,9,mul:0.005)),

	    roomsize: 80, revtime: 4.85, damping: 0.41, inputbw: 0.7, spread: 40, drylevel: -0, earlyreflevel: 0, taillevel: -11, mul: 0.008),

       0+planetDrone_effect_1*470) / ((2..9)+   SinOsc.ar(freq: 0.00039+(planetDrone_effect_3), phase: 0.0, mul: planetDrone_effect_2*0.38, add: 0.0) )

   }.play;

  s.volume = -95;

 )

}

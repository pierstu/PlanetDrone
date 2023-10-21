s.waitForBoot{ 

 "../OSCfunctions.scd".loadRelative;

 (

   s.options.numWireBufs = (8192*12000);

   x = {

   arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a=0,
   planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;
  
   var pd_1a = planetDrone_1a*750, pd_2a = planetDrone_2a*825, pd_3a = planetDrone_3a*17, pd_4a = planetDrone_4a*0.25;

       FreqShift.ar(

	    GVerb.ar(

	    a=SinOscFB;
		Splay.ar(a.ar(a.ar(b=1/(10..15),2)<b*450+90
                +SinOsc.ar(freq: 0.0173 + pd_4a, phase: 0.0, mul: pd_3a, add: 0.0))/7+a.ar(SinOsc.ar(freq: 0.0073, phase: 0.0, mul: pd_2a, add: 0.0)
                +pd_1a+600*b,a.ar(a.ar(b,1)>0.1+1,1.05)%b,a.ar(0.1-b,1.744).min(0)))/2,

	    roomsize: 180, revtime: 30, damping: 0.47, inputbw: 0.7, spread: 40, drylevel: 40, earlyreflevel: 0, taillevel: -11, mul: 0.3),

	   0+planetDrone_effect_1*500) / ((2..8)+   SinOsc.ar(freq: 0.00025+(planetDrone_effect_3), phase: 0.0, mul: planetDrone_effect_2*0.25, add: 0.0) )

   }.play;

  s.volume = -95;

 )

}

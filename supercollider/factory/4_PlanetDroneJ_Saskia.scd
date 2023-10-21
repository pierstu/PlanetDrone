s.waitForBoot{ 


 "../OSCfunctions.scd".loadRelative;

(

   // Your code here (Example Below) ===========================================================================
   x = {

   arg planetDrone_1a=0, planetDrone_2a=0, planetDrone_3a=0, planetDrone_4a = 0, planetDrone_effect_1=0, planetDrone_effect_2=0, planetDrone_effect_3=0;

   GVerb.ar(GVerb.ar(Impulse.ar([8+(planetDrone_1a*16),6+(planetDrone_2a*16),4+(planetDrone_3a*16)]/100,[0,0.2,0.6])*8,[2-( planetDrone_4a*0.125 ),3,1.5],abs(12+(planetDrone_effect_1*25)),drylevel:0).sum.sin.sum*0.5,62-abs(planetDrone_effect_2*100),24+(planetDrone_effect_3*23)).tanh

   }.play;

   s.volume = -95; // Set to -15 for patch creation

   // ==========================================================================================================

 )

}
